{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Application Pascal                    }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit myRapFuncs0035;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, raFunc, ppRTTI, myUserInputForm;

type
  TmyUserInputFormFunction = class (TraSystemFunction)
  public
    class function Category: String; override;
  end;

  TmyShowStartupFormFunction = class(TmyUserInputFormFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;

  TmyShowMasterRecordFormFunction = class(TmyUserInputFormFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
  end;


implementation

{******************************************************************************
 *
 ** U S E R  I N P U T  F O R M   F U N C T I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TmyUserInputFormFunction.Category }
class function TmyUserInputFormFunction.Category: String;
begin
  Result := 'User Input Forms';
end; {class function Category}


{******************************************************************************
 *
 ** S H O W   S T A R T U P  F O R M   F U N C T I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TmyShowStartupFormFunction.GetSignature }

class function TmyShowStartupFormFunction.GetSignature: String;
begin
  Result := 'function ExecuteStartupForm(var aReportHeading: String; var aDestinationIndex: Integer): Boolean;';
end; {class function GetSignature}


{------------------------------------------------------------------------------}
{ TmyShowStartupFormFunction.ExecuteFunction }

procedure TmyShowStartupFormFunction.ExecuteFunction(aParams: TraParamList);
var
  lString: String;
  lInteger: Integer;
  lbResult: Boolean;
  lInputForm: TfrmMyUserInput;
begin
  GetParamValue(0, lString);
  GetParamValue(1, lInteger);

  lInputForm := TfrmMyUserInput.Create(Application);
  try
    lInputForm.InitDialog(True, lString, '');

    if lInputForm.ShowModal = mrOK then
      begin
        lString := lInputForm.ebHeading.Text;
        lInteger := lInputForm.rgDestination.ItemIndex;
        lbResult := True;
      end
    else
      lbResult := False;
  finally
    lInputForm.Free;
  end;

  SetParamValue(0, lString);
  SetParamValue(1, lInteger);
  SetParamValue(2, lbResult);

end; {procedure ExecuteFunction}


{******************************************************************************
 *
 ** S H O W   M A S T E R   R E C O R D  F O R M   F U N C T I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TmyShowMasterRecordFormFunction.GetSignature }

class function TmyShowMasterRecordFormFunction.GetSignature: String;
begin
  Result := 'function ExecuteMasterRecordForm(const aCompanyName: String; var aDisplayAddress: Boolean): Boolean;';
end; {class function GetSignature}

{------------------------------------------------------------------------------}
{ TmyShowMasterRecordFormFunction.ExecuteFunction }

procedure TmyShowMasterRecordFormFunction.ExecuteFunction(aParams: TraParamList);
var
  lString: String;
  lBoolean: Boolean;
  lbResult: Boolean;
  lInputForm: TfrmMyUserInput;
begin
  GetParamValue(0, lString);
  GetParamValue(1, lBoolean);

  lInputForm := TfrmMyUserInput.Create(Application);
  try
    lInputForm.InitDialog(False, '', lString);
    lInputForm.cbIncludeAddress.Checked := lBoolean;

    if lInputForm.ShowModal = mrOK then
      begin
        lBoolean := lInputForm.cbIncludeAddress.Checked;
        lbResult := True;
      end
    else
      lbResult := False;
  finally
    lInputForm.Free;
  end;

  SetParamValue(1, lBoolean);
  SetParamValue(2, lbResult);
end; {procedure ExecuteFunction}



initialization
  raRegisterFunction('ExecuteStartupForm', TmyShowStartupFormFunction);
  raRegisterFunction('ExecuteMasterRecordForm', TmyShowMasterRecordFormFunction);

finalization
  raUnRegisterFunction('ExecuteStartupForm');
  raUnRegisterFunction('ExecuteMasterRecordForm');

end.
 