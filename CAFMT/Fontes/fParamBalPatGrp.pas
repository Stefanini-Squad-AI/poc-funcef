unit fParamBalPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  ComCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamBalPatGrp = class(TfrmOkCancelar)
    Label1: TLabel;
    dtedfim: TCMDateTimePicker;
    qryGrupoIni: TwwQuery;
    Label2: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
    Label6: TLabel;
    Label3: TLabel;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    prgbar: TProgressBar;
    qryGrpSinteticos: TwwQuery;
    qryBalPatGrp: TwwQuery;
    updBalPatGrp: TUpdateSQL;
    qryParamCaf: TwwQuery;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    dsBalPatGrp: TwwDataSource;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbTodos: TCheckBox;
    Animate1: TAnimate;
    rdgGrupo: TRadioGroup;
    qryGrpAnaliticos: TwwQuery;
    ckbSinteticos: TCheckBox;
    ckbBaixados: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
    procedure ExecutaRelatorio;
  private
    { Private declarations }
    fLog   : TextFile;
    sLinha : String;
  public
    { Public declarations }
    iGrupoIni            : Integer;
    sMascaraGrupo        : String;
  end;

var
  frmParamBalPatGrp: TfrmParamBalPatGrp;

implementation

uses dRelBalCaf, uSistema, uMensErro, uAtivoFixo;

{$R *.DFM}

procedure TfrmParamBalPatGrp.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then qryGrupoIni.Prepare;
   if not qryGrpSinteticos.Prepared then qryGrpSinteticos.Prepare;
   if not qryBalPatGrp.Prepared then qryBalPatGrp.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   iGrupoIni := 0;
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
   dtedFim.Date := date;
   dtedFim.SetFocus;

   end;

procedure TfrmParamBalPatGrp.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if cmbGrupoIni.Text <> '' then
   begin
      iGrupoIni := qryGrupoIniIDGRUPO.AsInteger;
   end else
   begin
      iGrupoIni := 0;
   end;
