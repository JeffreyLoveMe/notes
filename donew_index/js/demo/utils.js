// https://blog.csdn.net/zgz682000/article/details/81223266
// jslint > jshint
/**
 * 根据elementId获取节点
 * @param {string} elementId
 * @returns {HTMLElement}
 */
function getElement(elementId) {
    var node = document.getElementById(elementId);
    return node;
}

/**
 * @param {HTMLElement} element
 * @returns {Element | ChildNode}
 */
function getFirstChildNode(element) {
    var node = element.firstElementChild || element.firstChild;
    return node;
}

/**
 * 获取该元素的最后一个元素子节点
 * @param {HTMLElement} element
 * @returns {Element | ChildNode}
 */
function getLastChildNode(element) {
    var node = element.lastElementChild || element.lastChild;
    return node;
}

/**
 * 获取该元素的下一个兄弟节点
 * @param {HTMLElement} element
 * @returns {Element | ChildNode}
 */
function getNextSiblingNode(element) {
    var node = element.nextElementSibling || element.nextSibling;
    return node;
}

/**
 * 获取该元素的上一个兄弟节点
 * @param {HTMLElement} element
 * @returns {Element | ChildNode}
 */
function getPreviousSiblingNode(element) {
    var node = element.previousElementSibling || element.previousSibling;
    return node;
}

/**
 * 获取给定index的兄弟节点
 * @param {HTMLElement} element
 * @returns {Element | ChildNode}
 */
function getSiblingNode(element, index) {
    var node = element.parentNode.children[index];
    return node;
}

/**
 * 查找给定元素的所有兄弟元素
 * @param {HTMLElement} element
 * @returns {Array}
 */
function getSiblingNodes(element) {
    var siblingElements = [];
    var p = element.parentNode.children;
    for (var i = 0; i < p.length; i++) {
        if (p[i] !== element) {
            siblingElements.push(p[i]);
        }
    }
    return siblingElements;
}
