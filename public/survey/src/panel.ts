import { Serializer } from "./jsonobject";
import { HashTable, Helpers } from "./helpers";
import {
  Base,
  ISurveyImpl,
  IPage,
  IPanel,
  IConditionRunner,
  IElement,
  ISurveyElement,
  IQuestion,
  SurveyElement,
  SurveyError,
  ISurveyErrorOwner,
  ITitleOwner,
  IProgressInfo,
} from "./base";
import { Question } from "./question";
import { ConditionRunner } from "./conditions";
import { QuestionFactory } from "./questionfactory";
import { ILocalizableOwner, LocalizableString } from "./localizablestring";
import { OneAnswerRequiredError } from "./error";
import { PageModel } from "./page";
import { settings } from "./settings";
import { findScrollableParent, isElementVisible } from "./utils/utils";

export class DragDropInfo {
  constructor(
    public source: IElement,
    public target: IElement,
    public nestedPanelDepth: number = -1
  ) {}
  public destination: ISurveyElement;
  public isBottom: boolean;
  public isEdge: boolean;
}

export class QuestionRowModel extends Base {
  private static rowCounter = 100;
  private static getRowId(): string {
    return "pr_" + QuestionRowModel.rowCounter++;
  }
  private _scrollableParent: any = undefined;
  private _updateVisibility: any = undefined;
  public startLazyRendering(rowContainerDiv: HTMLElement) {
    this._scrollableParent = findScrollableParent(rowContainerDiv);
    this._updateVisibility = () => {
      var isRowContainerDivVisible = isElementVisible(rowContainerDiv, 50);
      if (!this.isNeedRender && isRowContainerDivVisible) {
        this.isNeedRender = true;
        this.stopLazyRendering();
      }
    };
    setTimeout(() => {
      this._scrollableParent.addEventListener("scroll", this._updateVisibility);
      this._updateVisibility();
    }, 10);
  }
  public stopLazyRendering() {
    if (!!this._scrollableParent && !!this._updateVisibility) {
      this._scrollableParent.removeEventListener(
        "scroll",
        this._updateVisibility
      );
    }
    this._scrollableParent = undefined;
    this._updateVisibility = undefined;
  }
  private idValue: string;
  constructor(public panel: PanelModelBase) {
    super();
    this.idValue = QuestionRowModel.getRowId();
    this.isNeedRender = !settings.lazyRowsRendering;
    this.visible = panel.areInvisibleElementsShowing;
    this.createNewArray("elements");
  }
  public get id(): string {
    return this.idValue;
  }
  public get elements(): Array<IElement> {
    return this.getPropertyValue("elements");
  }
  public get visible(): boolean {
    return this.getPropertyValue("visible", true);
  }
  public set visible(val: boolean) {
    this.setPropertyValue("visible", val);
  }
  public get isNeedRender(): boolean {
    return this.getPropertyValue("isneedrender", true);
  }
  public set isNeedRender(val: boolean) {
    this.setPropertyValue("isneedrender", val);
  }
  public get visibleElements(): Array<IElement> {
    return this.elements.filter((e) => e.isVisible);
  }
  public updateVisible() {
    this.visible = this.calcVisible();
    this.setWidth();
  }
  public addElement(q: IElement) {
    this.elements.push(q);
    this.updateVisible();
  }
  public get index(): number {
    return this.panel.rows.indexOf(this);
  }
  private setWidth() {
    var visCount = this.visibleElements.length;
    if (visCount == 0) return;
    var counter = 0;
    var preSetWidthElements = [];
    for (var i = 0; i < this.elements.length; i++) {
      var el = this.elements[i];
      this.setElementMaxMinWidth(el);

      if (el.isVisible) {
        var width = this.getElementWidth(el);
        if (!!width) {
          el.renderWidth = this.getRenderedWidthFromWidth(width);
          preSetWidthElements.push(el);
        }
        el.rightIndent = counter < visCount - 1 ? 1 : 0;
        counter++;
      } else {
        el.renderWidth = "";
      }
    }
    for (var i = 0; i < this.elements.length; i++) {
      var el = this.elements[i];
      if (!el.isVisible || preSetWidthElements.indexOf(el) > -1) continue;
      if (preSetWidthElements.length == 0) {
        el.renderWidth = (100 / visCount).toFixed(6) + "%";
      } else {
        el.renderWidth = this.getRenderedCalcWidth(
          el,
          preSetWidthElements,
          visCount
        );
      }
    }
  }
  public setElementMaxMinWidth(el: IElement): void {
    if (
      el.width &&
      typeof el.width === "string" &&
      el.width.indexOf("%") === -1
    ) {
      el.minWidth = el.width;
      el.maxWidth = el.width;
    }
  }

  private getRenderedCalcWidth(
    el: IElement,
    preSetWidthElements: Array<IElement>,
    visCount: number
  ): string {
    var expression = "100%";
    for (var i = 0; i < preSetWidthElements.length; i++) {
      expression += " - " + preSetWidthElements[i].renderWidth;
    }
    var calcWidthEl = visCount - preSetWidthElements.length;
    if (calcWidthEl > 1) {
      expression = "(" + expression + ")/" + calcWidthEl.toString();
    }
    return "calc(" + expression + ")";
  }
  private getElementWidth(el: IElement): string {
    var width = el.width;
    if (!width || typeof width !== "string") return "";
    return width.trim();
  }
  private getRenderedWidthFromWidth(width: string): string {
    return Helpers.isNumber(width) ? width + "px" : width;
  }
  private calcVisible(): boolean {
    return this.visibleElements.length > 0;
  }
}

/**
 * A base class for a Panel and Page objects.
 */