end;
//========================================================================================
procedure TfrmParamBalPatGrp.bbtnConfirmarClick(Sender: TObject);
var
   fValOrg, fCmBem,
   fDepLanc, fDepMes, fCmDep,
   fValCtb                     : Currency;
   iTam, iQuant                : Integer;
   iDia, iMes, iAno            : Word;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   pnlStatus.Visible := True;
   //-------------------------------------------------------------------------------------
   // Inicializa os Log
   //-------------------------------------------------------------------------------------
   AssignFile(fLog,'C:\CAFLOG.TXT');
   Rewrite(fLog);
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Processando Grupos Analíticos ...';
   Application.ProcessMessages;
   qryGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   if iGrupoIni <> 0 then
   begin
      qryGrpAnaliticos.SQL.Strings[89] := ' AND (SB.IDGRUPO = '+IntToStr(iGrupoIni)+') ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[89] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if rdgGrupo.ItemIndex = 0 then
   begin
      qryGrpAnaliticos.SQL.Strings[90] := ' AND (G.FLGIMOVEL = 0) ';
      dtmRelBalCaf.rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
   end else
   if rdgGrupo.ItemIndex = 1 then
   begin
      qryGrpAnaliticos.SQL.Strings[90] := ' AND (G.FLGIMOVEL = 1) ';
      dtmRelBalCaf.rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[90] := ' ';
      dtmRelBalCaf.rpBalPatGrpLabel12.Caption := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if ckbCtlFisico.Checked then
   begin
      qryGrpAnaliticos.SQL.Strings[91] := ' ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[91] := ' AND (B.CONTROLE = ''T'') ';
   end;
   //-------------------------------------------------------------------------------------
   if ckbBaixados.Checked then
   begin
      qryGrpAnaliticos.SQL.Strings[92] := ' ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[92] := ' AND (B.BAIXATOTAL <> ''S'') ';
   end;
   //-------------------------------------------------------------------------------------
   DecodeDate(dtedFim.Date, iAno, iMes, iDia);
   Animate1.Active := True;
   sLinha := qryGrpAnaliticos.SQL.Text;
   Writeln(fLog,sLinha);
   qryGrpAnaliticos.ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
   qryGrpAnaliticos.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
   qryGrpAnaliticos.ParamByName('PDATASLD').AsDateTime := dtedFim.Date;
   qryGrpAnaliticos.Open;
   qryBalPatGrp.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryGrpAnaliticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpAnaliticos.EOF do
   begin
      if qryBalPatGrp.Locate('IDGRUPO',qryGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
      begin
         while (not qryGrpAnaliticos.EOF) and (qryGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = qryBalPatGrp.FieldByName('IDGRUPO').AsInteger) do
         begin
            qryBalPatGrp.Edit;
            qryBalPatGrp.FieldByName('VALORG').AsCurrency  := qryGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
            qryBalPatGrp.FieldByName('CMBEM').AsCurrency   := qryGrpAnaliticos.FieldByName('CMBEM0').AsCurrency;
            qryBalPatGrp.FieldByName('DEPLANC').AsCurrency := qryGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
            qryBalPatGrp.FieldByName('DEPMES').AsCurrency  := qryGrpAnaliticos.FieldByName('DEPLANCATU0').AsCurrency;
            qryBalPatGrp.FieldByName('CMDEP').AsCurrency   := qryGrpAnaliticos.FieldByName('CMDEP0').AsCurrency;
            qryBalPatGrp.FieldByName('VALCTB').AsCurrency  := qryGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
            qryBalPatGrp.FieldByName('QUANT').AsInteger    := qryGrpAnaliticos.FieldByName('QUANT').AsInteger;
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
   sLinha := qryGrpSinteticos.SQL.Text;
   Writeln(fLog,sLinha);
   qryGrpSinteticos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Max      := qryGrpSinteticos.RecordCount;
   prgBar.Position := 0;
   while not qryGrpSinteticos.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
         Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      iTam     := length(qryGrpSinteticos.FieldByName('CLASSE').AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fDepMes  := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      iQuant   := 0;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Locate('CLASSE',trim(qryGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
      while (not qryBalPatGrp.EOF) and
            (copy(qryBalPatGrp.FieldByName('CLASSE').AsString,1,iTam) = qryGrpSinteticos.FieldByName('CLASSE').AsString) do
      begin
         fValOrg  := AtivoFixo.ConvNum(fValOrg  + qryBalPatGrp.FieldByName('VALORG').AsCurrency) ;
         fCmBem   := AtivoFixo.ConvNum(fCmBem   + qryBalPatGrp.FieldByName('CMBEM').AsCurrency)  ;
         fDepLanc := AtivoFixo.ConvNum(fDepLanc + qryBalPatGrp.FieldByName('DEPLANC').AsCurrency);
         fDepMes  := AtivoFixo.ConvNum(fDepMes  + qryBalPatGrp.FieldByName('DEPMES').AsCurrency) ;
         fCmDep   := AtivoFixo.ConvNum(fCmDep   + qryBalPatGrp.FieldByName('CMDEP').AsCurrency)  ;
         fValCtb  := AtivoFixo.ConvNum(fValCtb  + qryBalPatGrp.FieldByName('VALCTB').AsCurrency) ;
         iQuant   := iQuant + qryBalPatGrp.FieldByName('QUANT').AsInteger;
         qryBalPatGrp.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBalPatGrp.Locate('CLASSE',qryGrpSinteticos.FieldByName('CLASSE').AsString,[]);
      qryBalPatGrp.Edit;
      qryBalPatGrp.FieldByName('VALORG').AsCurrency  := fValOrg;
      qryBalPatGrp.FieldByName('CMBEM').AsCurrency   := fCmBem;
      qryBalPatGrp.FieldByName('DEPLANC').AsCurrency := fDepLanc;
      qryBalPatGrp.FieldByName('DEPMES').AsCurrency  := fDepMes;
      qryBalPatGrp.FieldByName('CMDEP').AsCurrency   := fCmDep;
      qryBalPatGrp.FieldByName('VALCTB').AsCurrency  := fValCtb;
      qryBalPatGrp.FieldByName('QUANT').AsInteger    := iQuant;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   if qryBalPatGrp.IsEmpty then
      MsgDlg('Não houve movimentação com os Parâmetros Fornecidos!','Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   ExecutaRelatorio;
   CloseFile(fLog);
end;

procedure TfrmParamBalPatGrp.ExecutaRelatorio;
var
   qryBalPat : TwwQuery;

begin
   qryBalPat := TwwQuery(dtmRelBalCaf.qryBalPatGrp);
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Transferindo dados para o relatório ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryBalPat.Close;
   qryBalPat.Open;
   prgBar.Max      := qryBalPatGrp.RecordCount;
   prgBar.Position := 0;
   qryBalPatGrp.First;
   while not qryBalPatGrp.EOF do
   begin
      if (prgBar.Position mod 15) = 0 then
         Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if (ckbTodos.Checked) or
         (((qryBalPatGrp.FieldByName('VALORG').AsFloat + qryBalPatGrp.FieldByName('CMBEM').AsFloat) -
           (qryBalPatGrp.FieldByName('DEPLANC').AsFloat + qryBalPatGrp.FieldByName('CMDEP').AsFloat) <> 0)) then
      begin
         if (not ckbSinteticos.Checked) or
            ((ckbSinteticos.Checked) and (qryBalPatGrp.FieldByName('S_A').AsString = 'S')) then
         begin
            qryBalPat.Append;
            qryBalPat.FieldByName('IDGRUPO').AsInteger  := qryBalPatGrp.FieldByName('IDGRUPO').AsInteger;
            qryBalPat.FieldByName('CLASSE').AsString    := qryBalPatGrp.FieldByName('CLASSE').AsString;
            qryBalPat.FieldByName('DESCGRUPO').AsString := qryBalPatGrp.FieldByName('DESCGRUPO').AsString;
            qryBalPat.FieldByName('S_A').AsString       := qryBalPatGrp.FieldByName('S_A').AsString;
            qryBalPat.FieldByName('VALORG').AsCurrency  := qryBalPatGrp.FieldByName('VALORG').AsFloat;
            qryBalPat.FieldByName('CMBEM').AsCurrency   := qryBalPatGrp.FieldByName('CMBEM').AsFloat;
            qryBalPat.FieldByName('DEPLANC').AsCurrency := qryBalPatGrp.FieldByName('DEPLANC').AsFloat;
            qryBalPat.FieldByName('DEPMES').AsCurrency  := qryBalPatGrp.FieldByName('DEPMES').AsFloat;
            qryBalPat.FieldByName('CMDEP').AsCurrency   := qryBalPatGrp.FieldByName('CMDEP').AsFloat;
            qryBalPat.FieldByName('VALCTB').AsCurrency  := qryBalPatGrp.FieldByName('VALCTB').AsFloat;
            qryBalPat.FieldByName('QUANT').AsInteger    := qryBalPatGrp.FieldByName('QUANT').AsInteger;
         end;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Position := prgBar.Position + 1;
      qryBalPatGrp.Next;
   end;
   qryBalPatGrp.CancelUpdates;
   qryBalPatGrp.Close;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   dtmRelBalCaf.rpBalPatGrpDBTEXT1.DisplayFormat := sMascaraGrupo;
   dtmRelBalCaf.rpBalPatGrpLabel10.Text := dtedFim.Text;
   Animate1.Active := False;
   Screen.Cursor := crDefault;
end;

end.

