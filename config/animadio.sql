DROP DATABASE IF EXISTS `animadio`;
CREATE DATABASE `animadio` CHARACTER SET utf8;

USE `animadio`;

CREATE TABLE `Breakpoint` (
    `id`        TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `media`     CHAR(2)     NOT NULL    UNIQUE,
    `width`     VARCHAR(20) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Mixin` (
    `id`        TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `name`      VARCHAR(20) NOT NULL    UNIQUE,
    `result`    VARCHAR(30) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `KeyframeCat` (
    `id`        TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `category`  VARCHAR(10) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Keyframe` (
    `id`            TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `category_id`   TINYINT     UNSIGNED    NOT NULL,
    `name`          VARCHAR(10) NOT NULL    UNIQUE,
    `effect`        VARCHAR(40) NOT NULL    UNIQUE,
    CONSTRAINT `keyframe_category` FOREIGN KEY (`category_id`) REFERENCES `KeyframeCat`(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `VariableCat` (
    `id`        TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `category`  VARCHAR(10) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Variable` (
    `id`            SMALLINT    UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `category_id`   TINYINT     UNSIGNED    NOT NULL,
    `name`          VARCHAR(40) NOT NULL    UNIQUE,
    CONSTRAINT `variable_category` FOREIGN KEY (`category_id`) REFERENCES `VariableCat`(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `ClassCat` (
    `id`        TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `category`  VARCHAR(10) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `ClassState` (
    `id`        TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `state`     VARCHAR(10) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Class` (
    `id`            SMALLINT    UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `category_id`   TINYINT     UNSIGNED    NOT NULL,
    `media`         TINYINT     UNSIGNED    NOT NULL,
    `concat`        TINYINT     UNSIGNED    NOT NULL,
    `state_id`      TINYINT     UNSIGNED    NOT NULL,
    `name`          VARCHAR(20) NOT NULL    UNIQUE,
    CONSTRAINT `class_category` FOREIGN KEY (`category_id`) REFERENCES `ClassCat`(`id`),
    CONSTRAINT `class_state`    FOREIGN KEY (`state_id`)    REFERENCES `ClassState`(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Element` (
    `id`            TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `name`          VARCHAR(10) NOT NULL    UNIQUE,
    `link`          VARCHAR(10) NOT NULL    UNIQUE,
    `definition`    VARCHAR(50) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Theme` (
    `id`            TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `name`          VARCHAR(10) NOT NULL    UNIQUE,
    `link`          VARCHAR(10) NOT NULL    UNIQUE,
    `definition`    VARCHAR(50) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `Template` (
    `id`            TINYINT     UNSIGNED    PRIMARY KEY AUTO_INCREMENT,
    `name`          VARCHAR(10) NOT NULL    UNIQUE,
    `link`          VARCHAR(10) NOT NULL    UNIQUE,
    `definition`    VARCHAR(50) NOT NULL    UNIQUE
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO `Breakpoint`
(`media`, `width`) VALUES
('tn',  'all widths'),
('sm',  'min width: 576px'),
('md',  'min width: 768px'),
('lg',  'min width: 992px'),
('xl',  'min width: 1200px'),
('wd',  'min width: 1600px');

INSERT INTO `Mixin`
(`name`, `result`) VALUES
('keyframes',       '@keyframes rules'),
('container',       'container classes'),
('grid-template',   'grid classes'),
('grid-gap',        'grid-gap classes'),
('place-content',   'place-content classes'),
('place-items',     'place-items classes'),
('place-self',      'place-self classes'),
('btn-color',       'btn & button classes'),
('gallery',         'gallery class'),
('helpers',         'helpers classes'),
('helpers-concat',  'default helpers classes'),
('anima',           'anima classes');

INSERT INTO `KeyframeCat`
(`category`) VALUES
('translate'),
('rotate'),
('scale'),
('skew');

INSERT INTO `Keyframe`
(`category_id`, `name`, `effect`) VALUES
(1, 'slideT',   'slide to the top'),
(1, 'slideTR',  'slide to the top right'),
(1, 'slideR',   'slide to the right'),
(1, 'slideBR',  'slide to the bottom right'),
(1, 'slideB',   'slide to the bottom'),
(1, 'slideBL',  'slide to the bottom left'),
(1, 'slideL',   'slide to the left'),
(1, 'slideTL',  'slide to the top left'),
(2, 'turn',     'simple rotation'),
(2, 'turnX',    'x-axis rotation'),
(2, 'turnY',    'y-axis rotation'),
(2, 'turnXY',   'rotation on the x & y axes'),
(2, 'turnXZ',   'rotation on the x & z axes'),
(2, 'turnYZ',   'rotation on the y & z axes'),
(2, 'turn3D',   'rotation on 3 axes'),
(3, 'bounce',   'rebound'),
(3, 'grow',     'magnification'),
(3, 'shrink',   'narrowing'),
(3, 'openX',    'x-axis magnification'),
(3, 'openY',    'y-axis magnification'),
(3, 'flipX',    'flipping on the x-axis'),
(3, 'flipY',    'flipping on the y-axis'),
(3, 'flipperX', 'double flipping to the x-axis'),
(3, 'flipperY', 'double flipping to the y-axis'),
(3, 'fallX',    'narrowing & flipping on the x-axis'),
(3, 'fallY',    'narrowing & flipping on the y-axis'),
(4, 'twistT',   'half distorsion to the top'),
(4, 'twistR',   'half distorsion to the right'),
(4, 'twistB',   'half distorsion to the bottom'),
(4, 'twistL',   'half distorsion to the left'),
(4, 'torsionT', 'full distorsion to the top'),
(4, 'torsionR', 'full distorsion to the right'),
(4, 'torsionB', 'full distorsion to the bottom'),
(4, 'torsionL', 'full distorsion to the left');

INSERT INTO `VariableCat`
(`category`) VALUES
('init'),
('font'),
('color'),
('tranform'),
('tags'),
('display'),
('animation'),
('margin'),
('border'),
('size'),
('shadow'),
('btn'),
('card'),
('head'),
('foot'),
('navbar'),
('sidebar'),
('menu'),
('gallery'),
('form'),
('table'),
('slider'),
('canvas');

INSERT INTO `Variable`
(`category_id`, `name`) VALUES
(1,     'container-max-height'),
(1,     'opacity-dark'),
(1,     'opacity-light'),
(2,     'serif'),
(2,     'sans-serif'),
(2,     'monospace'),
(2,     'cursive'),
(2,     'fantasy'),
(2,     'decoration-line'),
(3,     'pink'),
(3,     'red'),
(3,     'orange'),
(3,     'yellow'),
(3,     'brown'),
(3,     'green'),
(3,     'cyan'),
(3,     'blue'),
(3,     'violet'),
(3,     'black'),
(3,     'gray'),
(3,     'grey'),
(3,     'white'),
(3,     'fb'),
(3,     'gh'),
(3,     'in'),
(3,     'pp'),
(3,     'tw'),
(3,     'pink-dark'),
(3,     'red-dark'),
(3,     'orange-dark'),
(3,     'yellow-dark'),
(3,     'brown-dark'),
(3,     'green-dark'),
(3,     'cyan-dark'),
(3,     'blue-dark'),
(3,     'violet-dark'),
(3,     'black-dark'),
(3,     'gray-dark'),
(3,     'grey-dark'),
(3,     'white-dark'),
(3,     'pink-light'),
(3,     'red-light'),
(3,     'orange-light'),
(3,     'yellow-light'),
(3,     'brown-light'),
(3,     'green-light'),
(3,     'cyan-light'),
(3,     'blue-light'),
(3,     'violet-light'),
(3,     'black-light'),
(3,     'gray-light'),
(3,     'grey-light'),
(3,     'white-light'),
(4,     'bounce'),
(4,     'grow'),
(4,     'shrink'),
(4,     'openX'),
(4,     'openY'),
(4,     'flipX'),
(4,     'flipY'),
(4,     'flipperX'),
(4,     'flipperY'),
(4,     'fallX'),
(4,     'fallY'),
(4,     'twistT'),
(4,     'twistR'),
(4,     'twistB'),
(4,     'twistL'),
(4,     'torsionT'),
(4,     'torsionR'),
(4,     'torsionB'),
(4,     'torsionL'),
(4,     'turn'),
(4,     'turnX'),
(4,     'turnY'),
(4,     'turnXY'),
(4,     'turnXZ'),
(4,     'turnYZ'),
(4,     'turn3D'),
(4,     'slideT'),
(4,     'slideR'),
(4,     'slideB'),
(4,     'slideL'),
(4,     'slideTR'),
(4,     'slideBR'),
(4,     'slideBL'),
(4,     'slideTL'),
(4,     'originT'),
(4,     'originR'),
(4,     'originB'),
(4,     'originL'),
(5,     'body-background-color'),
(5,     'body-color'),
(5,     'body-font-size'),
(5,     'body-line-height'),
(5,     'body-scroll-behavior'),
(5,     'main-text-align'),
(5,     'article-margin-bottom'),
(5,     'title-text-align'),
(5,     'title-wd-font-size'),
(5,     'title-wd-text-transform'),
(5,     'title-lg-font-size'),
(5,     'title-lg-text-transform'),
(5,     'title-md-font-size'),
(5,     'title-sm-font-size'),
(5,     'title-tn-font-size'),
(5,     'link-outline'),
(5,     'link-text-decoration'),
(5,     'link-color'),
(5,     'list-margin'),
(5,     'list-padding'),
(5,     'list-style'),
(5,     'figure-margin'),
(5,     'img-height'),
(5,     'img-max-width'),
(5,     'img-object-fit'),
(5,     'table-border-collapse'),
(5,     'table-margin'),
(5,     'table-text-align'),
(5,     'table-vertical-align'),
(5,     'code-overflow'),
(5,     'code-margin'),
(5,     'code-padding'),
(5,     'code-width'),
(5,     'code-text-align'),
(5,     'code-background-color'),
(5,     'code-color'),
(6,     'flex-place-content'),
(6,     'column-padding'),
(6,     'row-padding'),
(6,     'grid-max-width'),
(6,     'gap-tn'),
(6,     'gap-sm'),
(6,     'gap-md'),
(6,     'gap-lg'),
(6,     'gap-wd'),
(6,     'place-content-start'),
(6,     'place-content-end'),
(6,     'place-items-base'),
(6,     'place-items-start'),
(6,     'place-items-end'),
(6,     'place-self-base'),
(6,     'place-self-start'),
(6,     'place-self-end'),
(7,     'animation-duration'),
(7,     'animation-duration-tn'),
(7,     'animation-duration-sm'),
(7,     'animation-duration-md'),
(7,     'animation-duration-lg'),
(7,     'animation-duration-wd'),
(7,     'animation-timing-funtion-linear'),
(7,     'animation-timing-funtion-in'),
(7,     'animation-timing-funtion-out'),
(7,     'animation-timing-funtion-inout'),
(7,     'animation-timing-funtion-bezier'),
(7,     'animation-timing-funtion-start'),
(7,     'animation-timing-funtion-end'),
(7,     'animation-timing-funtion-chrono'),
(7,     'animation-timing-funtion-timer'),
(7,     'animation-iteration-count-few'),
(7,     'animation-iteration-count-many'),
(7,     'animation-iteration-count-loop'),
(7,     'animation-delay-small'),
(7,     'animation-delay-medium'),
(7,     'animation-delay-large'),
(8,     'margin-none'),
(8,     'margin-sm'),
(8,     'margin-md'),
(8,     'margin-lg'),
(8,     'margin-top-sm'),
(8,     'margin-top-md'),
(8,     'margin-top-lg'),
(8,     'margin-right-sm'),
(8,     'margin-right-md'),
(8,     'margin-right-lg'),
(8,     'margin-bottom-sm'),
(8,     'margin-bottom-md'),
(8,     'margin-bottom-lg'),
(8,     'margin-left-sm'),
(8,     'margin-left-md'),
(8,     'margin-left-lg'),
(8,     'padding-none'),
(8,     'padding-sm'),
(8,     'padding-md'),
(8,     'padding-lg'),
(8,     'padding-top-sm'),
(8,     'padding-top-md'),
(8,     'padding-top-lg'),
(8,     'padding-right-sm'),
(8,     'padding-right-md'),
(8,     'padding-right-lg'),
(8,     'padding-bottom-sm'),
(8,     'padding-bottom-md'),
(8,     'padding-bottom-lg'),
(8,     'padding-left-sm'),
(8,     'padding-left-md'),
(8,     'padding-left-lg'),
(9,     'border-style'),
(9,     'border-width-tn'),
(9,     'border-width-sm'),
(9,     'border-width-md'),
(9,     'border-width-lg'),
(9,     'border-width-wd'),
(9,     'border-radius-square'),
(9,     'border-radius-curve'),
(9,     'border-radius-round'),
(9,     'border-radius-circle'),
(10,    'height-sm'),
(10,    'height-md'),
(10,    'height-lg'),
(10,    'max-height-sm'),
(10,    'max-height-md'),
(10,    'max-height-lg'),
(10,    'min-height-sm'),
(10,    'min-height-md'),
(10,    'min-height-lg'),
(10,    'width-sm'),
(10,    'width-md'),
(10,    'width-lg'),
(10,    'max-width-sm'),
(10,    'max-width-md'),
(10,    'max-width-lg'),
(10,    'min-width-sm'),
(10,    'min-width-md'),
(10,    'min-width-lg'),
(11,    'box-shadow-sm'),
(11,    'box-shadow-md'),
(11,    'box-shadow-lg'),
(11,    'box-shadow-blur'),
(11,    'box-shadow-blur-sm'),
(11,    'box-shadow-blur-md'),
(11,    'box-shadow-blur-lg'),
(11,    'box-shadow-spread'),
(11,    'box-shadow-spread-sm'),
(11,    'box-shadow-spread-md'),
(11,    'box-shadow-spread-lg'),
(11,    'text-shadow-sm'),
(11,    'text-shadow-md'),
(11,    'text-shadow-lg'),
(11,    'text-shadow-blur'),
(11,    'text-shadow-blur-sm'),
(11,    'text-shadow-blur-md'),
(11,    'text-shadow-blur-lg'),
(12,    'btn-margin'),
(12,    'btn-padding'),
(12,    'btn-font-size'),
(12,    'btn-font-weight'),
(12,    'btn-text-align'),
(12,    'btn-hover-border-radius'),
(12,    'btn-hover-transition'),
(12,    'btn-hover-animation'),
(12,    'btn-checked-transform'),
(12,    'btn-tn-padding'),
(12,    'btn-tn-font-size'),
(12,    'btn-sm-padding'),
(12,    'btn-sm-font-size'),
(12,    'btn-lg-padding'),
(12,    'btn-lg-font-size'),
(12,    'btn-wd-padding'),
(12,    'btn-wd-font-size'),
(12,    'btn-square-border-radius'),
(12,    'btn-square-padding-top'),
(12,    'btn-square-sizes'),
(12,    'btn-round-border-radius'),
(12,    'btn-round-padding-top'),
(12,    'btn-round-sizes'),
(12,    'btn-circle-border-radius'),
(12,    'btn-circle-padding-top'),
(12,    'btn-circle-sizes'),
(12,    'btn-border'),
(12,    'btn-border-radius'),
(12,    'btn-background-color'),
(12,    'btn-color'),
(12,    'btn-hover-border'),
(12,    'btn-hover-box-shadow'),
(12,    'btn-hover-background-color'),
(12,    'btn-hover-color'),
(12,    'button-border'),
(12,    'button-border-radius'),
(12,    'button-background-color'),
(12,    'button-color'),
(12,    'button-hover-border'),
(12,    'button-hover-box-shadow'),
(12,    'button-hover-background-color'),
(12,    'button-hover-color'),
(13,    'card-flex-direction'),
(13,    'card-place-content'),
(13,    'card-place-items'),
(13,    'card-position'),
(13,    'card-overflow'),
(13,    'card-margin'),
(13,    'card-border'),
(13,    'card-border-radius'),
(13,    'card-padding'),
(13,    'card-height'),
(13,    'card-max-width'),
(13,    'card-box-shadow'),
(13,    'card-background-color'),
(13,    'card-color'),
(13,    'card-hover-transform'),
(13,    'card-hover-transition'),
(13,    'card-child-margin'),
(13,    'card-child-border'),
(13,    'card-child-border-radius'),
(13,    'card-child-padding'),
(13,    'card-child-max-width'),
(13,    'card-child-background-color'),
(13,    'card-child-text-align'),
(13,    'card-selection-background-color'),
(13,    'card-selection-color'),
(13,    'card-title-font-size'),
(13,    'card-title-box-shadow'),
(13,    'card-title-text-shadow'),
(13,    'card-btn-width'),
(13,    'card-btn-font-weight'),
(13,    'card-btn-text-align'),
(13,    'card-btn-color'),
(13,    'card-btn-hover-border-color'),
(13,    'card-btn-hover-background-color'),
(13,    'card-btn-hover-color'),
(14,    'head-margin'),
(14,    'head-border'),
(14,    'head-border-radius'),
(14,    'head-padding'),
(14,    'head-max-width'),
(14,    'head-font-family'),
(14,    'head-font-size'),
(14,    'head-text-align'),
(14,    'head-box-shadow'),
(14,    'head-background-color'),
(14,    'head-color'),
(14,    'head-title-margin'),
(14,    'head-title-text-transform'),
(14,    'head-hover-transform'),
(14,    'head-hover-transition'),
(14,    'head-selection-background-color'),
(14,    'head-selection-color'),
(15,    'foot-text-align'),
(15,    'foot-title-margin'),
(15,    'foot-title-font-size'),
(15,    'foot-title-color'),
(15,    'foot-label-cursor'),
(15,    'foot-list-flex-direction'),
(15,    'foot-list-place-content'),
(15,    'foot-list-margin'),
(15,    'foot-list-background-color'),
(15,    'foot-list-cursor'),
(15,    'foot-list-link-color'),
(15,    'foot-list-link-hover-color'),
(15,    'foot-target-margin-left'),
(15,    'foot-hover-transform'),
(15,    'foot-hover-transition'),
(15,    'foot-hover-color'),
(15,    'foot-visual-place-content'),
(15,    'foot-visual-margin'),
(15,    'foot-visual-padding'),
(15,    'foot-visual-background-color'),
(15,    'foot-visual-link-cursor'),
(16,    'navbar-height'),
(16,    'navbar-place-content'),
(16,    'navbar-place-items'),
(16,    'navbar-position'),
(16,    'navbar-top'),
(16,    'navbar-right'),
(16,    'navbar-bottom'),
(16,    'navbar-left'),
(16,    'navbar-z-index'),
(16,    'navbar-background-color'),
(16,    'navbar-color'),
(16,    'navbar-link-padding'),
(16,    'navbar-link-color'),
(16,    'navbar-link-cursor'),
(16,    'navbar-icon-place-self'),
(16,    'navbar-list-place-items'),
(16,    'navbar-list-margin'),
(16,    'navbar-list-padding'),
(16,    'navbar-list-list-style'),
(16,    'navbar-list-link-flex-direction'),
(16,    'navbar-link-hover-color'),
(16,    'navbar-brand-link-left'),
(16,    'navbar-brand-link-img-height'),
(16,    'navbar-first-list-span-font-size'),
(16,    'navbar-first-list-link-hover-scale'),
(16,    'navbar-last-list-img-margin'),
(16,    'navbar-last-list-height'),
(16,    'navbar-last-list-link-hover-scale'),
(16,    'navbar-label-right'),
(17,    'sidebar-top'),
(17,    'sidebar-left'),
(17,    'sidebar-z-index'),
(17,    'sidebar-width'),
(17,    'sidebar-child-place-content'),
(17,    'sidebar-child-place-items'),
(17,    'sidebar-child-margin'),
(17,    'sidebar-child-border-radius'),
(17,    'sidebar-child-padding'),
(17,    'sidebar-child-width'),
(17,    'sidebar-child-background-color'),
(17,    'sidebar-child-color'),
(17,    'sidebar-child-cursor'),
(17,    'sidebar-children-margin'),
(17,    'sidebar-checked-child-font-weight'),
(17,    'sidebar-checked-child-background-color'),
(17,    'sidebar-checked-child-color'),
(18,    'menu-bottom'),
(18,    'menu-z-index'),
(18,    'menu-width'),
(18,    'menu-background-color'),
(18,    'menu-child-place-content'),
(18,    'menu-child-place-items'),
(18,    'menu-child-margin'),
(18,    'menu-child-border-radius'),
(18,    'menu-child-padding'),
(18,    'menu-child-width'),
(18,    'menu-child-background-color'),
(18,    'menu-child-color'),
(18,    'menu-child-cursor'),
(18,    'menu-children-margin'),
(18,    'menu-child-hover-border-radius'),
(18,    'menu-child-hover-background-color'),
(18,    'menu-child-hover-color'),
(18,    'menu-children-hover-transform'),
(18,    'menu-checked-child-font-size'),
(18,    'menu-checked-child-background-color'),
(18,    'menu-checked-child-color'),
(18,    'menu-footer-margin-bottom'),
(19,    'gallery-flex-wrap'),
(19,    'gallery-place-content'),
(19,    'gallery-place-items'),
(19,    'gallery-overflow'),
(19,    'gallery-margin'),
(19,    'gallery-max-width'),
(19,    'gallery-all-cursor'),
(19,    'gallery-figure-position'),
(19,    'gallery-figure-overflow'),
(19,    'gallery-figure-margin'),
(19,    'gallery-figure-border'),
(19,    'gallery-figure-width'),
(19,    'gallery-figure-line-height'),
(19,    'gallery-figure-box-shadow'),
(19,    'gallery-figure-hover-figcaption-bottom'),
(19,    'gallery-figure-hover-figcaption-animation'),
(19,    'gallery-figcaption-position'),
(19,    'gallery-figcaption-bottom'),
(19,    'gallery-figcaption-padding'),
(19,    'gallery-figcaption-width'),
(19,    'gallery-figcaption-line-height'),
(19,    'gallery-figcaption-background-color'),
(19,    'gallery-figcaption-fa-position'),
(19,    'gallery-figcaption-fa-top'),
(19,    'gallery-figcaption-fa-right'),
(19,    'gallery-figcaption-fa-border'),
(19,    'gallery-figcaption-fa-radius'),
(19,    'gallery-figcaption-fa-padding'),
(19,    'gallery-figcaption-fa-background-color'),
(19,    'gallery-link-color'),
(19,    'gallery-link-all-margin'),
(19,    'gallery-link-all-padding'),
(19,    'gallery-link-all-font-size'),
(19,    'gallery-link-all-cursor'),
(20,    'form-margin'),
(20,    'form-border'),
(20,    'form-border-radius'),
(20,    'form-padding'),
(20,    'form-width'),
(20,    'form-box-shadow'),
(20,    'form-fieldset-border'),
(20,    'form-legend-margin'),
(20,    'form-legend-font-size'),
(20,    'form-legend-font-weight'),
(20,    'form-list-flex-direction'),
(20,    'form-list-place-content'),
(20,    'form-list-place-items'),
(20,    'form-label-margin'),
(20,    'form-label-padding'),
(20,    'form-label-font-size'),
(20,    'form-label-color'),
(20,    'form-label-text-decoration'),
(20,    'form-field-margin'),
(20,    'form-field-border'),
(20,    'form-field-border-radius'),
(20,    'form-field-outline'),
(20,    'form-field-padding'),
(20,    'form-field-width'),
(20,    'form-field-line-height'),
(20,    'form-field-background-color'),
(20,    'form-field-box-shadow'),
(20,    'form-field-hover-border'),
(20,    'form-field-hover-box-shadow'),
(20,    'form-field-placeholder-font-style'),
(20,    'form-field-placeholder-color'),
(20,    'form-action-margin'),
(20,    'form-action-border'),
(20,    'form-action-width'),
(20,    'form-action-font-size'),
(20,    'form-action-line-height'),
(20,    'form-action-cursor'),
(20,    'form-action-box-shadow'),
(20,    'form-action-hover-box-shadow'),
(20,    'form-action-hover-transform'),
(20,    'form-action-hover-transition'),
(20,    'form-reset-border'),
(20,    'form-reset-background-color'),
(20,    'form-reset-color'),
(20,    'form-reset-hover-border'),
(20,    'form-reset-hover-background-color'),
(20,    'form-reset-hover-color'),
(20,    'form-submit-border'),
(20,    'form-submit-background-color'),
(20,    'form-submit-color'),
(20,    'form-submit-hover-border'),
(20,    'form-submit-hover-background-color'),
(20,    'form-submit-hover-color'),
(21,    'table-border-spacing'),
(21,    'table-margin-bottom'),
(21,    'table-width'),
(21,    'table-font-size'),
(21,    'table-box-shadow'),
(21,    'table-caption-side'),
(21,    'table-caption-margin-bottom'),
(21,    'table-caption-font-size'),
(21,    'table-caption-font-weight'),
(21,    'table-caption-color'),
(21,    'table-caption-text-shadow'),
(21,    'table-title-font-style'),
(21,    'table-title-background-color'),
(21,    'table-title-color'),
(21,    'table-title-selection-background-color'),
(21,    'table-title-selection-color'),
(21,    'table-cell-border-style'),
(21,    'table-cell-border-width'),
(21,    'table-cell-border-radius'),
(21,    'table-cell-border-color'),
(21,    'table-cell-padding'),
(21,    'table-cell-text-align'),
(21,    'table-cell-vertical-align'),
(21,    'table-cell-cursor'),
(21,    'table-row-hover-box-shadow'),
(21,    'table-row-even-background-color'),
(21,    'table-row-even-color'),
(21,    'table-row-even-hover-background-color'),
(21,    'table-row-even-hover-color'),
(21,    'table-row-even-hover-box-shadow'),
(21,    'table-row-odd-background-color'),
(21,    'table-row-odd-color'),
(21,    'table-row-odd-hover-background-color'),
(21,    'table-row-odd-hover-color'),
(21,    'table-row-odd-hover-box-shadow'),
(22,    'slider-margin'),
(22,    'slider-width'),
(22,    'slider-figcaption-top'),
(22,    'slider-figcaption-padding'),
(22,    'slider-figcaption-width'),
(22,    'slider-figcaption-height'),
(22,    'slider-button-border'),
(22,    'slider-button-font-size'),
(22,    'slider-button-background'),
(22,    'slider-button-color'),
(22,    'slider-previous-top'),
(22,    'slider-previous-left'),
(22,    'slider-auto-top'),
(22,    'slider-auto-left'),
(22,    'slider-auto-opacity'),
(22,    'slider-random-top'),
(22,    'slider-random-left'),
(22,    'slider-random-opacity'),
(22,    'slider-random-hover-opacity'),
(22,    'slider-next-top'),
(22,    'slider-next-right'),
(22,    'slider-progress-place-content'),
(22,    'slider-progress-top'),
(22,    'slider-progress-margin-left'),
(22,    'slider-progress-width'),
(22,    'slider-progress-label-padding'),
(22,    'slider-progress-label-font-size'),
(22,    'slider-progress-label-color'),
(22,    'slider-checked-content'),
(23,    'canvas-border'),
(23,    'canvas-border-radius'),
(23,    'canvas-cursor'),
(23,    'canvas-hover-controls-opacity'),
(23,    'canvas-hover-controls-transition'),
(23,    'canvas-controls-margin'),
(23,    'canvas-controls-border'),
(23,    'canvas-controls-border-radius'),
(23,    'canvas-controls-width'),
(23,    'canvas-controls-background-color'),
(23,    'canvas-controls-opacity'),
(23,    'canvas-controls-transition'),
(23,    'canvas-controls-list-flex-direction'),
(23,    'canvas-controls-list-place-content'),
(23,    'canvas-controls-list-margin'),
(23,    'canvas-controls-label-padding'),
(23,    'canvas-controls-label-color');

INSERT INTO `ClassCat`
(`category`) VALUES
('init'),
('display'),
('position'),
('btn'),
('card'),
('head'),
('foot'),
('navbar'),
('sidebar'),
('menu'),
('gallery'),
('form'),
('table'),
('slider'),
('canvas'),
('box'),
('font'),
('color'),
('anima'),
('cursor');

INSERT INTO `ClassState`
(`state`) VALUES
('stateless'),
('helpers'),
('anima'),
('specific');

INSERT INTO `Class`
(`category_id`, `media`, `concat`, `state_id`, `name`) VALUES
(1,     0,  1,  1,  'container'),
(1,     1,  1,  1,  'container-50tn'),
(1,     1,  1,  1,  'container-60tn'),
(1,     1,  1,  1,  'container-70tn'),
(1,     1,  1,  1,  'container-80tn'),
(1,     1,  1,  1,  'container-90tn'),
(2,     1,  0,  2,  'hide'),
(2,     1,  0,  2,  'flex'),
(2,     1,  0,  2,  'block'),
(2,     1,  0,  2,  'inline'),
(2,     1,  0,  2,  'inflex'),
(2,     1,  0,  2,  'inblock'),
(2,     0,  1,  1,  'grid'),
(2,     1,  1,  1,  'grid-2tn'),
(2,     1,  1,  1,  'grid-3tn'),
(2,     1,  1,  1,  'grid-4tn'),
(2,     1,  1,  1,  'grid-5tn'),
(2,     1,  1,  1,  'grid-6tn'),
(2,     1,  1,  1,  'grid-7tn'),
(2,     1,  1,  1,  'grid-8tn'),
(2,     1,  1,  1,  'grid-9tn'),
(2,     1,  1,  1,  'grid-10tn'),
(2,     1,  1,  1,  'grid-11tn'),
(2,     1,  1,  1,  'grid-12tn'),
(2,     1,  1,  1,  'gap-tn'),
(2,     0,  0,  1,  'col'),
(2,     0,  0,  1,  'col-inverse'),
(2,     0,  0,  1,  'col-nowrap'),
(2,     0,  0,  1,  'col-reverse'),
(2,     0,  0,  1,  'row'),
(2,     0,  0,  1,  'row-inverse'),
(2,     0,  0,  1,  'row-nowrap'),
(2,     0,  0,  1,  'row-reverse'),
(2,     1,  0,  1,  'placo-start'),
(2,     1,  0,  1,  'placo-end'),
(2,     1,  0,  1,  'placo-around'),
(2,     1,  0,  1,  'placo-between'),
(2,     1,  0,  1,  'placo-evenly'),
(2,     1,  0,  1,  'placo-center'),
(2,     1,  0,  1,  'placo-stretch'),
(2,     1,  0,  1,  'plait-base'),
(2,     1,  0,  1,  'plait-start'),
(2,     1,  0,  1,  'plait-end'),
(2,     1,  0,  1,  'plait-normal'),
(2,     1,  0,  1,  'plait-center'),
(2,     1,  0,  1,  'plait-stretch'),
(2,     1,  0,  1,  'plase-base'),
(2,     1,  0,  1,  'plase-start'),
(2,     1,  0,  1,  'plase-end'),
(2,     1,  0,  1,  'plase-auto'),
(2,     1,  0,  1,  'plase-normal'),
(2,     1,  0,  1,  'plase-center'),
(2,     1,  0,  1,  'plase-stretch'),
(3,     1,  0,  2,  'absolute'),
(3,     1,  0,  2,  'fixed'),
(3,     1,  0,  2,  'relative'),
(3,     1,  0,  2,  'sticky'),
(4,     0,  1,  4,  'btn'),
(4,     0,  1,  4,  'button'),
(4,     0,  0,  4,  'btn-pink'),
(4,     0,  0,  4,  'button-pink'),
(4,     0,  0,  4,  'btn-red'),
(4,     0,  0,  4,  'button-red'),
(4,     0,  0,  4,  'btn-orange'),
(4,     0,  0,  4,  'button-orange'),
(4,     0,  0,  4,  'btn-yellow'),
(4,     0,  0,  4,  'button-yellow'),
(4,     0,  0,  4,  'btn-brown'),
(4,     0,  0,  4,  'button-brown'),
(4,     0,  0,  4,  'btn-green'),
(4,     0,  0,  4,  'button-green'),
(4,     0,  0,  4,  'btn-cyan'),
(4,     0,  0,  4,  'button-cyan'),
(4,     0,  0,  4,  'btn-blue'),
(4,     0,  0,  4,  'button-blue'),
(4,     0,  0,  4,  'btn-violet'),
(4,     0,  0,  4,  'button-violet'),
(4,     0,  0,  4,  'btn-black'),
(4,     0,  0,  4,  'button-black'),
(4,     0,  0,  4,  'btn-gray'),
(4,     0,  0,  4,  'button-gray'),
(4,     0,  0,  4,  'btn-grey'),
(4,     0,  0,  4,  'button-grey'),
(4,     0,  0,  4,  'btn-fb'),
(4,     0,  0,  4,  'button-fb'),
(4,     0,  0,  4,  'btn-gh'),
(4,     0,  0,  4,  'button-gh'),
(4,     0,  0,  4,  'btn-in'),
(4,     0,  0,  4,  'button-in'),
(4,     0,  0,  4,  'btn-pp'),
(4,     0,  0,  4,  'button-pp'),
(4,     0,  0,  4,  'btn-tw'),
(4,     0,  0,  4,  'button-tw'),
(4,     0,  0,  4,  'btn-tn'),
(4,     0,  0,  4,  'button-tn'),
(4,     0,  0,  4,  'btn-sm'),
(4,     0,  0,  4,  'button-sm'),
(4,     0,  0,  4,  'btn-md'),
(4,     0,  0,  4,  'button-md'),
(4,     0,  0,  4,  'btn-lg'),
(4,     0,  0,  4,  'button-lg'),
(4,     0,  0,  4,  'btn-xl'),
(4,     0,  0,  4,  'button-xl'),
(4,     0,  0,  4,  'btn-wd'),
(4,     0,  0,  4,  'button-wd'),
(4,     0,  0,  4,  'btn-square'),
(4,     0,  0,  4,  'button-square'),
(4,     0,  0,  4,  'btn-round'),
(4,     0,  0,  4,  'button-round'),
(4,     0,  0,  4,  'btn-circle'),
(4,     0,  0,  4,  'button-circle'),
(5,     0,  1,  4,  'card'),
(5,     0,  0,  4,  'card-pink'),
(5,     0,  0,  4,  'card-red'),
(5,     0,  0,  4,  'card-orange'),
(5,     0,  0,  4,  'card-yellow'),
(5,     0,  0,  4,  'card-brown'),
(5,     0,  0,  4,  'card-green'),
(5,     0,  0,  4,  'card-cyan'),
(5,     0,  0,  4,  'card-blue'),
(5,     0,  0,  4,  'card-violet'),
(6,     0,  0,  4,  'head'),
(7,     1,  0,  4,  'foot'),
(7,     1,  0,  4,  'foot-list'),
(7,     0,  0,  4,  'foot-visual'),
(8,     1,  0,  4,  'navbar'),
(8,     1,  0,  4,  'navbar-open'),
(8,     1,  0,  4,  'navbar-close'),
(9,     1,  0,  4,  'sidebar'),
(10,    1,  0,  4,  'menu'),
(11,    1,  0,  4,  'gallery'),
(12,    1,  0,  4,  'form'),
(13,    1,  0,  4,  'table'),
(14,    1,  0,  4,  'slider'),
(14,    1,  0,  4,  'slider-previous'),
(14,    1,  0,  4,  'slider-auto'),
(14,    1,  0,  4,  'slider-random'),
(14,    1,  0,  4,  'slider-next'),
(14,    1,  0,  4,  'slider-progress'),
(15,    1,  0,  4,  'canvas'),
(15,    1,  0,  4,  'canvas-controls');



INSERT INTO `Element`
(`name`, `link`, `definition`) VALUES
('Navbar',  'rRvxRe',   'The main Navigation Bar'),
('Head',    'BaQgVJe',  'The content Header'),
('Slider',  'QoryoX',   'A Slider for medias presentation'),
('Card',    'KKPmGvE',  'Containers for informations & elements'),
('Btn',     'LamGvj',   'Buttons for all actions'),
('Sidebar', 'mdOZKpQ',  'Another Navigation Bar'),
('Menu',    'rRvxbe',   'A Menu for navigation'),
('Gallery', 'NJMxmm',   'A Gallery for Visual Medias'),
('Form',    'EMLPzN',   'A Form for all user entries'),
('Canvas',  'LYbKreQ',  'A Canvas for drawing or signing'),
('Table',   'ZPoQNb',   'A Table to show many informations'),
('Foot',    'YgLwbe',   'The Footer for more links');

INSERT INTO `Theme`
(`name`, `link`, `definition`) VALUES
('Age',     'YzpmyMP',   'A theme about our time'),
('Anima',   'KKNOgZG',   'The Animadio theme'),
('Astro',   'yLVmYqp',   'A dark theme like space'),
('Magic',   'yLVmeYq',   'A theme with magic effect'),
('Spirit',  'BaQXjyR',   'A visual theme for the mind'),
('Tool',    'NWbQGZv',   'A theme about mecanic');
