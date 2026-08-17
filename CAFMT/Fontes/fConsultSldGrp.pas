unit fConsultSldGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, TB97Tlwn;

type
  TfrmConsultSldGrp = class(TfrmSairAjuda)
    pnlGrid: TPanel;
    dbgBalPatBem: TwwDBGrid;
    qryGrpAnaliticos: TwwQuery;
    qryGrpSinteticos: TwwQuery;
    qryGrpSinteticosCLASSE: TStringField;
    qryGrpSinteticosNOME: TStringField;
    qryGrpSinteticosIDGRUPO: TFloatField;
    qryBalPatGrp: TwwQuery;
    qryBalPatGrpIDGRUPO: TFloatField;
    qryBalPatGrpCLASSE: TStringField;
    qryBalPatGrpDESCGRUPO: TStringField;
    qryBalPatGrpS_A: TStringField;
    qryBalPatGrpVALORG: TFloatField;
    qryBalPatGrpCMBEM: TFloatField;
    qryBalPatGrpDEPLANC: TFloatField;
    qryBalPatGrpCMDEP: TFloatField;
    qryBalPatGrpVALCTB: TFloatField;
    dsBalPat: TwwDataSource;
    updBalPatGrp: TUpdateSQL;
    qryParamCaf: TwwQuery;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    MSGrupos: TMontaSelect;
    qrySelGrupo: TwwQuery;
    qrySelGrupoNOME: TStringField;
    qrySelGrupoIDGRUPO: TFloatField;
    qrySelGrupoDEPRECIACAO: TFloatField;
    qrySelGrupoULTIDBEM: TFloatField;
    qrySelGrupoCLASSE: TStringField;
    dsGrupo: TwwDataSource;
    qryBalPat: TwwQuery;
    qryBalPatIDGRUPO: TFloatField;
    qryBalPatCLASSE: TStringField;
    qryBalPatDESCGRUPO: TStringField;
    qryBalPatS_A: TStringField;
    qryBalPatVALORG: TFloatField;
    qryBalPatCMBEM: TFloatField;
    qryBalPatDEPLANC: TFloatField;
    qryBalPatCMDEP: TFloatField;
    qryBalPatVALCTB: TFloatField;
    updBalPat: TUpdateSQL;
    qryGrpAnaliticosOriginal: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    qryGrpAnaliticosIDGRUPO: TFloatField;
    qryGrpAnaliticosCLASSE: TStringField;
    qryGrpAnaliticosDESCGRUPO: TStringField;
    qryGrpAnaliticosTIPO: TStringField;
    qryGrpAnaliticosVALORG0: TFloatField;
    qryGrpAnaliticosCMBEM0: TFloatField;
    qryGrpAnaliticosDEPLANC0: TFloatField;
    qryGrpAnaliticosCMDEP0: TFloatField;
    qryGrpAnaliticosVALCTB0: TFloatField;
    Dock973: TDock97;
    ToolWindow971: TToolWindow97;
    sbtnGrupo: TSpeedButton;
    ToolWindow972: TToolWindow97;
    fcLabel3: TfcLabel;
    bbtnProcessa: TSpeedButton;
    dtedfim: TCMDateTimePicker;
    fcLabel2: TfcLabel;
    edCodGrupo: TMaskEdit;
    edDescGrupo: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbtnGrupoClick(Sender: TObject);
    procedure bbtnProcessaClick(Sender: TObject);
    procedure dtedfimEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupoIni            : Integer;
    sMascaraGrupo        : String;
    procedure ExecutaRelatorio;
  end;

