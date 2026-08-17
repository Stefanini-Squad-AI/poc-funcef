unit frParamRecEncargosPlanoxPatro;
{-------------------------------------------------------------------------------
  Data      : 28/08/2006
  Autor     : Bruno Bastos
  Pendência : 22086
  Descrição : Implementação de quebra por plano e patro.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
  Data      : 01/11/2005
  Autor     : Rodolpho da Silva
  Pendência : 20581
  Descrição : Corrigido o erro em que ao selecionar mais de 1 (um) tipo de
              encargo, os demais selecionados eram ignorados.
-------------------------------------------------------------------------------}
//===========================================================================
// Data      : 19/09/2005
// Autor     : Rodolpho da Silva
// Pendência : 20204
// Descrição : Corrigido o erro em que ao gerar o relatório e não marcar nenhuma
//             opção, gerava o erro "Invalid Data Packet". Agora,
//
//===========================================================================
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  uCmSqlParams,uCtrlParamIntegra, wwdblook;

type
  TfrmParamRecEncargosPlanoxPatro = class(TfrmParamReports_Padrao)
    DtIni: TCMDateTimePicker;
    DtFim: TCMDateTimePicker;
    DtRec: TCMDateTimePicker;
    clbTipoEncargo: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SqlTipoEncargo: TCMSqlParams;
    CdsTipoEncargo: TCMClientDataSet;
    btnDesmarca: TBitBtn;
    btnMarcaTodos: TBitBtn;
    Label5: TLabel;
    dblkPlanoPrevContabil: TwwDBLookupCombo;
    dblkPatro: TwwDBLookupCombo;
    Label6: TLabel;
    cdsPlanoContabil: TCMClientDataSet;
    SqlPlanoContabil: TCMSqlParams;
    SqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDesmarcaClick(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkPlanoPrevContabilExit(Sender: TObject);
  private
    { Private declarations }
    Lista : TStringList;
  public
    { Public declarations }
  end;

var
  frmParamRecEncargosPlanoxPatro: TfrmParamRecEncargosPlanoxPatro;

implementation

uses uSistema, uMensErro;

{$R *.DFM}



procedure TfrmParamRecEncargosPlanoxPatro.FormShow(Sender: TObject);
begin
  inherited;
  Lista := TStringList.Create;

  dtIni.Date := Date;
  dtFim.Date := Date;
  dtRec.Date := Date; 

  SqlTipoEncargo.Sql.Clear;
  SqlTipoEncargo.SQL.text := ' SELECT ' +
    '    TIPOAGRE.DESCCUSTAGREG, ' +
    '    TIPOAGRE.CODTIPOCUSTAGREG ' +
    ' FROM ' +
    '    TIPOAGRE, ' +
    '    TIPOALTERADOR ' +
    ' WHERE ' +
    '    ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND ' +
    '    ( TIPOAGRE.CODTRATFISCD IN (''8'',''9'',''A'') ) AND ' +
    '    (((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', '8', 'A') +
      ''') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ' +
    '     ((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'A', '8') +
      ''') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR ' +
    '     (TIPOALTERADOR.ACRESDECRES IS NULL)) ' +
    ' ORDER BY DESCCUSTAGREG';
  SqlTipoEncargo.Open;
  clbTipoEncargo.Items.Clear;
  while not CdsTipoEncargo.Eof do
  begin
     clbTipoEncargo.Items.Add(CdsTipoEncargo.FieldByName('DESCCUSTAGREG').AsString);
     Lista.Add(CdsTipoEncargo.FieldByName('CODTIPOCUSTAGREG').AsString);
     CdsTipoEncargo.Next;
  end;

  //Bruno Bastos - Pend. 22086 - Início
  SqlPatro.Open;
  SqlPlanoContabil.Open;
  //Bruno Bastos - Pend. 22086 - Fim

end;



procedure TfrmParamRecEncargosPlanoxPatro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Lista.Free;
   inherited;
end;



procedure TfrmParamRecEncargosPlanoxPatro.btnDesmarcaClick(Sender: TObject);
var
    i : Integer;
begin
   inherited;
   for i := 0 to (clbTipoEncargo.Items.Count - 1) do clbTipoEncargo.Checked[i] := False;
end;



procedure TfrmParamRecEncargosPlanoxPatro.btnMarcaTodosClick(Sender: TObject);
var
    i : Integer;
begin
   inherited;
   for i := 0 to (clbTipoEncargo.Items.Count - 1) do clbTipoEncargo.Checked[i] := True;
end;



procedure TfrmParamRecEncargosPlanoxPatro.bbtnConfirmarClick(Sender: TObject);
var
    i      : Integer;
    sLista : String;
begin
   inherited;
   Cmp_Padrao.ParamValues[0].AsDateTime := DtIni.Date;
   Cmp_Padrao.ParamValues[1].AsDateTime := DtFim.Date;
   Cmp_Padrao.ParamValues[3].AsDateTime := DtRec.Date;

   //Bruno Bastos - Pend. 22086 - Início
   Cmp_Padrao.ParamValues[4].AsString := dblkPlanoPrevContabil.LookupValue;
   Cmp_Padrao.ParamValues[5].AsString := dblkPatro.LookupValue;
   //Bruno Bastos - Pend. 22086 - Fim

   sLista := '';
   for i := 0 to (clbTipoEncargo.Items.Count - 1) do
   begin
      if clbTipoEncargo.Checked[i] then
      begin
         // Rodolpho da Silva - P: 20581
         if sLista = '' then
            sLista := Lista.Strings[i]
         else
            sLista := sLista + ',' + Lista.Strings[i];
      end;
   end;

   if (sLista <> '')then
      Cmp_Padrao.ParamValues[2].AsString := '(' + sLista + ')';

   inherited;
   // Fim - Rodolpho da Silva - P: 20204 - 19/09/2005
end;

procedure TfrmParamRecEncargosPlanoxPatro.dblkPlanoPrevContabilExit(
  Sender: TObject);
begin
  inherited;
  //Bruno Bastos - Pend. 22086 - Início
  If (dblkPatro.LookupValue <> '') And (dblkPlanoPrevContabil.LookupValue <> '') Then
  Begin
    SqlAux.Sql.Clear;
    SqlAux.SQL.text :=
      ' SELECT 1 ' +
      ' FROM PLANPREVCONTABPATRO ' +
      ' WHERE IDPATRO = '+ dblkPatro.LookupValue +
      '   AND IDPLANOPREV = '+ dblkPlanoPrevContabil.LookupValue;
    SqlAux.Open;

    if cdsAux.IsEmpty Then
    Begin
      MsgDlg('Plano Previdenciário Contábil não está relacionado a Patrocinadora selecionada. ', 'Informação', mtInformation, [mbOk], 0 );
      bbtnConfirmar.Enabled := False;
    End
    Else
      bbtnConfirmar.Enabled := True;
  End
  Else
    bbtnConfirmar.Enabled := True;
  //Bruno Bastos - Pend. 22086 - Fim
end;

end.