export class PanelModelBase
  extends SurveyElement
  implements IPanel, IConditionRunner, ILocalizableOwner, ISurveyErrorOwner {
  private static panelCounter = 100;
  private static getPanelId(): string {
    return "sp_" + PanelModelBase.panelCounter++;
  }

  private elementsValue: Array<IElement>;
  private isQuestionsReady: boolean = false;
  private questionsValue: Array<Question> = new Array<Question>();
  addElementCallback: (element: IElement) => void;
  removeElementCallback: (element: IElement) => void;
  onGetQuestionTitleLocation: () => string;

  constructor(public name: string = "") {
    super(name);
    this.createNewArray("rows");
    this.elementsValue = this.createNewArray(
      "elements",
      this.onAddElement.bind(this),
      this.onRemoveElement.bind(this)
    );
    this.registerFunctionOnPropertyValueChanged(
      "questionTitleLocation",
      this.onVisibleChanged.bind(this)
    );
    this.id = PanelModelBase.getPanelId();
    this.createLocalizableString("title", this, true);
    this.createLocalizableString("description", this, true);
    this.createLocalizableString("requiredErrorText", this);
  }
  public getType(): string {
    return "panelbase";
  }
  public setSurveyImpl(value: ISurveyImpl) {
    super.setSurveyImpl(value);
    if (this.isDesignMode) this.onVisibleChanged();
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].setSurveyImpl(value);
    }
  }
  endLoadingFromJson() {
    super.endLoadingFromJson();
    this.markQuestionListDirty();
    this.onRowsChanged();
  }
  /**
   * PanelModel or PageModel title property.
   * @description
   */
  public get title(): string {
    return this.getLocalizableStringText("title");
  }
  public set title(val: string) {
    this.setLocalizableStringText("title", val);
  }
  get locTitle(): LocalizableString {
    return this.getLocalizableString("title");
  }
  get _showTitle(): boolean {
    return (
      ((<any>this.survey).showPageTitles && this.title.length > 0) ||
      (this.isDesignMode && settings.allowShowEmptyTitleInDesignMode)
    );
  }

  public getTitleActions(): Array<any> {
    var titleActions = super.getTitleActions()
    this.titleActions = this.survey.getUpdatedPanelTitleActions(
      this,
      titleActions
    );
    return this.titleActions;
  }

  get _showDescription(): boolean {
    return (
      ((<any>this.survey).showPageTitles && this.description.length > 0) ||
      (this.isDesignMode &&
        settings.allowShowEmptyTitleInDesignMode &&
        settings.allowShowEmptyDescriptionInDesignMode)
    );
  }
  /**
   * PanelModel or PageModel description property. It renders under title by using smaller font. Unlike the title, description can be empty.
   * @see title
   */
  public get description(): string {
    return this.getLocalizableStringText("description");
  }
  public set description(val: string) {
    this.setLocalizableStringText("description", val);
  }
  get locDescription(): LocalizableString {
    return this.getLocalizableString("description");
  }
  public locStrsChanged() {
    super.locStrsChanged();
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].locStrsChanged();
    }
  }
  /**
   * Returns the char/string for a required panel.
   * @see SurveyModel.requiredText
   */
  public get requiredText(): string {
    return this.survey != null && this.isRequired
      ? this.survey.requiredText
      : "";
  }
  protected get titlePattern(): string {
    return !!this.survey ? this.survey.questionTitlePattern : "numTitleRequire";
  }
  public get isRequireTextOnStart() {
    return this.isRequired && this.titlePattern == "requireNumTitle";
  }
  public get isRequireTextBeforeTitle() {
    return this.isRequired && this.titlePattern == "numRequireTitle";
  }
  public get isRequireTextAfterTitle() {
    return this.isRequired && this.titlePattern == "numTitleRequire";
  }
  /**
   * The custom text that will be shown on required error. Use this property, if you do not want to show the default text.
   */
  public get requiredErrorText(): string {
    return this.getLocalizableStringText("requiredErrorText");
  }
  public set requiredErrorText(val: string) {
    this.setLocalizableStringText("requiredErrorText", val);
  }
  get locRequiredErrorText(): LocalizableString {
    return this.getLocalizableString("requiredErrorText");
  }
  getLocale(): string {
    return this.survey
      ? (<ILocalizableOwner>(<any>this.survey)).getLocale()
      : "";
  }
  getMarkdownHtml(text: string, name: string) {
    return this.survey
      ? this.survey.getSurveyMarkdownHtml(this, text, name)
      : null;
  }
  getProcessedText(text: string): string {
    return this.textProcessor
      ? this.textProcessor.processText(text, true)
      : text;
  }
  /**
   * A parent element. It is always null for the Page object and always not null for the Panel object. Panel object may contain Questions and other Panels.
   */
  public get parent(): PanelModelBase {
    return this.getPropertyValue("parent", null);
  }
  public set parent(val: PanelModelBase) {
    this.setPropertyValue("parent", val);
  }
  public get depth(): number {
    if (this.parent == null) return 0;
    return this.parent.depth + 1;
  }
  /**
   * An expression that returns true or false. If it returns true the Panel becomes visible and if it returns false the Panel becomes invisible. The library runs the expression on survey start and on changing a question value. If the property is empty then visible property is used.
   * @see visible
   */
  public get visibleIf(): string {
    return this.getPropertyValue("visibleIf", "");
  }
  public set visibleIf(val: string) {
    this.setPropertyValue("visibleIf", val);
  }
  public get cssClasses(): any {
    var classes = { panel: {}, error: {}, row: "" };
    this.copyCssClasses(classes.panel, this.css.panel);
    this.copyCssClasses(classes.error, this.css.error);
    if (!!this.css.row) {
      classes.row = this.css.row;
    }
    if (this.survey) {
      this.survey.updatePanelCssClasses(this, classes);
    }
    return classes;
  }
  protected get css(): any {
    return !!this.survey ? this.survey.getCss() : {};
  }
  /**
   * A unique element identificator. It is generated automatically.
   */
  public get id(): string {
    return this.getPropertyValue("id");
  }
  public set id(val: string) {
    this.setPropertyValue("id", val);
  }
  /**
   * Returns true if the current object is Panel. Returns false if the current object is Page (a root Panel).
   */
  public get isPanel(): boolean {
    return false;
  }
  public getPanel(): IPanel {
    return this;
  }
  getLayoutType(): string {
    return "row";
  }
  isLayoutTypeSupported(layoutType: string): boolean {
    return layoutType !== "flow";
  }
  /**
   * Returns the list of all questions located in the Panel/Page, including in the nested Panels.
   * @see Question
   * @see elements
   */
  public get questions(): Array<Question> {
    if (!this.isQuestionsReady) {
      this.questionsValue = [];
      for (var i = 0; i < this.elements.length; i++) {
        var el = this.elements[i];
        if (el.isPanel) {
          var qs = (<PanelModel>el).questions;
          for (var j = 0; j < qs.length; j++) {
            this.questionsValue.push(qs[j]);
          }
        } else {
          this.questionsValue.push(<Question>el);
        }
      }
      this.isQuestionsReady = true;
    }

    return this.questionsValue;
  }
  protected getValidName(name: string): string {
    if (!!name) return name.trim();
    return name;
  }
  /**
   * Returns the question by its name
   * @param name the question name
   */
  public getQuestionByName(name: string): Question {
    var questions = this.questions;
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].name == name) return questions[i];
    }
    return null;
  }
  /**
   * Returns the element by its name. It works recursively.
   * @param name the element name
   */
  public getElementByName(name: string): IElement {
    var elements = this.elements;
    for (var i = 0; i < elements.length; i++) {
      var el = elements[i];
      if (el.name == name) return el;
      var pnl = el.getPanel();
      if (!!pnl) {
        var res = (<PanelModelBase>pnl).getElementByName(name);
        if (!!res) return res;
      }
    }
    return null;
  }
  public getQuestionByValueName(valueName: string): Question {
    var questions = this.questions;
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].getValueName() == valueName) return questions[i];
    }
    return null;
  }
  /**
   * Returns question values on the current page
   */
  public getValue(): any {
    var data = {};
    var questions = this.questions;

    for (var i = 0; i < questions.length; i++) {
      var q = questions[i];
      if (q.isEmpty()) continue;
      var valueName = q.getValueName();
      (<any>data)[valueName] = q.value;
      if (!!this.data) {
        var comment = this.data.getComment(valueName);
        if (!!comment) {
          (<any>data)[valueName + settings.commentPrefix] = comment;
        }
      }
    }
    return data;
  }
  /**
   * Returns question comments on the current page
   */
  public getComments(): any {
    var comments = {};
    if (!this.data) return comments;
    var questions = this.questions;
    for (var i = 0; i < questions.length; i++) {
      var q = questions[i];
      var comment = this.data.getComment(q.getValueName());
      if (!!comment) {
        (<any>comments)[q.getValueName()] = comment;
      }
    }
    return comments;
  }
  /**
   * Call this function to remove all question values from the current page/panel, that end-user will not be able to enter.
   * For example the value that doesn't exists in a radigroup/dropdown/checkbox choices or matrix rows/columns.
   * Please note, this function doesn't clear values for invisible questions or values that doesn't associated with questions.
   * @see Question.clearIncorrectValues
   */
  public clearIncorrectValues() {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].clearIncorrectValues();
    }
  }
  /**
   * Call this function to clear all errors in the panel / page and all its child elements (panels and questions)
   */
  public clearErrors() {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].clearErrors();
    }
    this.errors = [];
  }
  private markQuestionListDirty() {
    this.isQuestionsReady = false;
    if (this.parent) this.parent.markQuestionListDirty();
  }
  /**
   * Returns the list of the elements in the object, Panel/Page. Elements can be questions or panels. The function doesn't return elements in the nested Panels.
   */
  public get elements(): Array<IElement> {
    return this.elementsValue;
  }
  public getElementsInDesign(includeHidden: boolean = false): Array<IElement> {
    return this.elements;
  }
  /**
   * Returns true if the current element belongs to the Panel/Page. It looks in nested Panels as well.
   * @param element
   * @see PanelModel
   */
  public containsElement(element: IElement): boolean {
    for (var i = 0; i < this.elements.length; i++) {
      var el: any = this.elements[i];
      if (el == element) return true;
      var pnl = el.getPanel();
      if (!!pnl) {
        if ((<PanelModelBase>pnl).containsElement(element)) return true;
      }
    }
    return false;
  }
  /**
   * Set this property to true, to require the answer at least in one question in the panel.
   */
  public get isRequired(): boolean {
    return this.getPropertyValue("isRequired", false);
  }
  public set isRequired(val: boolean) {
    this.setPropertyValue("isRequired", val);
  }
  /**
   * An expression that returns true or false. If it returns true the Panel/Page becomes required.
   * The library runs the expression on survey start and on changing a question value. If the property is empty then isRequired property is used.
   * @see isRequired
   */
  public get requiredIf(): string {
    return this.getPropertyValue("requiredIf", "");
  }
  public set requiredIf(val: string) {
    this.setPropertyValue("requiredIf", val);
  }
  /**
   * Returns true, if there is an error on this Page or inside the current Panel
   * @param fireCallback set it to true, to show errors in UI
   * @param focusOnFirstError set it to true to focus on the first question that doesn't pass the validation
   */
  public hasErrors(
    fireCallback: boolean = true,
    focusOnFirstError: boolean = false,
    rec: any = null
  ): boolean {
    rec = !!rec
      ? rec
      : {
          fireCallback: fireCallback,
          focuseOnFirstError: focusOnFirstError,
          firstErrorQuestion: <any>null,
          result: false,
        };
    this.hasErrorsCore(rec);
    if (rec.firstErrorQuestion) {
      rec.firstErrorQuestion.focus(true);
    }
    return rec.result;
  }
  private hasErrorsInPanels(rec: any) {
    var errors = <Array<any>>[];
    this.hasRequiredError(rec, errors);
    if (this.survey) {
      var customError = this.survey.validatePanel(this);
      if (customError) {
        errors.push(customError);
        rec.result = true;
      }
    }
    if (!!rec.fireCallback) {
      this.errors = errors;
    }
  }
  //ISurveyErrorOwner
  getErrorCustomText(text: string, error: SurveyError): string {
    if (!!this.survey) return this.survey.getErrorCustomText(text, error);
    return text;
  }

  private hasRequiredError(rec: any, errors: Array<SurveyError>) {
    if (!this.isRequired) return;
    var visQuestions = <Array<any>>[];
    this.addQuestionsToList(visQuestions, true);
    if (visQuestions.length == 0) return;
    for (var i = 0; i < visQuestions.length; i++) {
      if (!visQuestions[i].isEmpty()) return;
    }
    rec.result = true;
    errors.push(new OneAnswerRequiredError(this.requiredErrorText, this));
    if (rec.focuseOnFirstError && !rec.firstErrorQuestion) {
      rec.firstErrorQuestion = visQuestions[0];
    }
  }
  protected hasErrorsCore(rec: any) {
    var elements = this.elements;
    var element = null;

    for (var i = 0; i < elements.length; i++) {
      element = elements[i];

      if (!element.isVisible) continue;

      if (element.isPanel) {
        (<PanelModelBase>(<any>element)).hasErrorsCore(rec);
      } else {
        var question = <Question>element;
        if (question.isReadOnly) continue;
        if (question.hasErrors(rec.fireCallback, rec)) {
          if (rec.focuseOnFirstError && rec.firstErrorQuestion == null) {
            rec.firstErrorQuestion = question;
          }
          rec.result = true;
        }
      }
    }
    this.hasErrorsInPanels(rec);
    this.updateContainsErrors();
  }
  protected getContainsErrors(): boolean {
    var res = super.getContainsErrors();
    if (res) return res;
    var elements = this.elements;
    for (var i = 0; i < elements.length; i++) {
      if (elements[i].containsErrors) return true;
    }
    return false;
  }
  updateElementVisibility() {
    for (var i = 0; i < this.elements.length; i++) {
      var el = this.elements[i];
      (<Base>(<any>el)).setPropertyValue("isVisible", el.isVisible);
      if (el.isPanel) {
        (<PanelModelBase>(<any>el)).updateElementVisibility();
      }
    }
  }
  getFirstQuestionToFocus(withError: boolean = false): Question {
    var elements = this.elements;
    for (var i = 0; i < elements.length; i++) {
      var el = elements[i];
      if (!el.isVisible) continue;
      if (el.isPanel) {
        var res = (<PanelModelBase>(<any>el)).getFirstQuestionToFocus(
          withError
        );
        if (!!res) return res;
      } else {
        var q = <Question>el;
        if (q.hasInput && (!withError || q.currentErrorCount > 0)) return q;
      }
    }
    return null;
  }
  /**
   * Call it to focus the input on the first question
   */
  public focusFirstQuestion() {
    var q = this.getFirstQuestionToFocus();
    if (!!q) {
      q.focus();
    }
  }
  /**
   * Call it to focus the input of the first question that has an error.
   */
  public focusFirstErrorQuestion() {
    var q = this.getFirstQuestionToFocus(true);
    if (!!q) {
      q.focus();
    }
  }
  /**
   * Fill list array with the questions.
   * @param list
   * @param visibleOnly set it to true to get visible questions only
   */
  public addQuestionsToList(
    list: Array<IQuestion>,
    visibleOnly: boolean = false,
    includingDesignTime: boolean = false
  ) {
    this.addElementsToList(list, visibleOnly, includingDesignTime, false);
  }
  /**
   * Fill list array with the panels.
   * @param list
   */
  public addPanelsIntoList(
    list: Array<IPanel>,
    visibleOnly: boolean = false,
    includingDesignTime: boolean = false
  ) {
    this.addElementsToList(
      <Array<IElement>>(<Array<any>>list),
      visibleOnly,
      includingDesignTime,
      true
    );
  }
  private addElementsToList(
    list: Array<IElement>,
    visibleOnly: boolean,
    includingDesignTime: boolean,
    isPanel: boolean
  ) {
    if (visibleOnly && !this.visible) return;
    this.addElementsToListCore(
      list,
      this.elements,
      visibleOnly,
      includingDesignTime,
      isPanel
    );
  }
  private addElementsToListCore(
    list: Array<IElement>,
    elements: Array<IElement>,
    visibleOnly: boolean,
    includingDesignTime: boolean,
    isPanel: boolean
  ) {
    for (var i = 0; i < elements.length; i++) {
      var el = elements[i];
      if (visibleOnly && !el.visible) continue;
      if ((isPanel && el.isPanel) || (!isPanel && !el.isPanel)) {
        list.push(el);
      }
      if (el.isPanel) {
        (<PanelModel>el).addElementsToListCore(
          list,
          (<PanelModel>el).elements,
          visibleOnly,
          includingDesignTime,
          isPanel
        );
      } else {
        if (includingDesignTime) {
          this.addElementsToListCore(
            list,
            (<SurveyElement>(<any>el)).getElementsInDesign(false),
            visibleOnly,
            includingDesignTime,
            isPanel
          );
        }
      }
    }
  }
  /**
   * Returns true if the current object is Page and it is the current page.
   */
  public get isActive(): boolean {
    return !this.survey || <PageModel>this.survey.currentPage == this.root;
  }
  public updateCustomWidgets() {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].updateCustomWidgets();
    }
  }
  /**
   * Set this property different from "default" to set the specific question title location for this panel/page.
   * @see SurveyModel.questionTitleLocation
   */
  public get questionTitleLocation(): string {
    return this.getPropertyValue("questionTitleLocation");
  }
  public set questionTitleLocation(value: string) {
    this.setPropertyValue("questionTitleLocation", value.toLowerCase());
  }
  getQuestionTitleLocation(): string {
    if (this.onGetQuestionTitleLocation)
      return this.onGetQuestionTitleLocation();
    if (this.questionTitleLocation != "default")
      return this.questionTitleLocation;
    if (this.parent) return this.parent.getQuestionTitleLocation();
    return this.survey ? this.survey.questionTitleLocation : "top";
  }
  protected getStartIndex(): string {
    if (!!this.parent) return this.parent.getQuestionStartIndex();
    if (!!this.survey) return this.survey.questionStartIndex;
    return "";
  }
  getQuestionStartIndex(): string {
    return this.getStartIndex();
  }
  getChildrenLayoutType(): string {
    return "row";
  }
  public getProgressInfo(): IProgressInfo {
    return SurveyElement.getProgressInfoByElements(
      <Array<SurveyElement>>(<any>this.elements),
      this.isRequired
    );
  }
  protected get root(): PanelModelBase {
    var res = <PanelModelBase>this;
    while (res.parent) res = res.parent;
    return res;
  }
  protected childVisibilityChanged() {
    var newIsVisibleValue = this.getIsPageVisible(null);
    var oldIsVisibleValue = this.getPropertyValue("isVisible", true);
    if (newIsVisibleValue !== oldIsVisibleValue) {
      this.onVisibleChanged();
    }
  }
  protected createRow(): QuestionRowModel {
    return new QuestionRowModel(this);
  }
  public onSurveyLoad() {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].onSurveyLoad();
    }
    this.onElementVisibilityChanged(this);
  }
  public onFirstRendering() {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].onFirstRendering();
    }
    this.onRowsChanged();
  }
  get rows(): Array<QuestionRowModel> {
    return this.getPropertyValue("rows");
  }

  protected onRowsChanged() {
    if (this.isLoadingFromJson) return;
    this.setPropertyValue("rows", this.buildRows());
  }
  protected onAddElement(element: IElement, index: number) {
    element.setSurveyImpl(this.surveyImpl);
    element.parent = this;
    this.markQuestionListDirty();
    this.updateRowsOnElementAdded(element, index);
    if (element.isPanel) {
      var p = <PanelModel>element;
      if (this.survey) {
        this.survey.panelAdded(p, index, this, this.root);
      }
    } else {
      if (this.survey) {
        var q = <Question>element;
        this.survey.questionAdded(q, index, this, this.root);
      }
    }
    if (!!this.addElementCallback) this.addElementCallback(element);
    var self = this;
    (<Base>(<any>element)).registerFunctionOnPropertiesValueChanged(
      ["visible", "isVisible"],
      function () {
        self.onElementVisibilityChanged(element);
      },
      this.id
    );
    (<Base>(<any>element)).registerFunctionOnPropertyValueChanged(
      "startWithNewLine",
      function () {
        self.onElementStartWithNewLineChanged(element);
      },
      this.id
    );
    this.onElementVisibilityChanged(this);
  }
  protected onRemoveElement(element: IElement) {
    element.parent = null;
    this.markQuestionListDirty();
    (<Base>(<any>element)).unRegisterFunctionOnPropertiesValueChanged(
      ["visible", "isVisible", "startWithNewLine"],
      this.id
    );
    this.updateRowsOnElementRemoved(element);
    if (!element.isPanel) {
      if (this.survey) this.survey.questionRemoved(<Question>element);
    } else {
      if (this.survey) this.survey.panelRemoved(element);
    }
    if (!!this.removeElementCallback) this.removeElementCallback(element);
    this.onElementVisibilityChanged(this);
  }
  private onElementVisibilityChanged(element: any) {
    if (this.isLoadingFromJson) return;
    this.updateRowsVisibility(element);
    this.childVisibilityChanged();
    if (!!this.parent) {
      this.parent.onElementVisibilityChanged(this);
    }
  }
  private onElementStartWithNewLineChanged(element: any) {
    this.onRowsChanged();
  }
  private updateRowsVisibility(element: any) {
    var rows = this.rows;
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      if (row.elements.indexOf(element) > -1) {
        row.updateVisible();
        break;
      }
    }
  }
  private canBuildRows() {
    return !this.isLoadingFromJson && this.getChildrenLayoutType() == "row";
  }
  private buildRows(): Array<QuestionRowModel> {
    if (!this.canBuildRows()) return [];
    var result = new Array<QuestionRowModel>();
    for (var i = 0; i < this.elements.length; i++) {
      var el = this.elements[i];
      var isNewRow = i == 0 || el.startWithNewLine;
      var row = isNewRow ? this.createRow() : result[result.length - 1];
      if (isNewRow) result.push(row);
      row.addElement(el);
    }
    for (var i = 0; i < result.length; i++) {
      result[i].updateVisible();
    }
    return result;
  }
  private updateRowsOnElementAdded(element: IElement, index: number) {
    if (!this.canBuildRows()) return;
    var dragDropInfo = new DragDropInfo(null, element);
    dragDropInfo.target = element;
    dragDropInfo.isEdge = this.elements.length > 1;
    if (this.elements.length < 2) {
      dragDropInfo.destination = this;
    } else {
      dragDropInfo.isBottom = index > 0;
      if (index == 0) {
        dragDropInfo.destination = this.elements[1];
      } else {
        dragDropInfo.destination = this.elements[index - 1];
      }
    }
    this.dragDropAddTargetToRow(dragDropInfo, null);
  }
  private updateRowsOnElementRemoved(element: IElement) {
    if (!this.canBuildRows()) return;
    this.updateRowsRemoveElementFromRow(
      element,
      this.findRowByElement(element)
    );
  }
  protected updateRowsRemoveElementFromRow(
    element: IElement,
    row: QuestionRowModel
  ) {
    if (!row || !row.panel) return;
    var elIndex = row.elements.indexOf(element);
    if (elIndex < 0) return;
    row.elements.splice(elIndex, 1);
    if (row.elements.length > 0) {
      row.updateVisible();
    } else {
      if (row.index >= 0) {
        row.panel.rows.splice(row.index, 1);
      }
    }
  }
  private findRowByElement(el: IElement): QuestionRowModel {
    var rows = this.rows;
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].elements.indexOf(el) > -1) return rows[i];
    }
    return null;
  }
  elementWidthChanged(el: IElement) {
    if (this.isLoadingFromJson) return;
    var row = this.findRowByElement(el);
    if (!!row) {
      row.updateVisible();
    }
  }
  /**
   * Returns rendered title text or html.
   */
  public get processedTitle() {
    return this.getRenderedTitle(this.locTitle.textOrHtml);
  }
  protected getRenderedTitle(str: string): string {
    return this.textProcessor != null
      ? this.textProcessor.processText(str, true)
      : str;
  }
  /**
   * Use it to get/set the object visibility.
   * @see visibleIf
   */
  public get visible(): boolean {
    return this.getPropertyValue("visible", true);
  }
  public set visible(value: boolean) {
    if (value === this.visible) return;
    this.setPropertyValue("visible", value);
    this.setPropertyValue("isVisible", this.isVisible);
    if (!this.isLoadingFromJson) this.onVisibleChanged();
  }
  protected onVisibleChanged() {
    this.setPropertyValue("isVisible", this.isVisible);
    if (
      !!this.survey &&
      this.survey.isClearValueOnHiddenContainer &&
      !this.isLoadingFromJson
    ) {
      var questions = this.questions;
      for (var i = 0; i < questions.length; i++) {
        if (!this.isVisible) {
          questions[i].clearValue();
        } else {
          questions[i].updateValueWithDefaults();
        }
      }
    }
  }
  /**
   * Returns true if object is visible or survey is in design mode right now.
   */
  public get isVisible(): boolean {
    return this.areInvisibleElementsShowing || this.getIsPageVisible(null);
  }
  getIsPageVisible(exceptionQuestion: IQuestion): boolean {
    if (!this.visible) return false;
    for (var i = 0; i < this.elements.length; i++) {
      if (this.elements[i] == exceptionQuestion) continue;
      if (this.elements[i].isVisible) return true;
    }
    return false;
  }
  public setVisibleIndex(index: number): number {
    if (!this.isVisible || index < 0) {
      for (var i = 0; i < this.elements.length; i++) {
        this.elements[i].setVisibleIndex(-1);
      }
      return 0;
    }
    var startIndex = index;
    index += this.beforeSetVisibleIndex(index);
    var panelStartIndex = this.getPanelStartIndex(index);
    var panelIndex = panelStartIndex;
    for (var i = 0; i < this.elements.length; i++) {
      panelIndex += this.elements[i].setVisibleIndex(panelIndex);
    }
    if (this.isContinueNumbering()) {
      index += panelIndex - panelStartIndex;
    }
    return index - startIndex;
  }
  protected beforeSetVisibleIndex(index: number): number {
    return 0;
  }
  protected getPanelStartIndex(index: number): number {
    return index;
  }
  protected isContinueNumbering() {
    return true;
  }
  /**
   * Returns true if readOnly property is true or survey is in display mode or parent panel/page is readOnly.
   * @see SurveyModel.model
   * @see readOnly
   */
  public get isReadOnly(): boolean {
    var isParentReadOnly = !!this.parent && this.parent.isReadOnly;
    var isSurveyReadOnly = !!this.survey && this.survey.isDisplayMode;
    return this.readOnly || isParentReadOnly || isSurveyReadOnly;
  }
  protected onReadOnlyChanged() {
    for (var i = 0; i < this.elements.length; i++) {
      var el = <SurveyElement>(<any>this.elements[i]);
      el.setPropertyValue("isReadOnly", el.isReadOnly);
    }
    super.onReadOnlyChanged();
  }
  public updateElementCss() {
    for (var i = 0; i < this.elements.length; i++) {
      var el = <SurveyElement>(<any>this.elements[i]);
      el.updateElementCss();
    }
    super.updateElementCss();
  }

  /**
   * An expression that returns true or false. If it returns false the Panel/Page becomes read only and an end-user will not able to answer on qustions inside it.
   * The library runs the expression on survey start and on changing a question value. If the property is empty then readOnly property is used.
   * @see readOnly
   * @see isReadOnly
   */
  public get enableIf(): string {
    return this.getPropertyValue("enableIf", "");
  }
  public set enableIf(val: string) {
    this.setPropertyValue("enableIf", val);
  }
  /**
   * Add an element into Panel or Page. Returns true if the element added successfully. Otherwise returns false.
   * @param element
   * @param index element index in the elements array
   */
  public addElement(element: IElement, index: number = -1): boolean {
    if (!this.canAddElement(element)) return false;
    if (index < 0 || index >= this.elements.length) {
      this.elements.push(element);
    } else {
      this.elements.splice(index, 0, element);
    }
    return true;
  }
  protected canAddElement(element: IElement): boolean {
    return (
      !!element && element.isLayoutTypeSupported(this.getChildrenLayoutType())
    );
  }
  /**
   * Add a question into Panel or Page. Returns true if the question added successfully. Otherwise returns false.
   * @param question
   * @param index element index in the elements array
   */
  public addQuestion(question: Question, index: number = -1): boolean {
    return this.addElement(question, index);
  }
  /**
   * Add a panel into Panel or Page.  Returns true if the panel added successfully. Otherwise returns false.
   * @param panel
   * @param index element index in the elements array
   */
  public addPanel(panel: PanelModel, index: number = -1): boolean {
    return this.addElement(panel, index);
  }
  /**
   * Creates a new question and adds it at location of index, by default the end of the elements list. Returns null, if the question could not be created or could not be added into page or panel.
   * @param questionType the possible values are: "text", "checkbox", "dropdown", "matrix", "html", "matrixdynamic", "matrixdropdown" and so on.
   * @param name a question name
   * @param index element index in the elements array
   */
  public addNewQuestion(
    questionType: string,
    name: string = null,
    index: number = -1
  ): Question {
    var question = QuestionFactory.Instance.createQuestion(questionType, name);
    if (!this.addQuestion(question, index)) return null;
    return question;
  }
  /**
   * Creates a new panel and adds it into the end of the elements list. Returns null, if the panel could not be created or could not be added into page or panel.
   * @param name a panel name
   */
  public addNewPanel(name: string = null): PanelModel {
    var panel = this.createNewPanel(name);
    if (!this.addPanel(panel)) return null;
    return panel;
  }
  /**
   * Returns the index of element parameter in the elements list.
   * @param element question or panel
   */
  public indexOf(element: IElement): number {
    return this.elements.indexOf(element);
  }
  protected createNewPanel(name: string): PanelModel {
    return new PanelModel(name);
  }
  /**
   * Remove an element (Panel or Question) from the elements list.
   * @param element
   * @see elements
   */
  public removeElement(element: IElement): boolean {
    var index = this.elements.indexOf(element);
    if (index < 0) {
      for (var i = 0; i < this.elements.length; i++) {
        if (this.elements[i].removeElement(element)) return true;
      }
      return false;
    }
    this.elements.splice(index, 1);
    return true;
  }
  /**
   * Remove question  from the elements list.
   * @param question
   * @see elements
   * @see removeElement
   */
  public removeQuestion(question: Question) {
    this.removeElement(question);
  }
  runCondition(values: HashTable<any>, properties: HashTable<any>) {
    if (this.isDesignMode) return;
    var elements = this.elements.slice();
    for (var i = 0; i < elements.length; i++) {
      elements[i].runCondition(values, properties);
    }
    if (!this.areInvisibleElementsShowing) {
      this.runVisibleCondition(values, properties);
    }
    this.runEnableCondition(values, properties);
    this.runRequiredCondition(values, properties);
  }
  private runVisibleCondition(
    values: HashTable<any>,
    properties: HashTable<any>
  ) {
    if (!this.visibleIf) return;
    var conditionRunner = new ConditionRunner(this.visibleIf);
    conditionRunner.onRunComplete = (res: boolean) => {
      this.visible = res;
    };
    conditionRunner.run(values, properties);
  }
  private runEnableCondition(
    values: HashTable<any>,
    properties: HashTable<any>
  ) {
    if (!this.enableIf) return;
    var conditionRunner = new ConditionRunner(this.enableIf);
    conditionRunner.onRunComplete = (res: boolean) => {
      this.readOnly = !res;
    };
    conditionRunner.run(values, properties);
  }
  private runRequiredCondition(
    values: HashTable<any>,
    properties: HashTable<any>
  ) {
    if (!this.requiredIf) return;
    var conditionRunner = new ConditionRunner(this.requiredIf);
    conditionRunner.onRunComplete = (res: boolean) => {
      this.isRequired = res;
    };
    conditionRunner.run(values, properties);
  }
  onAnyValueChanged(name: string) {
    var els = this.elements;
    for (var i = 0; i < els.length; i++) {
      els[i].onAnyValueChanged(name);
    }
  }
  checkBindings(valueName: string, value: any) {
    var els = this.elements;
    for (var i = 0; i < els.length; i++) {
      (<Base>(<any>els[i])).checkBindings(valueName, value);
    }
  }
  protected dragDropAddTarget(dragDropInfo: DragDropInfo) {
    var prevRow = this.dragDropFindRow(dragDropInfo.target);
    if (this.dragDropAddTargetToRow(dragDropInfo, prevRow)) {
      this.updateRowsRemoveElementFromRow(dragDropInfo.target, prevRow);
    }
  }
  protected dragDropFindRow(findElement: ISurveyElement): QuestionRowModel {
    if (!findElement || findElement.isPage) return null;
    var element = <IElement>findElement;
    var rows = this.rows;
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].elements.indexOf(element) > -1) return rows[i];
    }
    for (var i = 0; i < this.elements.length; i++) {
      var pnl = this.elements[i].getPanel();
      if (!pnl) continue;
      var row = (<PanelModelBase>pnl).dragDropFindRow(element);
      if (!!row) return row;
    }
    return null;
  }
  private dragDropAddTargetToRow(
    dragDropInfo: DragDropInfo,
    prevRow: QuestionRowModel
  ): boolean {
    if (!dragDropInfo.destination) return true;
    if (this.dragDropAddTargetToEmptyPanel(dragDropInfo)) return true;
    var dest = dragDropInfo.destination;
    var destRow = this.dragDropFindRow(dest);
    if (!destRow) return true;
    if (!dragDropInfo.target.startWithNewLine)
      return this.dragDropAddTargetToExistingRow(
        dragDropInfo,
        destRow,
        prevRow
      );
    return this.dragDropAddTargetToNewRow(dragDropInfo, destRow, prevRow);
  }
  private dragDropAddTargetToEmptyPanel(dragDropInfo: DragDropInfo): boolean {
    if (dragDropInfo.destination.isPage) {
      this.dragDropAddTargetToEmptyPanelCore(
        this.root,
        dragDropInfo.target,
        dragDropInfo.isBottom
      );
      return true;
    }
    var dest = <IElement>dragDropInfo.destination;
    if (dest.isPanel && !dragDropInfo.isEdge) {
      var panel = <PanelModelBase>(<any>dest);
      if ((<any>dragDropInfo.target)["template"] === dest) {
        return false;
      }
      if (
        dragDropInfo.nestedPanelDepth < 0 ||
        dragDropInfo.nestedPanelDepth >= panel.depth
      ) {
        this.dragDropAddTargetToEmptyPanelCore(
          <PanelModelBase>(<any>dest),
          dragDropInfo.target,
          dragDropInfo.isBottom
        );
        return true;
      }
    }
    return false;
  }
  private dragDropAddTargetToExistingRow(
    dragDropInfo: DragDropInfo,
    destRow: QuestionRowModel,
    prevRow: QuestionRowModel
  ): boolean {
    var index = destRow.elements.indexOf(<IElement>dragDropInfo.destination);
    if (
      index == 0 &&
      !dragDropInfo.isBottom &&
      destRow.elements[0].startWithNewLine
    ) {
      if (destRow.index > 0) {
        dragDropInfo.isBottom = true;
        destRow = destRow.panel.rows[destRow.index - 1];
        dragDropInfo.destination =
          destRow.elements[destRow.elements.length - 1];
        return this.dragDropAddTargetToExistingRow(
          dragDropInfo,
          destRow,
          prevRow
        );
      } else {
        return this.dragDropAddTargetToNewRow(dragDropInfo, destRow, prevRow);
      }
    }
    var prevRowIndex = -1;
    if (prevRow == destRow) {
      prevRowIndex = destRow.elements.indexOf(dragDropInfo.target);
    }
    if (dragDropInfo.isBottom) index++;
    var srcRow = this.findRowByElement(dragDropInfo.source);
    if (
      srcRow == destRow &&
      srcRow.elements.indexOf(dragDropInfo.source) == index
    )
      return false;
    if (index == prevRowIndex) return false;
    if (prevRowIndex > -1) {
      destRow.elements.splice(prevRowIndex, 1);
      if (prevRowIndex < index) index--;
    }
    destRow.elements.splice(index, 0, dragDropInfo.target);
    destRow.updateVisible();
    return prevRowIndex < 0;
  }
  private dragDropAddTargetToNewRow(
    dragDropInfo: DragDropInfo,
    destRow: QuestionRowModel,
    prevRow: QuestionRowModel
  ): boolean {
    var targetRow = destRow.panel.createRow();
    targetRow.addElement(dragDropInfo.target);
    var index = destRow.index;
    if (dragDropInfo.isBottom) {
      index++;
    }
    //same row
    if (!!prevRow && prevRow.panel == targetRow.panel && prevRow.index == index)
      return false;
    var srcRow = this.findRowByElement(dragDropInfo.source);
    if (
      !!srcRow &&
      srcRow.panel == targetRow.panel &&
      srcRow.elements.length == 1 &&
      srcRow.index == index
    )
      return false;
    destRow.panel.rows.splice(index, 0, targetRow);
    return true;
  }
  private dragDropAddTargetToEmptyPanelCore(
    panel: PanelModelBase,
    target: IElement,
    isBottom: boolean
  ) {
    var targetRow = panel.createRow();
    targetRow.addElement(target);
    if (panel.elements.length == 0 || isBottom) {
      panel.rows.push(targetRow);
    } else {
      panel.rows.splice(0, 0, targetRow);
    }
  }
  dragDropMoveElement(src: IElement, target: IElement, targetIndex: number) {
    var srcIndex = (<PanelModelBase>src.parent).elements.indexOf(src);
    if (targetIndex > srcIndex) {
      targetIndex--;
    }
    this.removeElement(src);
    this.addElement(target, targetIndex);
  }
  public dispose() {
    for (var i = 0; i < this.elements.length; i++) {
      this.elements[i].dispose();
    }
    this.elements.splice(0, this.elements.length);
  }
}

