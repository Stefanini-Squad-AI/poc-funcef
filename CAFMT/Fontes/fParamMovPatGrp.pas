unit fParamMovPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, wwdblook,
  Wwquery, ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamMovPatGrp = class(TfrmOkCancelar)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryGrupoIni: TwwQuery;
    qryGrupoFim: TwwQuery;
    dblckCmbGrupoIni: TwwDBLookupCombo;
    dblckCmbGrupoFim: TwwDBLookupCombo;
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
    qryMovPatGrpCLASSE: TStringField;
    qryMovPatGrpDESCGRUPO: TStringField;
    qryMovPatGrpS_A: TStringField;
    qryMovPatGrpSLDANT: TFloatField;
    qryMovPatGrpDEBITOS: TFloatField;
    qryMovPatGrpCREDITOS: TFloatField;
    qryMovPatGrpSLDATU: TFloatField;
    qryGrpAnaliticosCLASSE: TStringField;
    qryGrpAnaliticosDESCGRUPO: TStringField;
    qryGrpAnaliticosTIPO: TStringField;
    qryGrpAnaliticosSLDANT: TFloatField;
    qryGrpAnaliticosDEBITOS: TFloatField;
    qryGrpAnaliticosCREDITOS: TFloatField;
    qryGrpAnaliticosPLACA: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckCmbGrupoIniExit(Sender: TObject);
    procedure dblckCmbGrupoFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupoIni, iGrupoFim : Integer;
    sMascaraGrupo : String;
    function ConvNum(fNum : Extended) : Extended;
  end;

var
  frmParamMovPatGrp: TfrmParamMovPatGrp;

implementation

uses dRelOperCaf, uSistema, uMensErro;

{$R *.DFM}

//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TfrmParamMovPatGrp.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.4f',[fNum]));
end;
//========================================================================================
procedure TfrmParamMovPatGrp.FormActivate(Sender: TObject);
Var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then
      qryGrupoIni.Prepare;
   if not qryGrupoFim.Prepared then
      qryGrupoFim.Prepare;
   if not qryGrpAnaliticos.Prepared then
      qryGrpAnaliticos.Prepare;
   if not qryGrpSinteticos.Prepared then
      qryGrpSinteticos.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   qryGrupoIni.First;
   iGrupoIni := qryGrupoIni.FieldByName('IDGRUPO').AsInteger;
   qryGrupoFim.Open;
   qryGrupoFim.Last;
   iGrupoFim := qryGrupoFim.FieldByName('IDGRUPO').AsInteger;
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
   dtedIni.Date := date;
   dtedFim.Date := date;
   dtedIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamMovPatGrp.bbtnConfirmarClick(Sender: TObject);
