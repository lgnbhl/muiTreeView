#' SimpleTreeView
#' 
#' @description \url{https://mui.com/x/api/tree-view/simple-tree-view/}
#' 
#' @param ... Props to pass to the component.
#' @return Object with \code{shiny.tag} class suitable for use in the UI of a Shiny app.
#' 
#' @details
#' \itemize{
#' \item apiRef `{ current?: { focusItem?: func, getItem?: func, getItemDOMElement?: func, getItemOrderedChildrenIds?: func, getItemTree?: func, getParentId?: func, isItemExpanded?: func, setIsItemDisabled?: func, setItemExpansion?: func, setItemSelection?: func } }` \cr Default is - The ref object that allows Tree View manipulation. Can be instantiated with useTreeViewApiRef().
#' \item checkboxSelection `bool` \cr Default is FALSE If true, the Tree View renders a checkbox at the left of its label that allows selecting it.
#' \item children `node` \cr Default is - The content of the component.
#' \item classes `object` \cr Default is - Override or extend the styles applied to the component.See CSS classes API below for more details.
#' \item defaultExpandedItems `Array<string>` \cr Default is [] Expanded item ids. Used when the item's expansion is not controlled.
#' \item defaultSelectedItems `any` \cr Default is [] Selected item ids. (Uncontrolled) When multiSelect is true this takes an array of strings; when false (default) a string.
#' \item disabledItemsFocusable `bool` \cr Default is FALSE If true, will allow focus on disabled items.
#' \item disableSelection `bool` \cr Default is FALSE If true selection is disabled.
#' \item expandedItems `Array<string>` \cr Default is - Expanded item ids. Used when the item's expansion is controlled.
#' \item expansionTrigger `'content'| 'iconContainer'` \cr Default is 'content' The slot that triggers the item's expansion when clicked.
#' \item id `string` \cr Default is - This prop is used to help implement the accessibility logic. If you don't provide this prop. It falls back to a randomly generated id.
#' \item itemChildrenIndentation `number| string` \cr Default is 12px Horizontal indentation between an item and its children. Examples: 24, "24px", "2rem", "2em".
#' \item multiSelect `bool` \cr Default is FALSE If true, ctrl and shift will trigger multiselect.
#' \item onExpandedItemsChange `func` \cr Default is - Callback fired when Tree Items are expanded/collapsed.Signature:function(event: React.SyntheticEvent, itemIds: array) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemExpansion() method.itemIds The ids of the expanded items.
#' \item onItemClick `func` \cr Default is - Callback fired when the content slot of a given Tree Item is clicked.Signature:function(event: React.MouseEvent, itemId: string) => voidevent The DOM event that triggered the change.itemId The id of the focused item.
#' \item onItemExpansionToggle `func` \cr Default is - Callback fired when a Tree Item is expanded or collapsed.Signature:function(event: React.SyntheticEvent | null, itemId: array, isExpanded: boolean) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemExpansion() method.itemId The itemId of the modified item.isExpanded true if the item has just been expanded, false if it has just been collapsed.
#' \item onItemFocus `func` \cr Default is - Callback fired when a given Tree Item is focused.Signature:function(event: React.SyntheticEvent | null, itemId: string) => voidevent The DOM event that triggered the change. Warning: This is a generic event not a focus event.itemId The id of the focused item.
#' \item onItemSelectionToggle `func` \cr Default is - Callback fired when a Tree Item is selected or deselected.Signature:function(event: React.SyntheticEvent, itemId: array, isSelected: boolean) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemSelection() method.itemId The itemId of the modified item.isSelected true if the item has just been selected, false if it has just been deselected.
#' \item onSelectedItemsChange `func` \cr Default is - Callback fired when Tree Items are selected/deselected.Signature:function(event: React.SyntheticEvent, itemIds: Array | string) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemSelection() method.itemIds The ids of the selected items. When multiSelect is true, this is an array of strings; when false (default) a string.
#' \item selectedItems `any` \cr Default is - Selected item ids. (Controlled) When multiSelect is true this takes an array of strings; when false (default) a string.
#' \item selectionPropagation `{ descendants?: bool, parents?: bool }` \cr Default is  parents: FALSE, descendants: FALSE  When selectionPropagation.descendants is set to true.- Selecting a parent selects all its descendants automatically. - Deselecting a parent deselects all its descendants automatically.When selectionPropagation.parents is set to true.- Selecting all the descendants of a parent selects the parent automatically. - Deselecting a descendant of a selected parent deselects the parent automatically.Only works when multiSelect is true. On the <SimpleTreeView />, only the expanded items are considered (since the collapsed item are not passed to the Tree View component at all)
#' \item slotProps `object` \cr Default is - The props used for each component slot.
#' \item slots `object` \cr Default is - Overridable component slots.See Slots API below for more details.
#' \item sx `Array<func| object| bool>| func| object` \cr Default is - The system prop that allows defining system overrides as well as additional CSS styles.See the `sx` page for more details.
#' }
#'
#' @md
#' @name SimpleTreeView
NULL

