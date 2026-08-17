unit fParamTransfPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, wwdblook,
  Wwquery, ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamTransfPatGrp = class(TfrmOkCancelar)
    Label1: TLabel;
    dtedIni: TCMDateTimePicker;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    prgbar: TProgressBar;
    qryParamCaf: TwwQuery;
    qryGrpAnaliticos: TwwQuery;
    qryGrpSinteticos: TwwQuery;
    qryMovPatGrp: TwwQuery;
    updMovPatGrp: TUpdateSQL;
    dtedFim: TCMDateTimePicker;
    Label2: TLabel;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    qryGrpSinteticosCLASSE: TStringField;
    qryGrpSinteticosNOME: TStringField;
    rdgGrupo: TRadioGroup;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    cmbGrupoIni: TwwDBLookupCombo;
    Label3: TLabel;
    qryMovPatGrpCLASSE: TStringField;
    qryMovPatGrpDESCGRUPO: TStringField;
    qryMovPatGrpS_A: TStringField;
    qryMovPatGrpENTRADAS: TFloatField;
    qryMovPatGrpSAIDAS: TFloatField;
    qryMovPatGrpSALDO: TFloatField;
    qryGrpAnaliticosCODGRUPO: TStringField;
    qryGrpAnaliticosCODGRUPOANT: TStringField;
    qryGrpAnaliticosPLACA: TFloatField;
    qryGrpAnaliticosVALORG: TFloatField;
    qryGrpAnaliticosDESBEM: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupoIni : Integer;
    sMascaraGrupo : String;
    function ConvNum(fNum : Extended) : Extended;
  end;

var
  frmParamTransfPatGrp: TfrmParamTransfPatGrp;

implementation

uses dRelOperCaf, uSistema, uMensErro;

{$R *.DFM}

//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TfrmParamTransfPatGrp.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.4f',[fNum]));
end;
//========================================================================================
procedure TfrmParamTransfPatGrp.FormCreate(Sender: TObject);
Var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then
      qryGrupoIni.Prepare;
   if not qryGrpAnaliticos.Prepared then
      qryGrpAnaliticos.Prepare;
   if not qryGrpSinteticos.Prepared then
      qryGrpSinteticos.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamCaf.Open;
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   dtedIni.Date := date - 30;
   dtedFim.Date := date;
end;
//========================================================================================
procedure TfrmParamTransfPatGrp.FormActivate(Sender: TObject);
begin
   inherited;
   rdgGrupo.SetFocus;