/**
 * A container element, similar to the Page objects. However, unlike the Page, Panel can't be a root.
 * It may contain questions and other panels.
 */
export class PanelModel
  extends PanelModelBase
  implements IElement, ITitleOwner {
  public minWidth?: string;
  public maxWidth?: string;
  constructor(public name: string = "") {
    super(name);
    var self = this;
    this.registerFunctionOnPropertyValueChanged("width", function () {
      if (!!self.parent) {
        self.parent.elementWidthChanged(self);
      }
    });
    this.registerFunctionOnPropertiesValueChanged(
      ["indent", "innerIndent", "rightIndent"],
      function () {
        self.onIndentChanged();
      }
    );
  }
  public getType(): string {
    return "panel";
  }
  public get contentId(): string {
    return this.id + "_content";
  }
  onSurveyLoad() {
    super.onSurveyLoad();
    this.onIndentChanged();
  }
  public get isPanel(): boolean {
    return true;
  }
  /**
   * Get/set the page where the panel is located.
   */
  public get page(): IPage {
    return this.getPage(this.parent);
  }
  public set page(val: IPage) {
    this.setPage(this.parent, val);
  }
  public delete() {
    if (!!this.parent) {
      this.removeSelfFromList(this.parent.elements);
    }
  }
  /**
   * Move panel to a new container Page/Panel. Add as a last element if insertBefore parameter is not used or inserted into the given index,
   * if insert parameter is number, or before the given element, if the insertBefore parameter is a question or panel
   * @param container Page or Panel to where a question is relocated.
   * @param insertBefore Use it if you want to set the panel to a specific position. You may use a number (use 0 to insert int the beginning) or element, if you want to insert before this element.
   */
  public moveTo(container: IPanel, insertBefore: any = null): boolean {
    return this.moveToBase(this.parent, container, insertBefore);
  }
  /**
   * Returns the visible index of the panel in the survey. Commonly it is -1 and it doesn't show.
   * You have to set showNumber to true to show index/numbering for the Panel
   * @see showNumber
   */
  public get visibleIndex(): number {
    return this.getPropertyValue("visibleIndex", -1);
  }
  /**
   * Set showNumber to true to start showing the number for this panel.
   * @see visibleIndex
   */
  public get showNumber(): boolean {
    return this.getPropertyValue("showNumber", false);
  }
  public set showNumber(val: boolean) {
    this.setPropertyValue("showNumber", val);
    this.notifySurveyOnVisibilityChanged();
  }
  /**
   * Gets or sets a value that specifies how the elements numbers inside panel are displayed.
   *
   * The following options are available:
   *
   * - `default` - display questions numbers as defined in parent panel or survey
   * - `onpanel` - display questions numbers, start numbering from beginning of this page
   * - `off` - turn off the numbering for questions titles
   * @see showNumber
   */
  public get showQuestionNumbers(): string {
    return this.getPropertyValue("showQuestionNumbers", "default");
  }
  public set showQuestionNumbers(value: string) {
    this.setPropertyValue("showQuestionNumbers", value);
    this.notifySurveyOnVisibilityChanged();
  }
  /**
   * Gets or sets the first question index for elements inside the panel. The first question index is '1.' by default and it is taken from survey.questionStartIndex property.
   * You may start it from '100' or from 'A', by setting '100' or 'A' to this property.
   * You can set the start index to "(1)" or "# A)" or "a)" to render question number as (1), # A) and a) accordingly.
   * @see survey.questionStartIndex
   */
  public get questionStartIndex(): string {
    return this.getPropertyValue("questionStartIndex", "");
  }
  public set questionStartIndex(val: string) {
    this.setPropertyValue("questionStartIndex", val);
  }
  getQuestionStartIndex(): string {
    if (!!this.questionStartIndex) return this.questionStartIndex;
    return super.getQuestionStartIndex();
  }
  /**
   * The property returns the question number. If question is invisible then it returns empty string.
   * If visibleIndex is 1, then no is 2, or 'B' if survey.questionStartIndex is 'A'.
   * @see SurveyModel.questionStartIndex
   */
  public get no(): string {
    return this.getPropertyValue("no", "");
  }
  protected setNo(visibleIndex: number) {
    this.setPropertyValue(
      "no",
      Helpers.getNumberByIndex(this.visibleIndex, this.getStartIndex())
    );
  }
  protected beforeSetVisibleIndex(index: number): number {
    let visibleIndex = -1;
    if (this.showNumber && (this.isDesignMode || !this.locTitle.isEmpty)) {
      visibleIndex = index;
    }
    this.setPropertyValue("visibleIndex", visibleIndex);
    this.setNo(visibleIndex);
    return visibleIndex < 0 ? 0 : 1;
  }
  protected getPanelStartIndex(index: number): number {
    if (this.showQuestionNumbers == "off") return -1;
    if (this.showQuestionNumbers == "onpanel") return 0;
    return index;
  }
  protected isContinueNumbering() {
    return (
      this.showQuestionNumbers != "off" && this.showQuestionNumbers != "onpanel"
    );
  }
  private notifySurveyOnVisibilityChanged() {
    if (this.survey != null && !this.isLoadingFromJson) {
      this.survey.panelVisibilityChanged(this, this.isVisible);
    }
  }
  protected hasErrorsCore(rec: any) {
    super.hasErrorsCore(rec);
    if (this.isCollapsed && rec.result && rec.fireCallback) {
      this.expand();
    }
  }
  protected getRenderedTitle(str: string): string {
    if (!str) {
      if (this.isCollapsed || this.isExpanded) return this.name;
      if (this.isDesignMode) return "[" + this.name + "]";
    }
    return super.getRenderedTitle(str);
  }
  /**
   * The Panel width.
   */
  public get width(): string {
    return this.getPropertyValue("width");
  }
  public set width(val: string) {
    this.setPropertyValue("width", val);
  }
  /**
   * The left indent. Set this property to increase the panel left indent.
   */
  public get indent(): number {
    return this.getPropertyValue("indent", 0);
  }
  public set indent(val: number) {
    this.setPropertyValue("indent", val);
  }
  /**
   * The inner indent. Set this property to increase the panel content margin.
   */
  public get innerIndent(): number {
    return this.getPropertyValue("innerIndent", 0);
  }
  public set innerIndent(val: number) {
    this.setPropertyValue("innerIndent", val);
  }
  get renderWidth(): string {
    return this.getPropertyValue("renderWidth");
  }
  set renderWidth(val: string) {
    this.setPropertyValue("renderWidth", val);
  }
  /**
   * The Panel renders on the new line if the property is true. If the property is false, the panel tries to render on the same line/row with a previous question/panel.
   */
  public get startWithNewLine(): boolean {
    return this.getPropertyValue("startWithNewLine", true);
  }
  public set startWithNewLine(value: boolean) {
    this.setPropertyValue("startWithNewLine", value);
  }
  /**
   * The right indent of the Panel.
   */
  public get rightIndent(): number {
    return this.getPropertyValue("rightIndent", 0);
  }
  public set rightIndent(val: number) {
    this.setPropertyValue("rightIndent", val);
  }
  get paddingLeft(): string {
    return this.getPropertyValue("paddingLeft", "");
  }
  set paddingLeft(val: string) {
    this.setPropertyValue("paddingLeft", val);
  }
  get innerPaddingLeft(): string {
    return this.getPropertyValue("innerPaddingLeft", "");
  }
  set innerPaddingLeft(val: string) {
    this.setPropertyValue("innerPaddingLeft", val);
  }
  get paddingRight(): string {
    return this.getPropertyValue("paddingRight", "");
  }
  set paddingRight(val: string) {
    this.setPropertyValue("paddingRight", val);
  }
  private onIndentChanged() {
    this.innerPaddingLeft = this.getIndentSize(this.innerIndent);
    this.paddingLeft = this.getIndentSize(this.indent);
    this.paddingRight = this.getIndentSize(this.rightIndent);
  }
  private getIndentSize(indent: number): string {
    if (indent < 1) return "";
    if (!this.data) return "";
    var css = (<any>this).survey["css"];
    if (!css) return "";
    return indent * css.question.indent + "px";
  }
  public clearOnDeletingContainer() {
    this.elements.forEach((element) => {
      if (element instanceof Question || element instanceof PanelModel) {
        element.clearOnDeletingContainer();
      }
    });
  }
  public get hasEditButton(): boolean {
    if (this.survey && this.survey.state == "preview") return this.depth == 1;
    return false;
  }
  public cancelPreview() {
    if (!this.hasEditButton) return;
    this.survey.cancelPreviewByPage(this);
  }
  protected onVisibleChanged() {
    super.onVisibleChanged();
    this.notifySurveyOnVisibilityChanged();
  }
}