#' RichTreeView
#' 
#' @description \url{https://mui.com/x/api/tree-view/rich-tree-view/}
#' 
#' @param ... Props to pass to the component.
#' @return Object with \code{shiny.tag} class suitable for use in the UI of a Shiny app.
#' 
#' @details
#' \itemize{
#' \item apiRef `{ current?: { focusItem?: func, getItem?: func, getItemDOMElement?: func, getItemOrderedChildrenIds?: func, getItemTree?: func, getParentId?: func, isItemExpanded?: func, setEditedItem?: func, setIsItemDisabled?: func, setItemExpansion?: func, setItemSelection?: func, updateItemLabel?: func } }` \cr Default is - The ref object that allows Tree View manipulation. Can be instantiated with useTreeViewApiRef().
#' \item checkboxSelection `bool` \cr Default is FALSE If true, the Tree View renders a checkbox at the left of its label that allows selecting it.
#' \item classes `object` \cr Default is - Override or extend the styles applied to the component.See CSS classes API below for more details.
#' \item defaultExpandedItems `Array<string>` \cr Default is [] Expanded item ids. Used when the item's expansion is not controlled.
#' \item defaultSelectedItems `any` \cr Default is [] Selected item ids. (Uncontrolled) When multiSelect is true this takes an array of strings; when false (default) a string.
#' \item disabledItemsFocusable `bool` \cr Default is FALSE If true, will allow focus on disabled items.
#' \item disableSelection `bool` \cr Default is FALSE If true selection is disabled.
#' \item expandedItems `Array<string>` \cr Default is - Expanded item ids. Used when the item's expansion is controlled.
#' \item expansionTrigger `'content'| 'iconContainer'` \cr Default is 'content' The slot that triggers the item's expansion when clicked.
#' \item getItemChildren `func` \cr Default is (item) => item.children Used to determine the children of a given item.Signature:function(item: R) => Arrayitem The item to check.
#' \item getItemId `func` \cr Default is (item) => item.id Used to determine the id of a given item.Signature:function(item: R) => stringitem The item to check.
#' \item getItemLabel `func` \cr Default is (item) => item.label Used to determine the string label for a given item.Signature:function(item: R) => stringitem The item to check.
#' \item id `string` \cr Default is - This prop is used to help implement the accessibility logic. If you don't provide this prop. It falls back to a randomly generated id.
#' \item isItemDisabled `func` \cr Default is - Used to determine if a given item should be disabled.Signature:function(item: R) => booleanitem The item to check.
#' \item isItemEditable `func| bool` \cr Default is () => FALSE Determine if a given item can be edited.
#' \item itemChildrenIndentation `number| string` \cr Default is 12px Horizontal indentation between an item and its children. Examples: 24, "24px", "2rem", "2em".
#' \item multiSelect `bool` \cr Default is FALSE If true, ctrl and shift will trigger multiselect.
#' \item onExpandedItemsChange `func` \cr Default is - Callback fired when Tree Items are expanded/collapsed.Signature:function(event: React.SyntheticEvent, itemIds: array) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemExpansion() method.itemIds The ids of the expanded items.
#' \item onItemClick `func` \cr Default is - Callback fired when the content slot of a given Tree Item is clicked.Signature:function(event: React.MouseEvent, itemId: string) => voidevent The DOM event that triggered the change.itemId The id of the focused item.
#' \item onItemExpansionToggle `func` \cr Default is - Callback fired when a Tree Item is expanded or collapsed.Signature:function(event: React.SyntheticEvent | null, itemId: array, isExpanded: boolean) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemExpansion() method.itemId The itemId of the modified item.isExpanded true if the item has just been expanded, false if it has just been collapsed.
#' \item onItemFocus `func` \cr Default is - Callback fired when a given Tree Item is focused.Signature:function(event: React.SyntheticEvent | null, itemId: string) => voidevent The DOM event that triggered the change. Warning: This is a generic event not a focus event.itemId The id of the focused item.
#' \item onItemLabelChange `func` \cr Default is - Callback fired when the label of an item changes.Signature:function(itemId: TreeViewItemId, newLabel: string) => voiditemId The id of the item that was edited.newLabel The new label of the items.
#' \item onItemSelectionToggle `func` \cr Default is - Callback fired when a Tree Item is selected or deselected.Signature:function(event: React.SyntheticEvent, itemId: array, isSelected: boolean) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemSelection() method.itemId The itemId of the modified item.isSelected true if the item has just been selected, false if it has just been deselected.
#' \item onSelectedItemsChange `func` \cr Default is - Callback fired when Tree Items are selected/deselected.Signature:function(event: React.SyntheticEvent, itemIds: Array | string) => voidevent The DOM event that triggered the change. Can be null when the change is caused by the publicAPI.setItemSelection() method.itemIds The ids of the selected items. When multiSelect is true, this is an array of strings; when false (default) a string.
#' \item selectedItems `any` \cr Default is - Selected item ids. (Controlled) When multiSelect is true this takes an array of strings; when false (default) a string.
#' \item selectionPropagation `{ descendants?: bool, parents?: bool }` \cr Default is  parents: FALSE, descendants: FALSE  When selectionPropagation.descendants is set to true.- Selecting a parent selects all its descendants automatically. - Deselecting a parent deselects all its descendants automatically.When selectionPropagation.parents is set to true.- Selecting all the descendants of a parent selects the parent automatically. - Deselecting a descendant of a selected parent deselects the parent automatically.Only works when multiSelect is true. On the <SimpleTreeView />, only the expanded items are considered (since the collapsed item are not passed to the Tree View component at all)
#' \item slotProps `object` \cr Default is  The props used for each component slot.
#' \item slots `object` \cr Default is  Overridable component slots.See Slots API below for more details.
#' \item sx `Array<func| object| bool>| func| object` \cr Default is - The system prop that allows defining system overrides as well as additional CSS styles.See the `sx` page for more details.
#' }
#'
#' @md
#' @name RichTreeView
NULL

