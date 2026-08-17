// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Marcio Sanches Spinosa
//Nº SOL......: 149111
//Nº KINTANA..: 1066131
//Data........: 09/01/2013
//Descrição...: Alteração no escopo do relatório, tratamento para substituição
// em tempo de execução das testemunhas e representante entre outros.
//------------------------------------------------------------------------------

unit fParamCartaComunicadoAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT, Db,
  DBTables, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons, TB97,
  TB97Tlbr, ComCtrls, uAutorizacao, IvDictio, IvMulti, wwdbdatetimepicker, DBClient, IvEMulti,
  CMDateTimePicker, uCMClientDataSet, uCmSqlParams, CmParamReport,
  CheckLst, ColorCheckListBox;

type
  TfrmParamCartaComunicadoAux = class(TfrmSelPessoalMT)
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Function ValidaCampos : boolean;//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
  public
    IdPessoaSel: string;
  end;

var
  frmParamCartaComunicadoAux: TfrmParamCartaComunicadoAux;

implementation

{$R *.DFM}

procedure TfrmParamCartaComunicadoAux.FormCreate(Sender: TObject);
begin
  inherited;
  IdPessoaSel := '-1';
end;

procedure TfrmParamCartaComunicadoAux.bbtnConfirmarClick(Sender: TObject);
begin
  if (ValidaCampos) then
  begin
    inherited;
    while not(CdsPrincipal.EOF) do
    begin
      if (IdPessoaSel = '-1') then
        IdPessoaSel := CdsPrincipal.FieldByName('IDPESSOA').asString
      else
        IdPessoaSel := IdPessoaSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

      CdsPrincipal.Next;
    end;
  end
  else
     Exit;
end;

//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
function TfrmParamCartaComunicadoAux.ValidaCampos: boolean;
Var isValidaCampos : Boolean;
begin
  isValidaCampos := True;
   if ((ednSal1.Text = EmptyStr) or (StrToFloat(ednSal1.Text) < 0))
      or ((ednSal2.Text = EmptyStr) or (StrToFloat(ednSal2.Text) < 0)) then
   begin
      ShowMessage('Falta preencher a Faixa de Salário.');
      isValidaCampos := False;
   end;

   if ((ednCep1.Text = EmptyStr) or (StrToFloat(ednCep1.Text) < 0))
      or ((ednCep2.Text = EmptyStr) or (StrToFloat(ednCep2.Text) < 0)) then
   begin
      ShowMessage('Falta preencher a Faixa de CEP. ');
      isValidaCampos := False;
   end;

   if (rgSelRamo.ItemIndex = 1) and (lstRamo.Items.Count <= 0) then
   begin
      ShowMessage('Falta preencher o Segmento. ');
      isValidaCampos := False;
   end;

   if (rgSelCargo.ItemIndex = 1) and (lstCargo.Items.Count <= 0) then
   begin
      ShowMessage('Falta preencher o Cargo. ');
      isValidaCampos := False;
   end;

   if (rgSelEstab.ItemIndex = 1) and (lstEstab.Items.Count <= 0) then
   begin
      ShowMessage('Falta preencher o Estabelecimento. ');
      isValidaCampos := False;
   end;

   if (rgSelSindi.ItemIndex = 1) and (lstSindicato.Items.Count <= 0) then
   begin
      ShowMessage('Falta preencher o Sindicato. ');
      isValidaCampos := False;
   end;

   Result := isValidaCampos;
end;
//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - fim

end.
