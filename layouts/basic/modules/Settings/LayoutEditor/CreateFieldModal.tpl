{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
* Contributor(s): YetiForce.com
********************************************************************************/
-->*}
{strip}
	<div class="modal createFieldModal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title">{App\Language::translate('LBL_CREATE_CUSTOM_FIELD', $QUALIFIED_MODULE)}</h3>
				</div>
				<form class="form-horizontal createCustomFieldForm"  method="POST">
					<div class="modal-body">
						<div class="form-group">
							<div class="col-md-3 control-label">
								{App\Language::translate('LBL_SELECT_FIELD_TYPE', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="fieldTypesList form-control" name="fieldType">
									{foreach item=FIELD_TYPE from=$ADD_SUPPORTED_FIELD_TYPES}
										<option value="{$FIELD_TYPE}"
												{foreach key=TYPE_INFO item=TYPE_INFO_VALUE from=$FIELD_TYPE_INFO[$FIELD_TYPE]}
													data-{$TYPE_INFO}="{$TYPE_INFO_VALUE}"
												{/foreach}>
											{App\Language::translate($FIELD_TYPE, $QUALIFIED_MODULE)}
										</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3 control-label fieldLabelForm">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_LABEL_NAME', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<input type="text" maxlength="50" name="fieldLabel" value="" data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" class="form-control"
									   data-validator={\App\Json::encode([['name'=>'FieldLabel']])} />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3 control-label fieldNameForm">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_FIELD_NAME', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<input type="text" maxlength="30" name="fieldName" value="" data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" class="form-control"
									   data-validator={\App\Json::encode([['name'=>'fieldName']])} />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_FIELD_TYPE', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="marginLeftZero form-control" name="fieldTypeList">
									<option value="0">{App\Language::translate('LBL_FIELD_TYPE0', $QUALIFIED_MODULE)}</option>
									<option value="1">{App\Language::translate('LBL_FIELD_TYPE1', $QUALIFIED_MODULE)}</option>
								</select>
							</div>
						</div>
						<div class="form-group supportedType lengthsupported">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_LENGTH', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<input type="text" name="fieldLength" value="" data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" class="form-control" />
							</div>
						</div>
						<div class="form-group supportedType decimalsupported hide">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_DECIMALS', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<input type="text" name="decimal" value="" data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" class="form-control" />
							</div>
						</div>
						<div class="form-group supportedType preDefinedValueExists hide">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_PICKLIST_VALUES', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select id="picklistUi" class="form-control" name="pickListValues" multiple="" tabindex="-1" aria-hidden="true" placeholder="{App\Language::translate('LBL_ENTER_PICKLIST_VALUES', $QUALIFIED_MODULE)}" 
										data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" data-validator={\App\Json::encode([['name'=>'PicklistFieldValues']])}>
								</select>
							</div>
						</div>
						<div class="form-group supportedType preDefinedModuleList hide">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_RELATION_VALUES', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select {if $FIELD_TYPE_INFO['Related1M']['ModuleListMultiple'] eq true}multiple{/if} class="referenceModule form-control" name="referenceModule">
									{foreach item=MODULE_NAME from=$SUPPORTED_MODULES}
										<option value="{$MODULE_NAME}">{App\Language::translate($MODULE_NAME, $MODULE_NAME)}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="form-group supportedType preMultiReferenceValue hide">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_MULTI_REFERENCE_VALUE_MODULES', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="MRVModule form-control" name="MRVModule">
									{foreach item=RELATION from=$SELECTED_MODULE_MODEL->getRelations()}
										<option value="{$RELATION->get('modulename')}">{App\Language::translate($RELATION->get('label'), $RELATION->get('modulename'))}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="form-group supportedType preMultiReferenceValue hide">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_MULTI_REFERENCE_VALUE_FIELDS', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="MRVField form-control" name="MRVField">
									{foreach item=RELATION from=$SELECTED_MODULE_MODEL->getRelations()}
										{assign var=COUNT_FIELDS value=count($RELATION->getFields())}
										{foreach item=FIELD key=KEY from=$RELATION->getFields()}
											{if !isset($LAST_BLOCK) || $LAST_BLOCK->id != $FIELD->get('block')->id}
												<optgroup label="{App\Language::translate($FIELD->get('block')->label, $RELATION->get('modulename'))}" data-module="{$RELATION->get('modulename')}">
												{/if} 
												<option value="{$FIELD->getId()}" >{App\Language::translate($FIELD->get('label'), $RELATION->get('modulename'))}</option>
												{if $COUNT_FIELDS == ($KEY - 1)}
												</optgroup>
											{/if} 
											{assign var=LAST_BLOCK value=$FIELD->get('block')}
										{/foreach}
									{/foreach}
								</select>
							</div>
						</div>
						<div class="form-group supportedType preMultiReferenceValue hide">
							<div class="col-md-3 control-label">
								{App\Language::translate('LBL_MULTI_REFERENCE_VALUE_FILTER_FIELD', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="filterField form-control" name="MRVFilterField">
									{foreach item=RELATION from=$SELECTED_MODULE_MODEL->getRelations()}
										<option value="-" data-module="{$RELATION->get('modulename')}">{App\Language::translate('--None--')}</option>
										{foreach item=FIELD key=KEY from=$RELATION->getFields('picklist')}
											<option value="{$FIELD->getName()}" data-module="{$RELATION->get('modulename')}">{App\Language::translate($FIELD->get('label'), $RELATION->get('modulename'))}</option>
										{/foreach}
									{/foreach}
								</select>
							</div>
						</div>
						<div class="form-group supportedType preMultiReferenceValue hide">
							<div class="col-md-3 control-label">
								{App\Language::translate('LBL_MULTI_REFERENCE_VALUE_FILTER_VALUE', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="MRVModule form-control" name="MRVFilterValue">
								</select>
							</div>
						</div>
						<div class="form-group supportedType picklistOption hide">
							<div class="col-md-3 control-label">
								&nbsp;
							</div>
							<div class="col-md-8 controls">
								<label class="checkbox">
									<input type="checkbox" class="checkbox" name="isRoleBasedPickList" value="1" >&nbsp;{App\Language::translate('LBL_ROLE_BASED_PICKLIST',$QUALIFIED_MODULE)}
								</label>
							</div>
						</div>
						<div class="form-group supportedType preDefinedTreeList hide">
							<div class="col-md-3 control-label">
								<span class="redColor">*</span>&nbsp;
								{App\Language::translate('LBL_TREE_TEMPLATE', $QUALIFIED_MODULE)}
							</div>
							<div class="col-md-8 controls">
								<select class="TreeList form-control" name="tree">
									{foreach key=key item=item from=$SELECTED_MODULE_MODEL->getTreeTemplates($SELECTED_MODULE_NAME)}
										<option value="{$key}">{App\Language::translate($item, $SELECTED_MODULE_NAME)}</option>
									{foreachelse}
										<option value="-">{App\Language::translate('LBL_NONE')}</option>
									{/foreach}
								</select>
							</div>
						</div>
					</div>
					{include file=\App\Layout::getTemplatePath('ModalFooter.tpl', 'Vtiger')}
				</form>
			</div>
		</div>
	</div>
{/strip}