#' TreeItem
#' 
#' @description \url{https://mui.com/x/api/tree-view/tree-item/}
#' 
#' @param ... Props to pass to the component.
#' @return Object with \code{shiny.tag} class suitable for use in the UI of a Shiny app.
#' 
#' @details
#' \itemize{
#' \item itemId `string` \cr Default is - The id of the item. Must be unique.
#' \item children `any` \cr Default is - The content of the component.
#' \item classes `object` \cr Default is - Override or extend the styles applied to the component.See CSS classes API below for more details.
#' \item disabled `bool` \cr Default is FALSE If true, the item is disabled.
#' \item id `string` \cr Default is - The id attribute of the item. If not provided, it will be generated.
#' \item label `node` \cr Default is - The label of the item.
#' \item onBlur `func` \cr Default is - Callback fired when the item root is blurred.
#' \item onFocus `unsupportedProp` \cr Default is - This prop isn't supported. Use the onItemFocus callback on the tree if you need to monitor an item's focus.
#' \item onKeyDown `func` \cr Default is - Callback fired when a key is pressed on the keyboard and the tree is in focus.
#' \item slotProps `object` \cr Default is  The props used for each component slot.
#' \item slots `object` \cr Default is  Overridable component slots.See Slots API below for more details.
#' \item sx `Array<func| object| bool>| func| object` \cr Default is - The system prop that allows defining system overrides as well as additional CSS styles.See the `sx` page for more details.
#' }
#'
#' @md
#' @name TreeItem
NULL

#' TreeItemIcon
#' 
#' @description \url{https://mui.com/x/api/tree-view/tree-item-icon/}
#' 
#' @param ... Props to pass to the component.
#' @return Object with \code{shiny.tag} class suitable for use in the UI of a Shiny app.
#' 
#' @details
#' \itemize{
#' \item slotProps `object` \cr Default is  The props used for each component slot.
#' \item slots `object` \cr Default is  Overridable component slots.See Slots API below for more details.
#' }
#'
#' @md
#' @name TreeItemIcon
NULL