Serializer.addClass(
  "panelbase",
  [
    "name",
    {
      name: "elements",
      alternativeName: "questions",
      baseClassName: "question",
      visible: false,
      isLightSerializable: false,
    },
    { name: "visible:boolean", default: true },
    "visibleIf:condition",
    "enableIf:condition",
    "requiredIf:condition",
    "readOnly:boolean",
    {
      name: "questionTitleLocation",
      default: "default",
      choices: ["default", "top", "bottom", "left", "hidden"],
    },
    { name: "title", serializationProperty: "locTitle" },
    { name: "description:text", serializationProperty: "locDescription" },
  ],
  function () {
    return new PanelModelBase();
  }
);

Serializer.addClass(
  "panel",
  [
    {
      name: "state",
      default: "default",
      choices: ["default", "collapsed", "expanded"],
    },
    "isRequired:boolean",
    {
      name: "requiredErrorText:text",
      serializationProperty: "locRequiredErrorText",
    },
    { name: "startWithNewLine:boolean", default: true },
    "width",
    { name: "innerIndent:number", default: 0, choices: [0, 1, 2, 3] },
    { name: "indent:number", default: 0, choices: [0, 1, 2, 3] },
    {
      name: "page",
      isSerializable: false,
      visibleIf: function (obj: any) {
        var survey = obj ? obj.survey : null;
        return !survey || survey.pages.length > 1;
      },
      choices: function (obj: any) {
        var survey = obj ? obj.survey : null;
        return survey
          ? survey.pages.map((p: any) => {
              return { value: p.name, text: p.title };
            })
          : [];
      },
    },
    "showNumber:boolean",
    {
      name: "showQuestionNumbers",
      default: "default",
      choices: ["default", "onpanel", "off"],
    },
    "questionStartIndex",
  ],
  function () {
    return new PanelModel();
  },
  "panelbase"
);