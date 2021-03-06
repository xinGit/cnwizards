{*******************************************************}
{                                                       }
{       Pascal Script Source File                       }
{       Run by RemObjects Pascal Script in CnWizards    }
{                                                       }
{       Generated by CnPack IDE Wizards                 }
{                                                       }
{*******************************************************}

program FormEventDemo;

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ScriptEvent, TypInfo;

// To use this demo, you must add it to script list and check
// "smFormEditorNotify -> fetComponentCreated" item.

var
  FormEvent: TCnScriptFormEditorNotify;
  Comp: TComponent;
begin
  if (Event <> nil) and (Event.Mode = smFormEditorNotify) and
    (Event is TCnScriptFormEditorNotify) then
  begin
    FormEvent := TCnScriptFormEditorNotify(Event);
    if FormEvent.Component <> nil then
    begin
      Comp := FormEvent.Component;
      if Comp is TCustomMemo then
      begin
        if TCustomMemo(Comp).Lines.Text = Comp.Name then
        begin
          TCustomMemo(Comp).Lines.Clear;
          if Comp is TMemo then
            TMemo(Comp).ScrollBars := ssBoth;
        end;
      end
      else if Comp is TCustomEdit then
      begin
        if TCustomEdit(Comp).Text = Comp.Name then
          TCustomEdit(Comp).Text := ''; 
      end
      else if Comp is TComboBox then
      begin
        if TComboBox(Comp).Text = Comp.Name then
          TComboBox(Comp).Text := '';
      end
      else if Comp.ClassName = 'TADOConnection' then
      begin
        SetPropValue(Comp, 'LoginPrompt', False);
        SetPropValue(Comp, 'ConnectionString', '');
      end;  
    end;  
  end;
end.

