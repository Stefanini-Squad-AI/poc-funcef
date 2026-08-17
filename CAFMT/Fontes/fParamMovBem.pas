unit fParamMovBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook,
  Wwdatsrc, Mask, wwdbedit, MontaSelect, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamMovBem = class(TfrmOkCancelar)
    Label6: TLabel;
    cmbGrupo: TwwDBLookupCombo;
    dteDataMovIni: TCMDateTimePicker;
    Label1: TLabel;
    dteDataMovFim: TCMDateTimePicker;
    Label2: TLabel;
    qryGrupo: TwwQuery;
    qryTipoMov: TwwQuery;
    qryTipoMovDESCTIPOMOVIMENTACAO: TStringField;
    qryTipoMovIDTIPOMOVIMENTACAO: TFloatField;
    cmbTipoMov: TwwDBLookupCombo;
    Label3: TLabel;
    qryGrupoNOME: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    Label4: TLabel;
    edDescBem: TwwDBEdit;
    bbtnSelBem: TBitBtn;
    qrySelBem: TwwQuery;
    dsSelBem: TwwDataSource;
    qrySelBemIDBEM: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESBEM: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dteDataMovIniExit(Sender: TObject);
    procedure dteDataMovFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelBemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraGrupo, sMascaraPlaca, sMascaraEmpresa : String;
  end;

var
  frmParamMovBem: TfrmParamMovBem;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf,  uMensErro, dAtivoFixo;

procedure TfrmParamMovBem.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   // Seleção de Grupo
   qryGrupo.Open;
   // Seleção de Tipo de Movimentação
   qryTipoMov.Open;
   // Seleção de Bem
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger := -1;
   qrySelBem.Open;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      sMascaraEmpresa := '';
      for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
      begin
         sMascaraEmpresa := sMascaraEmpresa + '#';
      end;
      //----------------------------------------------------------------------------------
      sMascaraGrupo  := FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      //----------------------------------------------------------------------------------
      if (FieldByName('SEQBEMEMP').AsFloat = 0) then
      begin
         sMascaraPlaca := sMascaraEmpresa + '.#########;0; ';
      end else
      begin
         sMascaraPlaca := sMascaraGrupo   + '.#######;0; '
      end;
      //----------------------------------------------------------------------------------
      Close;
   end;
   //-------------------------------------------------------------------------------------
   dteDataMovIni.Date := (date - 30);
   dteDataMovFim.Date := date;
end;
//========================================================================================
procedure TfrmParamMovBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryMovBem do
   begin
      Close;
      //----------------------------------------------------------------------------------
      if not qrySelBem.IsEmpty then
         SQL.Strings[18] := '   AND (B.IDBEM = ' + inttostr(qrySelBemIDBEM.AsInteger) + ')'
      else
         SQL.Strings[18] := ' ';
      //----------------------------------------------------------------------------------
      if cmbGrupo.Text <> '' then
         SQL.Strings[19] := '   AND (B.IDGRUPO = ' + inttostr(qryGrupoIDGRUPO.AsInteger) + ')'
      else
         SQL.Strings[19] := ' ';
      //----------------------------------------------------------------------------------
      if cmbTipoMov.Text <> '' then
         SQL.Strings[20] := '   AND (HM.IDTIPOMOVIMENTACAO = ' + inttostr(qryTipoMovIDTIPOMOVIMENTACAO.AsInteger) + ')'
      else
         SQL.Strings[20] := ' ';
      //----------------------------------------------------------------------------------
      ParamByName('PIDPESSOA').AsFloat      := Sistema.IdEmpresa;
      ParamByName('PDATAMOVINI').AsDateTime := dteDataMovIni.Date;
      ParamByName('PDATAMOVFIM').AsDateTime := dteDataMovFim.Date;
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      rpMovBemCalc1.DisplayFormat := sMascaraPlaca;
      rpMovBemLabel7.Text         := dteDataMovIni.Text;
      rpMovBemLabel8.Text         := dteDataMovFim.Text;
      //----------------------------------------------------------------------------------
      qryMovBem.Open;
      Screen.Cursor := crDefault;
      if qryMovBem.IsEmpty then
         if cmbGrupo.Text <> '' then
            MsgDlg('Não há movimentações no Periodo para o Grupo especificado!',
                   'Erro',mtError,[mbOk],0)
         else
            MsgDlg('Não há movimentações no Periodo especificado!',
                   'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamMovBem.dteDataMovIniExit(Sender: TObject);
begin
   inherited;
   if dteDataMovIni.Text = '' then
      dteDataMovIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamMovBem.dteDataMovFimExit(Sender: TObject);
begin
   inherited;
   if dteDataMovFim.Text = '' then
      dteDataMovFim.SetFocus;
end;

procedure TfrmParamMovBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupo.Close;
   qryTipoMov.Close;
   qrySelBem.Close;
end;

procedure TfrmParamMovBem.bbtnSelBemClick(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDBEM').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
   end else
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDBEM').AsInteger := -1;
      qrySelBem.Open;
   end;
   Screen.Cursor := crDefault;
end;

end.
