# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [1.8.24](https://github.com/surveyjs/survey-library/compare/v1.8.23...v1.8.24) (2021-01-13)


### Bug Fixes

* Changing properties in CalculatedValue object doesn't call survey.onPropertyValueChangedCallback function [#2604](https://github.com/surveyjs/survey-library/issues/2604) ([2dc2b81](https://github.com/surveyjs/survey-library/commit/2dc2b81d47db0efc5dd9b5c811c7380d5fc13409))
* Reference to null object error in matrix-rubric in preview page because of "paneldynamic" [#2602](https://github.com/surveyjs/survey-library/issues/2602) ([9c07e0d](https://github.com/surveyjs/survey-library/commit/9c07e0d260ec526c91bd6c0a81574a57327e19ec))

### [1.8.23](https://github.com/surveyjs/survey-library/compare/v1.8.22...v1.8.23) (2020-12-29)

### [1.8.22](https://github.com/surveyjs/survey-library/compare/v1.8.21...v1.8.22) (2020-12-23)


### Bug Fixes

* Stack overflow on using component in Panel Dynamic [#2582](https://github.com/surveyjs/survey-library/issues/2582) ([1c527e4](https://github.com/surveyjs/survey-library/commit/1c527e49c9728b3ef2543e27bd8ff522bc90b0e3))

### [1.8.21](https://github.com/surveyjs/survey-library/compare/v1.8.20...v1.8.21) (2020-12-15)


### Bug Fixes

* Optionally clear question value on hiding it's container (page or panel). [#2574](https://github.com/surveyjs/survey-library/issues/2574) ([482a422](https://github.com/surveyjs/survey-library/commit/482a4225a123f7bc949a18a77afd8e130865df37))
* ProcessValue class doesn't correctly create path for uppercase variables. [#2571](https://github.com/surveyjs/survey-library/issues/2571) ([784b442](https://github.com/surveyjs/survey-library/commit/784b442c50db78b1ba37fe39c057bb6c2013ef86))
* Progress bar during preview is showing "Page 1 of 1". [#2552](https://github.com/surveyjs/survey-library/issues/2552) ([7af1ebb](https://github.com/surveyjs/survey-library/commit/7af1ebb13d1173be5da356fe960cbc160c79b55d))

### [1.8.20](https://github.com/surveyjs/survey-library/compare/v1.8.19...v1.8.20) (2020-12-09)

### [1.8.19](https://github.com/surveyjs/survey-library/compare/v1.8.18...v1.8.19) (2020-12-08)


### Bug Fixes

* age() function doesn't work correctly [#2562](https://github.com/surveyjs/survey-library/issues/2562) ([4385cee](https://github.com/surveyjs/survey-library/commit/4385cee81248fe4892c3acd2c38d8a63548139e2))
* choicesByUrl generates survey.onPropertyChangedCallback on loading from JSON [#2563](https://github.com/surveyjs/survey-library/issues/2563) ([cc50e7f](https://github.com/surveyjs/survey-library/commit/cc50e7f9ea936c4458e0a72476995f9db6bebe5a))
* survey.clearIncorrectValues() remove totals matrix values if matrix is in dynamic panel [#2553](https://github.com/surveyjs/survey-library/issues/2553) ([51e9ef7](https://github.com/surveyjs/survey-library/commit/51e9ef74b46040f2839d808db440ecf718f8eeb5))
* survey.onMatrixRowRemoved calls before row is removed [#2557](https://github.com/surveyjs/survey-library/issues/2557) ([3338044](https://github.com/surveyjs/survey-library/commit/33380442908f24bc3adec60e3281794a93707f9a))

### [1.8.18](https://github.com/surveyjs/survey-library/compare/v1.8.17...v1.8.18) (2020-12-01)

### [1.8.17](https://github.com/surveyjs/survey-library/compare/v1.8.16...v1.8.17) (2020-11-26)


### Bug Fixes

* content panel in composite component has underfined renderWidth [#2537](https://github.com/surveyjs/survey-library/issues/2537) ([75f31e8](https://github.com/surveyjs/survey-library/commit/75f31e8700abf25aeb45923fde7d403acdac73d3))

### [1.8.16](https://github.com/surveyjs/survey-library/compare/v1.8.14...v1.8.16) (2020-11-24)

### [1.8.14](https://github.com/surveyjs/survey-library/compare/v1.8.13...v1.8.14) (2020-11-19)


### Bug Fixes

* Panel title is not displayed in Creator on changing the title property value [#2510](https://github.com/surveyjs/survey-library/issues/2510) ([37bae80](https://github.com/surveyjs/survey-library/commit/37bae8098ea2157b5be451cf3e68ea6f4ab75ad9))
* survey-react lazy rendering works slow in comparison with survey-knockout and survey-vue platforms [#2515](https://github.com/surveyjs/survey-library/issues/2515) ([980b330](https://github.com/surveyjs/survey-library/commit/980b330ea1607396707f4192a3185aa2e5e51d02))
* Warning cause of missing prop matrix.vue [#2513](https://github.com/surveyjs/survey-library/issues/2513) ([ad52387](https://github.com/surveyjs/survey-library/commit/ad5238728e668d02b7c9c205653703ff6ba83e54))

### [1.8.13](https://github.com/surveyjs/survey-library/compare/v1.8.12...v1.8.13) (2020-11-09)


### Bug Fixes

* Do not call server validation several times [#2497](https://github.com/surveyjs/survey-library/issues/2497) ([ff4ee45](https://github.com/surveyjs/survey-library/commit/ff4ee45b49dc92fd24a461bc9aa58e53231c12e7))
* Dynamic matrix containing dropdown field with hasOther poperty doesn't load it's data [#2508](https://github.com/surveyjs/survey-library/issues/2508) ([5bd154a](https://github.com/surveyjs/survey-library/commit/5bd154a349828143c1e63d9d3f646db5ddf06a70))
* Panel title is not displayed in Creator on changing the title property value [#2510](https://github.com/surveyjs/survey-library/issues/2510) ([335ebf6](https://github.com/surveyjs/survey-library/commit/335ebf6ee252ff4abade424bb738682ee7b616e2))
* Warning cause of missing prop matrix.vue [#2513](https://github.com/surveyjs/survey-library/issues/2513) ([29bba0a](https://github.com/surveyjs/survey-library/commit/29bba0a1401e15e4d1656647bd13358266891955))

### [1.8.12](https://github.com/surveyjs/survey-library/compare/v1.8.11...v1.8.12) (2020-10-28)


### Bug Fixes

* clearIncorrectValues function doesn't work correctly panel dynamic [#2490](https://github.com/surveyjs/survey-library/issues/2490) ([2e2a662](https://github.com/surveyjs/survey-library/commit/2e2a662b8b2c858df5583562259974756e9755a9))
* function clearIncorrectValues() doesn't work correctly for questions that uses choicesByUrl property [#2492](https://github.com/surveyjs/survey-library/issues/2492) ([54835d9](https://github.com/surveyjs/survey-library/commit/54835d9548649bfe310ff02c38ccb5f347024e2f))

### [1.8.11](https://github.com/surveyjs/survey-library/compare/v1.8.10...v1.8.11) (2020-10-23)


### Bug Fixes

* checkErrorMode equals "onComplete" doesn't work correctly with the server validation [#2478](https://github.com/surveyjs/survey-library/issues/2478) ([d116bf5](https://github.com/surveyjs/survey-library/commit/d116bf5e97bfc7bee0fdca1a1206591ab81375ff))
* Do not generate an empty rows error for matrix dynamic if it not requried and minRowCount is set [#2479](https://github.com/surveyjs/survey-library/issues/2479) ([1ae8bb4](https://github.com/surveyjs/survey-library/commit/1ae8bb45a1cc9baf9186ed73710ff8231988a900))

### [1.8.10](https://github.com/surveyjs/survey-library/compare/v1.8.9...v1.8.10) (2020-10-21)

### [1.8.9](https://github.com/surveyjs/survey-library/compare/v1.8.8...v1.8.9) (2020-10-14)


### Bug Fixes

* Locale of progressbar does not change [#2453](https://github.com/surveyjs/survey-library/issues/2453) ([561a71e](https://github.com/surveyjs/survey-library/commit/561a71e6843bfefe00079b6a4cb68bf7580bdb8a))

### [1.8.8](https://github.com/surveyjs/survey-library/compare/v1.8.7...v1.8.8) (2020-10-09)

### [1.8.7](https://github.com/surveyjs/survey-library/compare/v1.8.6...v1.8.7) (2020-10-06)


### Bug Fixes

* showInvisibleElements not working for choices [#2423](https://github.com/surveyjs/survey-library/issues/2423) ([72fb591](https://github.com/surveyjs/survey-library/commit/72fb59118d77af57237e546ce165edbe39faae9f))

### [1.8.6](https://github.com/surveyjs/survey-library/compare/v1.8.5...v1.8.6) (2020-09-29)

### [1.8.5](https://github.com/surveyjs/survey-library/compare/v1.8.4...v1.8.5) (2020-09-29)

### [1.8.4](https://github.com/surveyjs/survey-library/compare/v1.8.3...v1.8.4) (2020-09-22)


### Bug Fixes

* choicesByUrl doesn't work with {NOCACHE}/{CACHE} [#2406](https://github.com/surveyjs/survey-library/issues/2406) ([ef9a10d](https://github.com/surveyjs/survey-library/commit/ef9a10d08ed7b6c8127bb0f05ae898293e32f388))

### [1.8.3](https://github.com/surveyjs/survey-library/compare/v1.8.2...v1.8.3) (2020-09-16)


### Bug Fixes

* onLoadChoicesFromServer event is fired ad-infinitum [#2388](https://github.com/surveyjs/survey-library/issues/2388) ([be48178](https://github.com/surveyjs/survey-library/commit/be481782f92b5b4676b389350f55cb8cdf971760))
* Stackoverflow on JSON with non english locale and firstPageIsStarted equals to true [#2400](https://github.com/surveyjs/survey-library/issues/2400) ([4522d65](https://github.com/surveyjs/survey-library/commit/4522d654f91a72561dee70792a5a36d63b4676a6))
* The isAnswered property of matrixdynamic is false after setting question's value for T5206 [#2399](https://github.com/surveyjs/survey-library/issues/2399) ([8205ad3](https://github.com/surveyjs/survey-library/commit/8205ad32e92cbc57127338f4fe756a9e33ea3d64))

### [1.8.2](https://github.com/surveyjs/survey-library/compare/v1.8.1...v1.8.2) (2020-09-10)


### Bug Fixes

* Pressing markdown link focuses the answer input ([b9ead88](https://github.com/surveyjs/survey-library/commit/b9ead885039764e642785198ca45f732e6eb4088)), closes [#2312](https://github.com/surveyjs/survey-library/issues/2312)

### [1.8.1](https://github.com/surveyjs/survey-library/compare/v1.8.0...v1.8.1) (2020-09-09)

## [1.8.0](https://github.com/surveyjs/survey-library/compare/v1.7.28...v1.8.0) (2020-09-02)


### Bug Fixes

* Image Picker doesn't update items in designer on changing value/text and image link in choices property editor, https://github.com/surveyjs/survey-creator/issues/942 ([254fe49](https://github.com/surveyjs/survey-library/commit/254fe494b5a570824756098b0aa98d7b9cbe2cc6))
* Width for column in Matrixdynamic does not work when the header is hidden [#2346](https://github.com/surveyjs/survey-library/issues/2346) ([db02e39](https://github.com/surveyjs/survey-library/commit/db02e3969548ab5b32e02fb5123fe258368a37fa))

### [1.7.28](https://github.com/surveyjs/survey-library/compare/v1.7.27...v1.7.28) (2020-08-25)

### [1.7.27](https://github.com/surveyjs/survey-library/compare/v1.7.26...v1.7.27) (2020-08-19)

### [1.7.26](https://github.com/surveyjs/survey-library/compare/v1.7.25...v1.7.26) (2020-08-11)

### [1.7.25](https://github.com/surveyjs/survey-library/compare/v1.7.24...v1.7.25) (2020-08-04)

### [1.7.24](https://github.com/surveyjs/survey-library/compare/v1.7.23...v1.7.24) (2020-07-28)

### [1.7.23](https://github.com/surveyjs/survey-library/compare/v1.7.22...v1.7.23) (2020-07-22)

### [1.7.22](https://github.com/surveyjs/survey-library/compare/v1.7.21...v1.7.22) (2020-07-22)

### [1.7.21](https://github.com/surveyjs/survey-library/compare/v1.7.20...v1.7.21) (2020-07-22)

### [1.7.20](https://github.com/surveyjs/survey-library/compare/v1.7.19...v1.7.20) (2020-07-15)


### Bug Fixes

* header attribute value in matrixdynamic cells ([031017c](https://github.com/surveyjs/survey-library/commit/031017c2a670823cfebf74e4e61bc08f05d958c4))

### [1.7.19](https://github.com/surveyjs/survey-library/compare/v1.7.18...v1.7.19) (2020-07-09)

### [1.7.18](https://github.com/surveyjs/survey-library/compare/v1.7.17...v1.7.18) (2020-07-04)

### [1.7.17](https://github.com/surveyjs/survey-library/compare/v1.7.16...v1.7.17) (2020-07-01)

### [1.7.16](https://github.com/surveyjs/survey-library/compare/v1.7.15...v1.7.16) (2020-06-30)

### [1.7.15](https://github.com/surveyjs/survey-library/compare/v1.7.14...v1.7.15) (2020-06-25)

### [1.7.14](https://github.com/surveyjs/survey-library/compare/v1.7.13...v1.7.14) (2020-06-25)

### [1.7.13](https://github.com/surveyjs/survey-library/compare/v1.7.12...v1.7.13) (2020-06-24)

### [1.7.12](https://github.com/surveyjs/survey-library/compare/v1.7.11...v1.7.12) (2020-06-16)

### [1.7.11](https://github.com/surveyjs/survey-library/compare/v1.7.10...v1.7.11) (2020-06-10)

### [1.7.10](https://github.com/surveyjs/survey-library/compare/v1.7.9...v1.7.10) (2020-06-03)

### [1.7.9](https://github.com/surveyjs/survey-library/compare/v1.7.8...v1.7.9) (2020-05-27)

### [1.7.8](https://github.com/surveyjs/survey-library/compare/v1.7.7...v1.7.8) (2020-05-26)


### Bug Fixes

* goNextPageAutomatic not triggering validation errors [#2161](https://github.com/surveyjs/survey-library/issues/2161) ([cb0114e](https://github.com/surveyjs/survey-library/commit/cb0114e982816f1070bb59632fadde2c3dcf8b8a))

### [1.7.7](https://github.com/surveyjs/survey-library/compare/v1.7.6...v1.7.7) (2020-05-19)


### Bug Fixes

* Updating Navigation button text will not call `onModified` and `saveSurveyFunc` [#792](https://github.com/surveyjs/survey-library/issues/792) ([f82aa93](https://github.com/surveyjs/survey-library/commit/f82aa93b5dbd279852cf40e451a05760fd2bcfe3))

### [1.7.6](https://github.com/surveyjs/survey-library/compare/v1.7.5...v1.7.6) (2020-05-12)


### Bug Fixes

* Checkbox question doesn't keep it's comment value on changing survey.isSinglePage [#2160](https://github.com/surveyjs/survey-library/issues/2160) ([977e306](https://github.com/surveyjs/survey-library/commit/977e306b46a908441214270db411ba0dbe70c276))

### [1.7.5](https://github.com/surveyjs/survey-library/compare/v1.7.4...v1.7.5) (2020-05-06)

### [1.7.4](https://github.com/surveyjs/survey-library/compare/v1.7.3...v1.7.4) (2020-04-29)

### [1.7.3](https://github.com/surveyjs/survey-library/compare/v1.7.2...v1.7.3) (2020-04-21)


### Bug Fixes

* survey.progressBarType is "questions" calculates incorrectly if there are non input questions in survey [#2108](https://github.com/surveyjs/survey-library/issues/2108) ([9606a2c](https://github.com/surveyjs/survey-library/commit/9606a2ce4122c17dfe293634faf7f0719806203e))

### [1.7.2](https://github.com/surveyjs/survey-library/compare/v1.7.1...v1.7.2) (2020-04-17)


### Bug Fixes

* Complete trigger doesn't work when invisible questions are in expression [#2098](https://github.com/surveyjs/survey-library/issues/2098) ([e192e9f](https://github.com/surveyjs/survey-library/commit/e192e9fb15b4fc589524526016edc22b3bb72e54))
* Triggers properties are not observable/react and trigger doesn't call survey.onPropertyValueChangedCallback [#2093](https://github.com/surveyjs/survey-library/issues/2093) ([f86712f](https://github.com/surveyjs/survey-library/commit/f86712f523287360c7289ebc878d05663b638a7e))

### [1.7.1](https://github.com/surveyjs/survey-library/compare/v1.5.20...v1.7.1) (2020-04-15)

### [1.5.20](https://github.com/surveyjs/survey-library/compare/v1.5.19...v1.5.20) (2020-04-15)


### Bug Fixes

* An execption raised in matrix with now standard rows and total row [#2087](https://github.com/surveyjs/survey-library/issues/2087) ([3d6fac8](https://github.com/surveyjs/survey-library/commit/3d6fac855a17c75f396abed67d8e790f0ee94942))
* Could not override invisible property, by making it visible [#2090](https://github.com/surveyjs/survey-library/issues/2090) ([087aa0b](https://github.com/surveyjs/survey-library/commit/087aa0b2aedde6e24aa97968d80f4f6af485ff2d))
* Round correctly rateValues for step less than 1 for rating question [#743](https://github.com/surveyjs/survey-library/issues/743) ([4c56424](https://github.com/surveyjs/survey-library/commit/4c564246a4ea5d90ab7f84e62dd134f4f5040434))

### [1.5.19](https://github.com/surveyjs/survey-library/compare/v1.5.18...v1.5.19) (2020-04-07)

### [1.5.18](https://github.com/surveyjs/survey-library/compare/v1.5.17...v1.5.18) (2020-03-31)

### [1.5.17](https://github.com/surveyjs/survey-library/compare/v1.5.16...v1.5.17) (2020-03-24)

### [1.5.16](https://github.com/surveyjs/survey-library/compare/v1.5.15...v1.5.16) (2020-03-18)


### Bug Fixes

* react version: Comment Question raise onValueChanged on typing a letter [#2028](https://github.com/surveyjs/survey-library/issues/2028) ([8545d26](https://github.com/surveyjs/survey-library/commit/8545d265b1adaf0fb8b28a394fcc0de7dfb50641))

### [1.5.15](https://github.com/surveyjs/survey-library/compare/v1.5.14...v1.5.15) (2020-03-12)

### [1.5.14](https://github.com/surveyjs/survey-library/compare/v1.5.13...v1.5.14) (2020-03-11)

### [1.5.13](https://github.com/surveyjs/survey-library/compare/v1.5.12...v1.5.13) (2020-03-04)

### [1.5.12](https://github.com/surveyjs/survey-library/compare/v1.5.11...v1.5.12) (2020-02-28)

### [1.5.11](https://github.com/surveyjs/survey-library/compare/v1.5.10...v1.5.11) (2020-02-28)

<a name="1.5.10"></a>
## [1.5.10](https://github.com/surveyjs/surveyjs/compare/v1.5.9...v1.5.10) (2020-02-18)



<a name="1.5.9"></a>
## [1.5.9](https://github.com/surveyjs/survey-library/compare/v1.5.8...v1.5.9) (2020-02-14)



<a name="1.5.8"></a>
## [1.5.8](https://github.com/surveyjs/surveyjs/compare/v1.5.7...v1.5.8) (2020-02-12)



<a name="1.5.7"></a>
## [1.5.7](https://github.com/surveyjs/surveyjs/compare/v1.5.6...v1.5.7) (2020-02-11)



<a name="1.5.6"></a>
## [1.5.6](https://github.com/surveyjs/survey-library/compare/v1.5.5...v1.5.6) (2020-02-07)



<a name="1.5.5"></a>
## [1.5.5](https://github.com/surveyjs/survey-library/compare/v1.5.4...v1.5.5) (2020-02-03)



<a name="1.5.4"></a>
## [1.5.4](https://github.com/surveyjs/survey-library/compare/v1.5.3...v1.5.4) (2020-01-31)



<a name="1.5.3"></a>
## [1.5.3](https://github.com/surveyjs/survey-library/compare/v1.5.2...v1.5.3) (2020-01-30)



<a name="1.5.2"></a>
## [1.5.2](https://github.com/surveyjs/survey-library/compare/v1.5.1...v1.5.2) (2020-01-29)



<a name="1.5.1"></a>
## [1.5.1](https://github.com/surveyjs/survey-library/compare/v1.5.0...v1.5.1) (2020-01-24)



<a name="1.1.33"></a>
## [1.1.33](https://github.com/surveyjs/surveyjs/compare/v1.1.32...v1.1.33) (2020-01-20)



<a name="1.1.32"></a>
## [1.1.32](https://github.com/surveyjs/surveyjs/compare/v1.1.31...v1.1.32) (2020-01-14)



<a name="1.1.31"></a>
## [1.1.31](https://github.com/surveyjs/surveyjs/compare/v1.1.30...v1.1.31) (2020-01-09)



<a name="1.1.30"></a>
## [1.1.30](https://github.com/surveyjs/surveyjs/compare/v1.1.29...v1.1.30) (2020-01-09)



<a name="1.1.29"></a>
## [1.1.29](https://github.com/surveyjs/survey-library/compare/v1.1.28...v1.1.29) (2019-12-30)



<a name="1.1.28"></a>
## [1.1.28](https://github.com/surveyjs/survey-library/compare/v1.1.27...v1.1.28) (2019-12-30)



<a name="1.1.27"></a>
## [1.1.27](https://github.com/surveyjs/survey-library/compare/v1.1.26...v1.1.27) (2019-12-30)



<a name="1.1.26"></a>
## [1.1.26](https://github.com/surveyjs/survey-library/compare/v1.1.25...v1.1.26) (2019-12-24)



<a name="1.1.25"></a>
## [1.1.25](https://github.com/surveyjs/survey-library/compare/v1.1.24...v1.1.25) (2019-12-17)



<a name="1.1.24"></a>
## [1.1.24](https://github.com/surveyjs/survey-library/compare/v1.1.23...v1.1.24) (2019-12-10)



<a name="1.1.23"></a>
## [1.1.23](https://github.com/surveyjs/survey-library/compare/v1.1.22...v1.1.23) (2019-12-03)



<a name="1.1.22"></a>
## [1.1.22](https://github.com/surveyjs/survey-library/compare/v1.1.21...v1.1.22) (2019-11-26)



<a name="1.1.21"></a>
## [1.1.21](https://github.com/surveyjs/survey-library/compare/v1.1.20...v1.1.21) (2019-11-19)



<a name="1.1.20"></a>
## [1.1.20](https://github.com/surveyjs/surveyjs/compare/v1.1.19...v1.1.20) (2019-11-12)



<a name="1.1.19"></a>
## [1.1.19](https://github.com/surveyjs/surveyjs/compare/v1.1.18...v1.1.19) (2019-11-06)



<a name="1.1.18"></a>
## [1.1.18](https://github.com/surveyjs/survey-library/compare/v1.1.17...v1.1.18) (2019-10-30)



<a name="1.1.17"></a>
## [1.1.17](https://github.com/surveyjs/survey-library/compare/v1.1.16...v1.1.17) (2019-10-22)



<a name="1.1.16"></a>
## [1.1.16](https://github.com/surveyjs/survey-library/compare/v1.1.15...v1.1.16) (2019-10-16)



<a name="1.1.15"></a>
## [1.1.15](https://github.com/surveyjs/survey-library/compare/v1.1.14...v1.1.15) (2019-10-08)



<a name="1.1.14"></a>
## [1.1.14](https://github.com/surveyjs/surveyjs/compare/v1.1.13...v1.1.14) (2019-10-01)



<a name="1.1.13"></a>
## [1.1.13](https://github.com/surveyjs/survey-library/compare/v1.1.12...v1.1.13) (2019-09-24)



<a name="1.1.12"></a>
## [1.1.12](https://github.com/surveyjs/survey-library/compare/v1.1.11...v1.1.12) (2019-09-17)



<a name="1.1.11"></a>
## [1.1.11](https://github.com/surveyjs/surveyjs/compare/v1.1.10...v1.1.11) (2019-09-13)



<a name="1.1.10"></a>
## [1.1.10](https://github.com/surveyjs/surveyjs/compare/v1.1.9...v1.1.10) (2019-09-11)



<a name="1.1.9"></a>
## [1.1.9](https://github.com/surveyjs/survey-library/compare/v1.1.8...v1.1.9) (2019-09-10)



<a name="1.1.8"></a>
## [1.1.8](https://github.com/surveyjs/survey-library/compare/v1.1.7...v1.1.8) (2019-09-03)



<a name="1.1.7"></a>
## [1.1.7](https://github.com/surveyjs/survey-library/compare/v1.1.6...v1.1.7) (2019-08-27)



<a name="1.1.6"></a>
## [1.1.6](https://github.com/surveyjs/survey-library/compare/v1.1.5...v1.1.6) (2019-08-20)



<a name="1.1.5"></a>
## [1.1.5](https://github.com/surveyjs/survey-library/compare/v1.1.4...v1.1.5) (2019-08-13)



<a name="1.1.4"></a>
## [1.1.4](https://github.com/surveyjs/survey-library/compare/v1.1.3...v1.1.4) (2019-08-12)



<a name="1.1.3"></a>
## [1.1.3](https://github.com/surveyjs/surveyjs/compare/v1.1.2...v1.1.3) (2019-08-06)



<a name="1.1.2"></a>
## [1.1.2](https://github.com/surveyjs/surveyjs/compare/v1.1.1...v1.1.2) (2019-07-30)



<a name="1.1.1"></a>
## [1.1.1](https://github.com/surveyjs/surveyjs/compare/v1.1.0...v1.1.1) (2019-07-23)



<a name="1.1.0"></a>
# [1.1.0](https://github.com/surveyjs/surveyjs/compare/v1.0.99...v1.1.0) (2019-07-17)



<a name="1.0.99"></a>
## [1.0.99](https://github.com/surveyjs/surveyjs/compare/v1.0.98...v1.0.99) (2019-07-16)



<a name="1.0.98"></a>
## [1.0.98](https://github.com/surveyjs/surveyjs/compare/v1.0.97...v1.0.98) (2019-07-09)



<a name="1.0.97"></a>
## [1.0.97](https://github.com/surveyjs/surveyjs/compare/v1.0.96...v1.0.97) (2019-07-09)



<a name="1.0.96"></a>
## [1.0.96](https://github.com/surveyjs/survey-library/compare/v1.0.95...v1.0.96) (2019-07-02)



<a name="1.0.95"></a>
## [1.0.95](https://github.com/surveyjs/survey-library/compare/v1.0.94...v1.0.95) (2019-06-25)



<a name="1.0.94"></a>
## [1.0.94](https://github.com/surveyjs/survey-library/compare/v1.0.93...v1.0.94) (2019-06-22)



<a name="1.0.93"></a>
## [1.0.93](https://github.com/surveyjs/survey-library/compare/v1.0.92...v1.0.93) (2019-06-20)



<a name="1.0.92"></a>
## [1.0.92](https://github.com/surveyjs/surveyjs/compare/v1.0.91...v1.0.92) (2019-06-11)



<a name="1.0.91"></a>
## [1.0.91](https://github.com/surveyjs/survey-library/compare/v1.0.90...v1.0.91) (2019-06-05)



<a name="1.0.90"></a>
## [1.0.90](https://github.com/surveyjs/survey-library/compare/v1.0.89...v1.0.90) (2019-06-04)



<a name="1.0.89"></a>
## [1.0.89](https://github.com/surveyjs/survey-library/compare/v1.0.88...v1.0.89) (2019-05-30)



<a name="1.0.88"></a>
## [1.0.88](https://github.com/surveyjs/surveyjs/compare/v1.0.87...v1.0.88) (2019-05-28)



<a name="1.0.87"></a>
## [1.0.87](https://github.com/surveyjs/survey-library/compare/v1.0.86...v1.0.87) (2019-05-22)



<a name="1.0.86"></a>
## [1.0.86](https://github.com/surveyjs/survey-library/compare/v1.0.85...v1.0.86) (2019-05-22)



<a name="1.0.85"></a>
## [1.0.85](https://github.com/surveyjs/survey-library/compare/v1.0.84...v1.0.85) (2019-05-14)



<a name="1.0.84"></a>
## [1.0.84](https://github.com/surveyjs/survey-library/compare/v1.0.83...v1.0.84) (2019-05-07)



<a name="1.0.83"></a>
## [1.0.83](https://github.com/surveyjs/survey-library/compare/v1.0.82...v1.0.83) (2019-04-30)



<a name="1.0.82"></a>
## [1.0.82](https://github.com/surveyjs/survey-library/compare/v1.0.81...v1.0.82) (2019-04-23)



<a name="1.0.81"></a>
## [1.0.81](https://github.com/surveyjs/survey-library/compare/v1.0.80...v1.0.81) (2019-04-16)



<a name="1.0.80"></a>
## [1.0.80](https://github.com/surveyjs/survey-library/compare/v1.0.79...v1.0.80) (2019-04-16)



<a name="1.0.79"></a>
## [1.0.79](https://github.com/surveyjs/survey-library/compare/v1.0.78...v1.0.79) (2019-04-10)



<a name="1.0.78"></a>
## [1.0.78](https://github.com/surveyjs/surveyjs/compare/v1.0.77...v1.0.78) (2019-04-02)



<a name="1.0.77"></a>
## [1.0.77](https://github.com/surveyjs/surveyjs/compare/v1.0.76...v1.0.77) (2019-03-27)



<a name="1.0.76"></a>
## [1.0.76](https://github.com/surveyjs/surveyjs/compare/v1.0.75...v1.0.76) (2019-03-27)



<a name="1.0.75"></a>
## [1.0.75](https://github.com/surveyjs/surveyjs/compare/v1.0.74...v1.0.75) (2019-03-19)



<a name="1.0.74"></a>
## [1.0.74](https://github.com/surveyjs/surveyjs/compare/v1.0.73...v1.0.74) (2019-03-12)



<a name="1.0.73"></a>
## [1.0.73](https://github.com/surveyjs/surveyjs/compare/v1.0.72...v1.0.73) (2019-03-05)



<a name="1.0.72"></a>
## [1.0.72](https://github.com/surveyjs/surveyjs/compare/v1.0.71...v1.0.72) (2019-02-27)



<a name="1.0.71"></a>
## [1.0.71](https://github.com/surveyjs/surveyjs/compare/v1.0.70...v1.0.71) (2019-02-19)



<a name="1.0.70"></a>
## [1.0.70](https://github.com/surveyjs/surveyjs/compare/v1.0.69...v1.0.70) (2019-02-19)



<a name="1.0.69"></a>

## [1.0.69](https://github.com/surveyjs/surveyjs/compare/v1.0.68...v1.0.69) (2019-02-13)

<a name="1.0.68"></a>

## [1.0.68](https://github.com/surveyjs/surveyjs/compare/v1.0.67...v1.0.68) (2019-02-07)

<a name="1.0.67"></a>

## [1.0.67](https://github.com/surveyjs/surveyjs/compare/v1.0.66...v1.0.67) (2019-02-05)

<a name="1.0.66"></a>

## [1.0.66](https://github.com/surveyjs/surveyjs/compare/v1.0.65...v1.0.66) (2019-01-29)

<a name="1.0.65"></a>

## [1.0.65](https://github.com/surveyjs/surveyjs/compare/v1.0.64...v1.0.65) (2019-01-22)

<a name="1.0.64"></a>

## [1.0.64](https://github.com/surveyjs/surveyjs/compare/v1.0.63...v1.0.64) (2019-01-15)

<a name="1.0.63"></a>

## [1.0.63](https://github.com/surveyjs/surveyjs/compare/v1.0.62...v1.0.63) (2018-12-28)

<a name="1.0.62"></a>

## [1.0.62](https://github.com/surveyjs/surveyjs/compare/v1.0.61...v1.0.62) (2018-12-27)

<a name="1.0.61"></a>

## [1.0.61](https://github.com/surveyjs/surveyjs/compare/v1.0.60...v1.0.61) (2018-12-19)

<a name="1.0.60"></a>

## [1.0.60](https://github.com/surveyjs/surveyjs/compare/v1.0.59...v1.0.60) (2018-12-11)

<a name="1.0.59"></a>

## [1.0.59](https://github.com/surveyjs/surveyjs/compare/v1.0.58...v1.0.59) (2018-12-04)

<a name="1.0.58"></a>

## [1.0.58](https://github.com/surveyjs/surveyjs/compare/v1.0.57...v1.0.58) (2018-11-28)

<a name="1.0.57"></a>

## [1.0.57](https://github.com/surveyjs/surveyjs/compare/v1.0.56...v1.0.57) (2018-11-27)

<a name="1.0.56"></a>

## [1.0.56](https://github.com/surveyjs/surveyjs/compare/v1.0.55...v1.0.56) (2018-11-20)

<a name="1.0.55"></a>

## [1.0.55](https://github.com/surveyjs/surveyjs/compare/v1.0.54...v1.0.55) (2018-11-14)

<a name="1.0.54"></a>

## [1.0.54](https://github.com/surveyjs/surveyjs/compare/v1.0.53...v1.0.54) (2018-11-13)

<a name="1.0.53"></a>

## [1.0.53](https://github.com/surveyjs/surveyjs/compare/v1.0.52...v1.0.53) (2018-10-30)

<a name="1.0.52"></a>

## [1.0.52](https://github.com/surveyjs/surveyjs/compare/v1.0.51...v1.0.52) (2018-10-23)

<a name="1.0.51"></a>

## [1.0.51](https://github.com/surveyjs/surveyjs/compare/v1.0.50...v1.0.51) (2018-10-23)

<a name="1.0.50"></a>

## [1.0.50](https://github.com/surveyjs/surveyjs/compare/v1.0.49...v1.0.50) (2018-10-16)

<a name="1.0.49"></a>

## [1.0.49](https://github.com/surveyjs/surveyjs/compare/v1.0.48...v1.0.49) (2018-10-09)

<a name="1.0.48"></a>

## [1.0.48](https://github.com/surveyjs/surveyjs/compare/v1.0.47...v1.0.48) (2018-10-03)

<a name="1.0.47"></a>

## [1.0.47](https://github.com/surveyjs/surveyjs/compare/v1.0.46...v1.0.47) (2018-10-02)

<a name="1.0.46"></a>

## [1.0.46](https://github.com/surveyjs/surveyjs/compare/v1.0.45...v1.0.46) (2018-09-26)

<a name="1.0.45"></a>

## [1.0.45](https://github.com/surveyjs/surveyjs/compare/v1.0.44...v1.0.45) (2018-09-25)

<a name="1.0.44"></a>

## [1.0.44](https://github.com/surveyjs/surveyjs/compare/v1.0.43...v1.0.44) (2018-09-18)

<a name="1.0.43"></a>

## [1.0.43](https://github.com/surveyjs/surveyjs/compare/v1.0.42...v1.0.43) (2018-09-11)

<a name="1.0.42"></a>

## [1.0.42](https://github.com/surveyjs/surveyjs/compare/v1.0.41...v1.0.42) (2018-09-04)

<a name="1.0.41"></a>

## [1.0.41](https://github.com/surveyjs/surveyjs/compare/v1.0.40...v1.0.41) (2018-08-29)

<a name="1.0.40"></a>

## [1.0.40](https://github.com/surveyjs/surveyjs/compare/v1.0.39...v1.0.40) (2018-08-28)

<a name="1.0.39"></a>

## [1.0.39](https://github.com/surveyjs/surveyjs/compare/v1.0.38...v1.0.39) (2018-08-21)

<a name="1.0.38"></a>

## [1.0.38](https://github.com/surveyjs/surveyjs/compare/v1.0.37...v1.0.38) (2018-08-17)

<a name="1.0.37"></a>

## [1.0.37](https://github.com/surveyjs/surveyjs/compare/v1.0.35...v1.0.37) (2018-08-07)

<a name="1.0.36"></a>

## [1.0.36](https://github.com/surveyjs/surveyjs/compare/v1.0.35...v1.0.36) (2018-08-02)

<a name="1.0.35"></a>

## [1.0.35](https://github.com/surveyjs/surveyjs/compare/v1.0.34...v1.0.35) (2018-07-26)

<a name="1.0.34"></a>

## [1.0.34](https://github.com/surveyjs/surveyjs/compare/v1.0.33...v1.0.34) (2018-07-24)

<a name="1.0.33"></a>

## [1.0.33](https://github.com/surveyjs/surveyjs/compare/v1.0.32...v1.0.33) (2018-07-17)

<a name="1.0.32"></a>

## [1.0.32](https://github.com/surveyjs/surveyjs/compare/v1.0.31...v1.0.32) (2018-07-10)

<a name="1.0.31"></a>

## [1.0.31](https://github.com/surveyjs/surveyjs/compare/v1.0.30...v1.0.31) (2018-07-10)

<a name="1.0.30"></a>

## [1.0.30](https://github.com/surveyjs/surveyjs/compare/v1.0.29...v1.0.30) (2018-07-03)

<a name="1.0.29"></a>

## [1.0.29](https://github.com/surveyjs/surveyjs/compare/v1.0.28...v1.0.29) (2018-06-26)

<a name="1.0.28"></a>

## [1.0.28](https://github.com/surveyjs/surveyjs/compare/v1.0.27...v1.0.28) (2018-06-21)

<a name="1.0.27"></a>

## [1.0.27](https://github.com/surveyjs/surveyjs/compare/v1.0.26...v1.0.27) (2018-06-19)

<a name="1.0.26"></a>

## [1.0.26](https://github.com/surveyjs/surveyjs/compare/v1.0.25...v1.0.26) (2018-06-13)

<a name="1.0.25"></a>

## [1.0.25](https://github.com/surveyjs/surveyjs/compare/v1.0.24...v1.0.25) (2018-06-05)

<a name="1.0.24"></a>

## [1.0.24](https://github.com/surveyjs/surveyjs/compare/v1.0.23...v1.0.24) (2018-05-29)

<a name="1.0.23"></a>

## [1.0.23](https://github.com/surveyjs/surveyjs/compare/v1.0.22...v1.0.23) (2018-05-22)

<a name="1.0.22"></a>

## [1.0.22](https://github.com/surveyjs/surveyjs/compare/v1.0.21...v1.0.22) (2018-05-15)

<a name="1.0.21"></a>

## [1.0.21](https://github.com/surveyjs/surveyjs/compare/v1.0.20...v1.0.21) (2018-05-11)

<a name="1.0.20"></a>

## [1.0.20](https://github.com/surveyjs/surveyjs/compare/v1.0.19...v1.0.20) (2018-04-28)

<a name="1.0.19"></a>

## [1.0.19](https://github.com/surveyjs/surveyjs/compare/v1.0.18...v1.0.19) (2018-04-24)

<a name="1.0.18"></a>

## [1.0.18](https://github.com/surveyjs/surveyjs/compare/v1.0.17...v1.0.18) (2018-04-19)

<a name="1.0.17"></a>

## [1.0.17](https://github.com/surveyjs/surveyjs/compare/v1.0.16...v1.0.17) (2018-04-17)

<a name="1.0.16"></a>

## [1.0.16](https://github.com/surveyjs/surveyjs/compare/v1.0.15...v1.0.16) (2018-04-02)

<a name="1.0.15"></a>

## [1.0.15](https://github.com/surveyjs/surveyjs/compare/v1.0.14...v1.0.15) (2018-03-27)

<a name="1.0.14"></a>

## [1.0.14](https://github.com/surveyjs/surveyjs/compare/v1.0.13...v1.0.14) (2018-03-13)

<a name="1.0.13"></a>

## [1.0.13](https://github.com/surveyjs/surveyjs/compare/v1.0.12...v1.0.13) (2018-03-07)

<a name="1.0.12"></a>

## [1.0.12](https://github.com/surveyjs/surveyjs/compare/v1.0.11...v1.0.12) (2018-03-07)

<a name="1.0.11"></a>

## [1.0.11](https://github.com/surveyjs/surveyjs/compare/v1.0.10...v1.0.11) (2018-02-27)

<a name="1.0.10"></a>

## [1.0.10](https://github.com/surveyjs/surveyjs/compare/v1.0.9...v1.0.10) (2018-02-21)

<a name="1.0.9"></a>

## [1.0.9](https://github.com/surveyjs/surveyjs/compare/v1.0.8...v1.0.9) (2018-02-16)

<a name="1.0.8"></a>

## [1.0.8](https://github.com/surveyjs/surveyjs/compare/v1.0.7...v1.0.8) (2018-02-14)

<a name="1.0.7"></a>

## [1.0.7](https://github.com/surveyjs/surveyjs/compare/v1.0.6...v1.0.7) (2018-02-09)

<a name="1.0.6"></a>

## [1.0.6](https://github.com/surveyjs/surveyjs/compare/v1.0.5...v1.0.6) (2018-02-02)

<a name="1.0.5"></a>

## [1.0.5](https://github.com/surveyjs/surveyjs/compare/v1.0.4...v1.0.5) (2018-01-29)

<a name="1.0.4"></a>

## [1.0.4](https://github.com/surveyjs/surveyjs/compare/v1.0.3...v1.0.4) (2018-01-23)

<a name="1.0.3"></a>

## [1.0.3](https://github.com/surveyjs/surveyjs/compare/v1.0.2...v1.0.3) (2018-01-19)

<a name="1.0.2"></a>

## [1.0.2](https://github.com/surveyjs/surveyjs/compare/v1.0.1...v1.0.2) (2018-01-16)

<a name="1.0.1"></a>

## [1.0.1](https://github.com/surveyjs/surveyjs/compare/v1.0.0...v1.0.1) (2018-01-09)

<a name="1.0.0"></a>

## [1.0.0](https://github.com/surveyjs/surveyjs/compare/v0.98.7...v1.0.0) (2017-12-29)

<a name="0.98.7"></a>

## [0.98.7](https://github.com/surveyjs/surveyjs/compare/v0.98.6...v0.98.7) (2017-12-29)

<a name="0.98.6"></a>

## [0.98.6](https://github.com/surveyjs/surveyjs/compare/v0.98.5...v0.98.6) (2017-12-26)

<a name="0.98.5"></a>

## [0.98.5](https://github.com/surveyjs/surveyjs/compare/v0.98.4...v0.98.5) (2017-12-20)

<a name="0.98.4"></a>

## [0.98.4](https://github.com/surveyjs/surveyjs/compare/v0.98.3...v0.98.4) (2017-12-15)

<a name="0.98.3"></a>

## [0.98.3](https://github.com/surveyjs/surveyjs/compare/v0.98.2...v0.98.3) (2017-12-12)

<a name="0.98.2"></a>

## [0.98.2](https://github.com/surveyjs/surveyjs/compare/v0.98.1...v0.98.2) (2017-12-12)

<a name="0.98.1"></a>

## [0.98.1](https://github.com/surveyjs/surveyjs/compare/v0.98.0...v0.98.1) (2017-12-07)

<a name="0.98.0"></a>

# [0.98.0](https://github.com/surveyjs/surveyjs/compare/v0.97.0...v0.98.0) (2017-12-06)

<a name="0.97.0"></a>

# [0.97.0](https://github.com/surveyjs/surveyjs/compare/v0.96.3...v0.97.0) (2017-11-28)

<a name="0.96.3"></a>

## [0.96.3](https://github.com/surveyjs/surveyjs/compare/v0.96.2...v0.96.3) (2017-11-24)

<a name="0.96.2"></a>

## [0.96.2](https://github.com/surveyjs/surveyjs/compare/v0.96.1...v0.96.2) (2017-11-23)

<a name="0.96.1"></a>

## [0.96.1](https://github.com/surveyjs/surveyjs/compare/v0.96.0...v0.96.1) (2017-11-20)

<a name="0.96.0"></a>

# [0.96.0](https://github.com/surveyjs/surveyjs/compare/v0.95.0...v0.96.0) (2017-11-17)

<a name="0.95.0"></a>

## [0.95.0](https://github.com/surveyjs/surveyjs/compare/v0.12.36...v0.95.0) (2017-11-10)

<a name="0.12.36"></a>

## [0.12.36](https://github.com/surveyjs/surveyjs/compare/v0.12.35...v0.12.36) (2017-11-03)

<a name="0.12.35"></a>

## [0.12.35](https://github.com/surveyjs/surveyjs/compare/v0.12.34...v0.12.35) (2017-10-27)

<a name="0.12.34"></a>

## [0.12.34](https://github.com/surveyjs/surveyjs/compare/v0.12.33...v0.12.34) (2017-10-20)

<a name="0.12.33"></a>

## [0.12.33](https://github.com/surveyjs/surveyjs/compare/v0.12.32...v0.12.33) (2017-10-19)

<a name="0.12.32"></a>

## [0.12.32](https://github.com/surveyjs/surveyjs/compare/v0.12.31...v0.12.32) (2017-10-10)

<a name="0.12.31"></a>

## [0.12.31](https://github.com/surveyjs/surveyjs/compare/v0.12.30...v0.12.31) (2017-10-06)

<a name="0.12.30"></a>

## [0.12.30](https://github.com/surveyjs/surveyjs/compare/0.12.29...0.12.30) (2017-09-29)

<a name="0.12.29"></a>

## [0.12.29](https://github.com/surveyjs/surveyjs/compare/v0.12.28...v0.12.29) (2017-09-29)

<a name="0.12.28"></a>

## [0.12.28](https://github.com/surveyjs/surveyjs/compare/v0.12.27...v0.12.28) (2017-09-22)

<a name="0.12.27"></a>

## [0.12.27](https://github.com/surveyjs/surveyjs/compare/v0.12.26...v0.12.27) (2017-09-21)

<a name="0.12.26"></a>

## [0.12.26](https://github.com/surveyjs/surveyjs/compare/v0.12.25...v0.12.26) (2017-09-13)

<a name="0.12.25"></a>

## [0.12.25](https://github.com/surveyjs/surveyjs/compare/v0.12.24...v0.12.25) (2017-09-08)

<a name="0.12.24"></a>

## [0.12.24](https://github.com/surveyjs/surveyjs/compare/v0.12.23...v0.12.24) (2017-09-07)

<a name="0.12.23"></a>

## [0.12.23](https://github.com/surveyjs/surveyjs/compare/v0.12.22...v0.12.23) (2017-08-23)

<a name="0.12.22"></a>

## [0.12.22](https://github.com/surveyjs/surveyjs/compare/v0.12.21...v0.12.22) (2017-08-16)

<a name="0.12.21"></a>

## [0.12.21](https://github.com/surveyjs/surveyjs/compare/v0.12.20...v0.12.21) (2017-08-08)

<a name="0.12.20"></a>

## [0.12.20](https://github.com/surveyjs/surveyjs/compare/v0.12.19...v0.12.20) (2017-07-21)

<a name="0.12.19"></a>

## [0.12.19](https://github.com/surveyjs/surveyjs/compare/v0.12.18...v0.12.19) (2017-07-05)

<a name="0.12.18"></a>

## [0.12.18](https://github.com/surveyjs/surveyjs/compare/v0.12.17...v0.12.18) (2017-06-23)

<a name="0.12.17"></a>

## [0.12.17](https://github.com/surveyjs/surveyjs/compare/v0.12.16...v0.12.17) (2017-06-09)

<a name="0.12.16"></a>

## [0.12.16](https://github.com/surveyjs/surveyjs/compare/v0.12.15...v0.12.16) (2017-05-31)

<a name="0.12.15"></a>

## [0.12.15](https://github.com/surveyjs/surveyjs/compare/v0.12.14...v0.12.15) (2017-05-19)

<a name="0.12.14"></a>

## [0.12.14](https://github.com/surveyjs/surveyjs/compare/v0.12.13...v0.12.14) (2017-05-11)

<a name="0.12.13"></a>

## [0.12.13](https://github.com/surveyjs/surveyjs/compare/v0.12.12...v0.12.13) (2017-05-10)

<a name="0.12.12"></a>

## [0.12.12](https://github.com/surveyjs/surveyjs/compare/v0.12.11...v0.12.12) (2017-05-03)

<a name="0.12.11"></a>

## [0.12.11](https://github.com/surveyjs/surveyjs/compare/v0.12.10...v0.12.11) (2017-04-24)

<a name="0.12.10"></a>

## [0.12.10](https://github.com/surveyjs/surveyjs/compare/v0.12.9...v0.12.10) (2017-04-20)

<a name="0.12.9"></a>

## [0.12.9](https://github.com/surveyjs/surveyjs/compare/v0.12.8...v0.12.9) (2017-04-17)

<a name="0.12.8"></a>

## [0.12.8](https://github.com/surveyjs/surveyjs/compare/v0.12.7...v0.12.8) (2017-04-13)

<a name="0.12.7"></a>

## [0.12.7](https://github.com/surveyjs/surveyjs/compare/v0.12.6...v0.12.7) (2017-04-10)

<a name="0.12.6"></a>

## [0.12.6](https://github.com/surveyjs/surveyjs/compare/v0.12.5...v0.12.6) (2017-04-05)

<a name="0.12.5"></a>

## [0.12.5](https://github.com/surveyjs/surveyjs/compare/v0.12.4...v0.12.5) (2017-03-27)

<a name="0.12.4"></a>

## [0.12.4](https://github.com/surveyjs/surveyjs/compare/v0.12.3...v0.12.4) (2017-03-17)

<a name="0.12.3"></a>

## [0.12.3](https://github.com/surveyjs/surveyjs/compare/v0.12.2...v0.12.3) (2017-03-10)

<a name="0.12.2"></a>

## [0.12.2](https://github.com/surveyjs/surveyjs/compare/v0.12.1...v0.12.2) (2017-03-10)