var
  frmConsultSldGrp: TfrmConsultSldGrp;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmConsultSldGrp.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   inherited;
   if not qryGrpAnaliticos.Prepared then
      qryGrpAnaliticos.Prepare;
   if not qryGrpSinteticos.Prepared then
      qryGrpSinteticos.Prepare;
   if not qryBalPatGrp.Prepared then
      qryBalPatGrp.Prepare;
   if not qryBalPat.Prepared then
      qryBalPat.Prepare;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamCaf.Open;
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString + ';0; ';
   edCodGrupo.EditMask         := sMascaraGrupo;
   qryBalPatGrpCLASSE.EditMask := sMascaraGrupo;
   dtedFim.Date := date;
   dbgBalPatBem.Visible := False;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmConsultSldGrp.FormActivate(Sender: TObject);
begin
   inherited;
   dtedFim.SetFocus;
end;
//========================================================================================
procedure TfrmConsultSldGrp.sbtnGrupoClick(Sender: TObject);
begin
   inherited;
   dbgBalPatBem.Visible := False;
   Screen.Cursor := crSQLWait;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSGrupos.RetornouValor) then
   begin
      qrySelGrupo.Close;
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.Open;
      edCodGrupo.Text  := qrySelGrupoCLASSE.AsString;
      edDescGrupo.Text := qrySelGrupoNOME.AsString;
   end else
   begin
      qrySelGrupo.Close;
      edCodGrupo.Text  := '';
      edDescGrupo.Text := '';
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmConsultSldGrp.bbtnProcessaClick(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Double;
   iTam                                       : Integer;
   
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   qryBalPatGrp.Close;
   qryBalPatGrp.Open;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   if not qryGrpAnaliticos.Prepared then qryGrpAnaliticos.Prepare;
   qryGrpAnaliticos.Close;
   if (edCodGrupo.Text <> '') then
   begin
      qryGrpAnaliticos.SQL.Strings[28] := 'AND (B.IDGRUPO = '+qrySelGrupoIDGRUPO.AsString+')';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[28] := ' ';
   end;
   qryGrpAnaliticos.ParamByName('PDATASLD').AsDateTime := dtedFim.Date;
   qryGrpAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   while not qryGrpAnaliticos.EOF do
   begin
      if (qryBalPatGrp.Locate('IDGRUPO',qryGrpAnaliticosIDGRUPO.AsInteger,[])) then
      begin
         while (not qryGrpAnaliticos.EOF) and (qryGrpAnaliticosIDGRUPO.AsInteger = qryBalPatGrpIDGRUPO.AsInteger) do
         begin
            qryBalPatGrp.Edit;
            qryBalPatGrp.FieldByName('VALORG').AsCurrency  := qryBalPatGrp.FieldByName('VALORG').AsFloat + qryGrpAnaliticosVALORG0.AsFloat;
            qryBalPatGrp.FieldByName('CMBEM').AsCurrency   := qryBalPatGrp.FieldByName('CMBEM').AsFloat + qryGrpAnaliticosCMBEM0.AsFloat;
            qryBalPatGrp.FieldByName('DEPLANC').AsCurrency := qryBalPatGrp.FieldByName('DEPLANC').AsFloat + qryGrpAnaliticosDEPLANC0.AsFloat;
            qryBalPatGrp.FieldByName('CMDEP').AsCurrency   := qryBalPatGrp.FieldByName('CMDEP').AsFloat + qryGrpAnaliticosCMDEP0.AsFloat;
            qryBalPatGrp.FieldByName('VALCTB').AsCurrency  := qryBalPatGrp.FieldByName('VALCTB').AsFloat + qryGrpAnaliticosVALCTB0.AsFloat;
            //----------------------------------------------------------------------------
            qryGrpAnaliticos.Next;
         end;
      end else
      begin
         qryGrpAnaliticos.Next;
      end;
   end;
   qryGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Sintéticos
   //-------------------------------------------------------------------------------------
   qryGrpSinteticos.Open;
   //-------------------------------------------------------------------------------------
   while not qryGrpSinteticos.EOF do
   begin
      iTam     := length(qryGrpSinteticosCLASSE.AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Locate('CLASSE',trim(qryGrpSinteticosCLASSE.AsString),[loPartialKey]);
      while (not qryBalPatGrp.EOF) and
            (copy(qryBalPatGrpCLASSE.AsString,1,iTam) = qryGrpSinteticosCLASSE.AsString) do
      begin
         fValOrg  := fValOrg  + qryBalPatGrpVALORG.AsFloat  ;
         fCmBem   := fCmBem   + qryBalPatGrpCMBEM.AsFloat   ;
         fDepLanc := fDepLanc + qryBalPatGrpDEPLANC.AsFloat ;
         fCmDep   := fCmDep   + qryBalPatGrpCMDEP.AsFloat   ;
         fValCtb  := fValCtb  + qryBalPatGrpVALCTB.AsFloat  ;
         qryBalPatGrp.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[]);
      qryBalPatGrp.Edit;
      qryBalPatGrp.FieldByName('VALORG').AsCurrency  := fValOrg;
      qryBalPatGrp.FieldByName('CMBEM').AsCurrency   := fCmBem;
      qryBalPatGrp.FieldByName('DEPLANC').AsCurrency := fDepLanc;
      qryBalPatGrp.FieldByName('CMDEP').AsCurrency   := fCmDep;
      qryBalPatGrp.FieldByName('VALCTB').AsCurrency  := fValCtb;
      //----------------------------------------------------------------------------------
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   ExecutaRelatorio;
   //-------------------------------------------------------------------------------------
   qryBalPat.First;
   dbgBalPatBem.Visible := True;
end;
//========================================================================================
procedure TfrmConsultSldGrp.ExecutaRelatorio;
begin
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o Grid
   //-------------------------------------------------------------------------------------
   qryBalPat.Close;
   qryBalPat.Open;
   qryBalPatGrp.First;
   while not qryBalPatGrp.EOF do
   begin
      if (((qryBalPatGrpVALORG.AsFloat + qryBalPatGrpCMBEM.AsFloat) -
           (qryBalPatGrpDEPLANC.AsFloat + qryBalPatGrpCMDEP.AsFloat) <> 0)) then
      begin
         qryBalPat.Append;
         qryBalPat.FieldByName('IDGRUPO').AsInteger    := qryBalPatGrpIDGRUPO.AsInteger;
         qryBalPat.FieldByName('CLASSE').AsString      := FormatMaskText(sMascaraGrupo,qryBalPatGrpCLASSE.AsString);
         qryBalPat.FieldByName('DESCGRUPO').AsString   := qryBalPatGrpDESCGRUPO.AsString;
         qryBalPat.FieldByName('S_A').AsString         := qryBalPatGrpS_A.AsString;
         qryBalPat.FieldByName('VALORG').AsCurrency    := qryBalPatGrpVALORG.AsFloat;
         qryBalPat.FieldByName('CMBEM').AsCurrency     := qryBalPatGrpCMBEM.AsFloat;
         qryBalPat.FieldByName('DEPLANC').AsCurrency   := qryBalPatGrpDEPLANC.AsFloat;
         qryBalPat.FieldByName('CMDEP').AsCurrency     := qryBalPatGrpCMDEP.AsFloat;
         qryBalPat.FieldByName('VALCTB').AsCurrency    := qryBalPatGrpVALCTB.AsFloat;
      end;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Next;
   end;
   qryBalPatGrp.CancelUpdates;
   qryBalPatGrp.Close;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmConsultSldGrp.dtedfimEnter(Sender: TObject);
begin
   inherited;
   dbgBalPatBem.Visible := False;
end;
//========================================================================================
procedure TfrmConsultSldGrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrpAnaliticos.Close;
   qryGrpSinteticos.Close;
   qryBalPatGrp.Close;
   qryBalPat.Close;
   qryGrpAnaliticos.UnPrepare;
   qryGrpSinteticos.UnPrepare;
   qryBalPatGrp.UnPrepare;
   qryBalPat.UnPrepare;
end;

end.