end;
//========================================================================================
procedure TfrmParamTransfPatGrp.bbtnConfirmarClick(Sender: TObject);
var
   fEntradas, fSaidas, fSaldo  : Extended;
   qryTransfPatGrp             : TwwQuery;
   iTam                        : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   qryTransfPatGrp := TwwQuery(dtmRelOperCaf.qryTransfPatGrp);
   //-------------------------------------------------------------------------------------
   qryMovPatGrp.Open;
   pnlStatus.Visible := True;
   lblStatus.Caption := 'Processando Grupos Analíticos ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   qryGrpAnaliticos.Close;
   if iGrupoIni <> 0 then
   begin
      qryGrpAnaliticos.SQL.Strings[10] := ' AND (B.IDGRUPO = '+IntToStr(iGrupoIni)+') ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[10] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if rdgGrupo.ItemIndex = 0 then
   begin
      qryGrpAnaliticos.SQL.Strings[11] := ' AND (G.FLGIMOVEL = 0) ';
   end else
   if rdgGrupo.ItemIndex = 1 then
   begin
      qryGrpAnaliticos.SQL.Strings[11] := ' AND (G.FLGIMOVEL = 1) ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[11] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   qryGrpAnaliticos.ParamByName('PDATAINI').AsDateTime := dtedIni.Date;
   qryGrpAnaliticos.ParamByName('PDATAFIM').AsDateTime := dtedFim.Date;
   qryGrpAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryGrpAnaliticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpAnaliticos.EOF do
   begin
      lblStatus.Caption := 'Processando Grupos Analíticos - Placa '+qryGrpAnaliticosPLACA.AsString;
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Processa o grupo atual
      //----------------------------------------------------------------------------------
      if qryMovPatGrp.Locate('CLASSE',qryGrpAnaliticos.FieldByName('CODGRUPO').AsString,[]) then
      begin
         qryMovPatGrp.Edit;
         qryMovPatGrp.FieldByName('ENTRADAS').AsCurrency := ConvNum(qryMovPatGrp.FieldByName('ENTRADAS').AsFloat + qryGrpAnaliticos.FieldByName('VALORG').AsFloat);
         qryMovPatGrp.FieldByName('SALDO').AsCurrency    := ConvNum(qryMovPatGrp.FieldByName('SALDO').AsFloat    + qryGrpAnaliticos.FieldByName('VALORG').AsFloat);
      end;
      //----------------------------------------------------------------------------------
      // Processa o grupo anterior
      //----------------------------------------------------------------------------------
      if qryMovPatGrp.Locate('CLASSE',qryGrpAnaliticos.FieldByName('CODGRUPOANT').AsString,[]) then
      begin
         qryMovPatGrp.Edit;
         qryMovPatGrp.FieldByName('SAIDAS').AsCurrency := ConvNum(qryMovPatGrp.FieldByName('SAIDAS').AsFloat + qryGrpAnaliticos.FieldByName('VALORG').AsFloat);
         qryMovPatGrp.FieldByName('SALDO').AsCurrency  := ConvNum(qryMovPatGrp.FieldByName('SALDO').AsFloat  - qryGrpAnaliticos.FieldByName('VALORG').AsFloat);
      end;
      //----------------------------------------------------------------------------------
      qryGrpAnaliticos.Next;
   end;
   qryGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Processando Grupos Sintéticos ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Sintéticos
   //-------------------------------------------------------------------------------------
   qryGrpSinteticos.Open;
   prgBar.Max      := qryGrpSinteticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpSinteticos.EOF do
   begin
      iTam      := length(qryGrpSinteticosCLASSE.AsString);
      fEntradas := 0;
      fSaidas   := 0;
      fSaldo    := 0;
      //----------------------------------------------------------------------------------
      qryMovPatGrp.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[loPartialKey]);
      while (not qryMovPatGrp.EOF) and
            (copy(qryMovPatGrp.FieldByName('CLASSE').AsString,1,iTam) = qryGrpSinteticosCLASSE.AsString) do
      begin
         fEntradas := ConvNum(fEntradas + qryMovPatGrp.FieldByName('ENTRADAS').AsFloat);
         fSaidas   := ConvNum(fSaidas   + qryMovPatGrp.FieldByName('SAIDAS').AsFloat);
         fSaldo    := ConvNum(fSaldo    + qryMovPatGrp.FieldByName('SALDO').AsFloat);
         qryMovPatGrp.Next;
      end;
      //----------------------------------------------------------------------------------
      qryMovPatGrp.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[]);
      qryMovPatGrp.Edit;
      qryMovPatGrp.FieldByName('ENTRADAS').AsCurrency := fEntradas;
      qryMovPatGrp.FieldByName('SAIDAS').AsCurrency   := fSaidas;
      qryMovPatGrp.FieldByName('SALDO').AsCurrency    := fSaldo;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   if qryMovPatGrp.IsEmpty then
      MsgDlg('Não existem transferências no Periodo/Grupo selecionados!','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryTransfPatGrp.Close;
   qryTransfPatGrp.Open;
   prgBar.Max      := qryMovPatGrp.RecordCount;
   prgBar.Position := 0;
   qryMovPatGrp.First;
   while not qryMovPatGrp.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
      begin
         Application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      if not ((qryMovPatGrp.FieldByName('ENTRADAS').AsFloat = 0) and
              (qryMovPatGrp.FieldByName('SAIDAS').AsFloat = 0) and
              (qryMovPatGrp.FieldByName('SALDO').AsFloat = 0)) then
      begin
         qryTransfPatGrp.Insert;
         qryTransfPatGrp.FieldByName('CLASSE').AsString     := qryMovPatGrp.FieldByName('CLASSE').AsString;
         qryTransfPatGrp.FieldByName('DESCGRUPO').AsString  := qryMovPatGrp.FieldByName('DESCGRUPO').AsString;
         qryTransfPatGrp.FieldByName('S_A').AsString        := qryMovPatGrp.FieldByName('S_A').AsString;
         qryTransfPatGrp.FieldByName('ENTRADAS').AsCurrency := qryMovPatGrp.FieldByName('ENTRADAS').AsFloat;
         qryTransfPatGrp.FieldByName('SAIDAS').AsCurrency   := qryMovPatGrp.FieldByName('SAIDAS').AsFloat;
         qryTransfPatGrp.FieldByName('SALDO').AsCurrency    := qryMovPatGrp.FieldByName('SALDO').AsFloat;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryMovPatGrp.Next;
   end;
   qryMovPatGrp.CancelUpdates;
   qryMovPatGrp.Close;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelOperCaf.ppLabel92.Text := dtedIni.Text;
   dtmRelOperCaf.ppLabel93.Text := dtedFim.Text;
   dtmRelOperCaf.ppDBText32.DisplayFormat := sMascaraGrupo;
   dtmRelOperCaf.ppDBText35.DisplayFormat := '#,0.00;(#,0.00)';
   dtmRelOperCaf.ppDBText36.DisplayFormat := '#,0.00;(#,0.00)';
   dtmRelOperCaf.ppDBText37.DisplayFormat := '#,0.00;(#,0.00)';
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamTransfPatGrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupoIni.Close;
   qryGrpAnaliticos.Close;
   qryGrpSinteticos.Close;
   qryMovPatGrp.Close;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.UnPrepare;
   qryGrpAnaliticos.UnPrepare;
   qryGrpSinteticos.UnPrepare;
   qryMovPatGrp.UnPrepare;
end;
//========================================================================================
procedure TfrmParamTransfPatGrp.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if cmbGrupoIni.Text = '' then
      iGrupoIni := 0
   else
      iGrupoIni := qryGrupoIni.FieldByName('IDGRUPO').AsInteger;
end;

end.