var
   fSldAtu, fSldAnt, fDebitos, fCreditos : Extended;
   qryMovPat                             : TwwQuery;
   iTam                                  : Integer;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   qryMovPat := TwwQuery(dtmRelOperCaf.qryMovPatGrp);
   //-------------------------------------------------------------------------------------
   qryMovPatGrp.Open;
   pnlStatus.Visible := True;
   lblStatus.Caption := 'Processando Grupos Analíticos ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   qryGrpAnaliticos.Close;
   qryGrpAnaliticos.ParamByName('PIDPESSOA').AsFloat      := Sistema.IdEmpresa;
   qryGrpAnaliticos.ParamByName('PDATAMOVINI').AsDateTime := dtedIni.Date;
   qryGrpAnaliticos.ParamByName('PDATAMOVFIM').AsDateTime := dtedFim.Date;
   qryGrpAnaliticos.ParamByName('PIDGRUPOINI').AsInteger  := iGrupoIni;
   qryGrpAnaliticos.ParamByName('PIDGRUPOFIM').AsInteger  := iGrupoFim;
   qryGrpAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryGrpAnaliticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpAnaliticos.EOF do
   begin
      if qryMovPatGrp.Locate('CLASSE',qryGrpAnaliticosCLASSE.AsString,[]) then
      begin
         while (not qryGrpAnaliticos.EOF) and (qryGrpAnaliticosCLASSE.AsString = qryMovPatGrp.FieldByName('CLASSE').AsString) do
         begin
            //----------------------------------------------------------------------------
            fSldAtu := ConvNum(qryGrpAnaliticosSLDANT.AsFloat + qryGrpAnaliticosDEBITOS.AsFloat - qryGrpAnaliticosCREDITOS.AsFloat);
            qryMovPatGrp.Edit;
            qryMovPatGrp.FieldByName('SLDANT').AsCurrency   := ConvNum(qryMovPatGrp.FieldByName('SLDANT').AsFloat   + qryGrpAnaliticosSLDANT.AsFloat);
            qryMovPatGrp.FieldByName('DEBITOS').AsCurrency  := ConvNum(qryMovPatGrp.FieldByName('DEBITOS').AsFloat  + qryGrpAnaliticosDEBITOS.AsFloat);
            qryMovPatGrp.FieldByName('CREDITOS').AsCurrency := ConvNum(qryMovPatGrp.FieldByName('CREDITOS').AsFloat + qryGrpAnaliticosCREDITOS.AsFloat);
            qryMovPatGrp.FieldByName('SLDATU').AsCurrency   := ConvNum(qryMovPatGrp.FieldByName('SLDATU').AsFloat   + fSldAtu);
            //----------------------------------------------------------------------------
            prgBar.Position := prgBar.Position + 1;
            Application.ProcessMessages;
            qryGrpAnaliticos.Next;
         end;
      end else
      begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages;
         qryGrpAnaliticos.Next;
      end;
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
      fSldAnt   := 0;
      fDebitos  := 0;
      fCreditos := 0;
      fSldAtu   := 0;
      //----------------------------------------------------------------------------------
      qryMovPatGrp.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[loPartialKey]);
      while (not qryMovPatGrp.EOF) and
            (copy(qryMovPatGrp.FieldByName('CLASSE').AsString,1,iTam) = qryGrpSinteticosCLASSE.AsString) do
      begin
         fSldAnt   := ConvNum(fSldAnt   + qryMovPatGrp.FieldByName('SLDANT').AsFloat);
         fDebitos  := ConvNum(fDebitos  + qryMovPatGrp.FieldByName('DEBITOS').AsFloat);
         fCreditos := ConvNum(fCreditos + qryMovPatGrp.FieldByName('CREDITOS').AsFloat);
         fSldAtu   := ConvNum(fSldAtu   + qryMovPatGrp.FieldByName('SLDATU').AsFloat);
         qryMovPatGrp.Next;
      end;
      //----------------------------------------------------------------------------------
      qryMovPatGrp.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[]);
      qryMovPatGrp.Edit;
      qryMovPatGrp.FieldByName('SLDANT').AsCurrency   := fSldAnt;
      qryMovPatGrp.FieldByName('DEBITOS').AsCurrency  := fDebitos;
      qryMovPatGrp.FieldByName('CREDITOS').AsCurrency := fCreditos;
      qryMovPatGrp.FieldByName('SLDATU').AsCurrency   := fSldAtu;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages;
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   if qryMovPatGrp.IsEmpty then
      MsgDlg('Não existe movimentação no Periodo/Grupo selecionados!','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryMovPat.Close;
   qryMovPat.Open;
   prgBar.Max      := qryMovPatGrp.RecordCount;
   prgBar.Position := 0;
   qryMovPatGrp.First;
   while not qryMovPatGrp.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
      begin
         application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      if not ((qryMovPatGrpSLDANT.AsFloat = 0) and (qryMovPatGrpDEBITOS.AsFloat = 0) and
              (qryMovPatGrpCREDITOS.AsFloat = 0) and (qryMovPatGrpSLDATU.AsFloat = 0)) then
      begin
         qryMovPat.Insert;
         qryMovPat.FieldByName('CLASSE').AsString     := qryMovPatGrpCLASSE.AsString;
         qryMovPat.FieldByName('DESCGRUPO').AsString  := qryMovPatGrpDESCGRUPO.AsString;
         qryMovPat.FieldByName('S_A').AsString        := qryMovPatGrpS_A.AsString;
         qryMovPat.FieldByName('SLDANT').AsCurrency   := qryMovPatGrpSLDANT.AsFloat;
         qryMovPat.FieldByName('DEBITOS').AsCurrency  := qryMovPatGrpDEBITOS.AsFloat;
         qryMovPat.FieldByName('CREDITOS').AsCurrency := qryMovPatGrpCREDITOS.AsFloat;
         qryMovPat.FieldByName('SLDATU').AsCurrency   := qryMovPatGrpSLDATU.AsFloat;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryMovPatGrp.Next;
   end;
   qryMovPatGrp.CancelUpdates;
   qryMovPatGrp.Close;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelOperCaf.rbdbeClasse.DisplayFormat := sMascaraGrupo;
   dtmRelOperCaf.rbLabel80.Text := dtedIni.Text;
   dtmRelOperCaf.rbLabel82.Text := dtedFim.Text;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamMovPatGrp.dblckCmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if dblckcmbGrupoIni.Text = '' then
   begin
      qryGrupoIni.First;
   end;
   iGrupoIni := qryGrupoIni.FieldByName('IDGRUPO').AsInteger;
end;
//========================================================================================
procedure TfrmParamMovPatGrp.dblckCmbGrupoFimExit(Sender: TObject);
begin
   inherited;
   if dblckcmbGrupoFim.Text = '' then
   begin
      qryGrupoFim.Last;
   end;
   iGrupoFim := qryGrupoFim.FieldByName('IDGRUPO').AsInteger;
end;

procedure TfrmParamMovPatGrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupoIni.Close;
   qryGrupoFim.Close;
   qryGrpAnaliticos.Close;
   qryGrpSinteticos.Close;
   qryMovPatGrp.Close;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.UnPrepare;
   qryGrupoFim.UnPrepare;
   qryGrpAnaliticos.UnPrepare;
   qryGrpSinteticos.UnPrepare;
end;
end.
