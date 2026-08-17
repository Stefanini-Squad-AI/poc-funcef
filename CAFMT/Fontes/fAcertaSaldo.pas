unit fAcertaSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Gauges,
  wwdbdatetimepicker, CMDateTimePicker, CMSQLScript, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook;

type
  TfrmAcertaSaldo = class(TfrmOkCancelar)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryBem: TwwQuery;
    qryMovContabBem: TwwQuery;
    qrySaldoContabBem: TwwQuery;
    qryMovContabBemIDBEM: TFloatField;
    qryMovContabBemIDPESSOA: TFloatField;
    qryMovContabBemDATAMOVIMENTACAO: TDateTimeField;
    qryMovContabBemVALORG: TFloatField;
    qryMovContabBemCMBEM: TFloatField;
    qryMovContabBemDEPLANC: TFloatField;
    qryMovContabBemCMDEP: TFloatField;
    qryMovContabBemREAVVALORG: TFloatField;
    qryMovContabBemREAVCMBEM: TFloatField;
    qryMovContabBemREAVDEPLANC: TFloatField;
    qryMovContabBemREAVCMDEP: TFloatField;
    qryMovContabBemULTREAVVALORG: TFloatField;
    qryMovContabBemULTREAVCMBEM: TFloatField;
    qryMovContabBemULTREAVDEPLANC: TFloatField;
    qryMovContabBemULTREAVCMDEP: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemIDPESSOA: TFloatField;
    qryBemVALORG: TFloatField;
    qryBemCMBEM: TFloatField;
    qryBemDEPLANC: TFloatField;
    qryBemCMDEP: TFloatField;
    qryBemPLACA: TFloatField;
    qryInsSaldoContabBem: TwwQuery;
    qryUpdSaldoContabBem: TwwQuery;
    qryDelSaldoContabBem: TwwQuery;
    qryRemSaldoContabBem: TwwQuery;
    rdgTipoBem: TRadioGroup;
    updAtuBem: TUpdateSQL;
    updAtuReavaliacao: TUpdateSQL;
    qryAtuAcrescimo: TwwQuery;
    updAtuAcrescimo: TUpdateSQL;
    qryAtuBem: TwwQuery;
    qryAtuBemIDBEM: TFloatField;
    qryAtuBemVALORG: TFloatField;
    qryAtuBemCMBEM: TFloatField;
    qryAtuBemDEPLANC: TFloatField;
    qryAtuBemCMDEP: TFloatField;
    qryAtuBemPLACA: TFloatField;
    qryAtuBemVALORG0: TFloatField;
    qryAtuBemCMBEM0: TFloatField;
    qryAtuBemDEPLANC0: TFloatField;
    qryAtuBemCMDEP0: TFloatField;
    qryAtuReavaliacao: TwwQuery;
    qryAtuReavaliacaoIDBEM: TFloatField;
    qryAtuReavaliacaoIDREAVALIACAO: TFloatField;
    qryAtuReavaliacaoVALORG: TFloatField;
    qryAtuReavaliacaoCMBEM: TFloatField;
    qryAtuReavaliacaoDEPLANC: TFloatField;
    qryAtuReavaliacaoCMDEP: TFloatField;
    qryAtuReavaliacaoPLACA: TFloatField;
    qryAtuReavaliacaoVALORG0: TFloatField;
    qryAtuReavaliacaoCMBEM0: TFloatField;
    qryAtuReavaliacaoDEPLANC0: TFloatField;
    qryAtuReavaliacaoCMDEP0: TFloatField;
    qryAtuAcrescimoIDBEM: TFloatField;
    qryAtuAcrescimoIDACRESCIMO: TFloatField;
    qryAtuAcrescimoVALORG: TFloatField;
    qryAtuAcrescimoCMBEM: TFloatField;
    qryAtuAcrescimoDEPLANC: TFloatField;
    qryAtuAcrescimoCMDEP: TFloatField;
    qryAtuAcrescimoPLACA: TFloatField;
    qryAtuAcrescimoVALORG0: TFloatField;
    qryAtuAcrescimoCMBEM0: TFloatField;
    qryAtuAcrescimoDEPLANC0: TFloatField;
    qryAtuAcrescimoCMDEP0: TFloatField;
    spdPesquisa: TBitBtn;
    ePlaca: TEdit;
    Label26: TLabel;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qryPlacaIDPESSOA: TFloatField;
    qryPlacaPLACA: TFloatField;
    qryRemSaldoContabGrupo: TwwQuery;
    qryGrupos: TwwQuery;
    qryGruposIDGRUPO: TFloatField;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    cmbGrupoIni: TwwDBLookupCombo;
    Label3: TLabel;
    qryMovTransf: TwwQuery;
    qrySCBTransf: TwwQuery;
    qrySaldoContabBemIDBEM: TFloatField;
    qrySaldoContabBemIDPESSOA: TFloatField;
    qrySaldoContabBemDATASLDBEM: TDateTimeField;
    qrySaldoContabBemVALORG: TFloatField;
    qrySaldoContabBemCMBEM: TFloatField;
    qrySaldoContabBemDEPLANC: TFloatField;
    qrySaldoContabBemCMDEP: TFloatField;
    qrySaldoContabBemREAVVALORG: TFloatField;
    qrySaldoContabBemREAVCMBEM: TFloatField;
    qrySaldoContabBemREAVDEPLANC: TFloatField;
    qrySaldoContabBemREAVCMDEP: TFloatField;
    qrySaldoContabBemULTREAVVALORG: TFloatField;
    qrySaldoContabBemULTREAVCMBEM: TFloatField;
    qrySaldoContabBemULTREAVDEPLANC: TFloatField;
    qrySaldoContabBemULTREAVCMDEP: TFloatField;
    qrySaldoContabBemIDGRUPO: TFloatField;
    qrySaldoContabBemIDLOCALIZACAO: TFloatField;
    qrySaldoContabBemIDRESPONSAVEL: TFloatField;
    qryBemAtual: TwwQuery;
    qryUpdSCBTransf: TwwQuery;
    qryMovBaixa: TwwQuery;
    qryBemBAIXATOTAL: TStringField;
    rdgRemover: TRadioGroup;
    qryRemSaldoContabConj: TwwQuery;
    qryConjuntos: TwwQuery;
    qryConjuntosIDCONJUNTO: TFloatField;
    lblBem: TLabel;
    qryRespExiste: TwwQuery;
    qryLocalExiste: TwwQuery;
    qryGrupoExiste: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ePlacaExit(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    iIdBem : Integer;
    fLog   : TextFile;
    sLinha : String;
    function ConvNum(fNum : Extended) : Extended;
    function GrupoExiste(fGrupo : Extended) : Boolean;
    function LocalExiste(fLocal : Extended) : Boolean;
    function RespExiste(fResp : Extended) : Boolean;
  public
    { Public declarations }
  end;

  eExcessaoCAF = Class(Exception);

var
  frmAcertaSaldo: TfrmAcertaSaldo;

implementation

uses dBaseDados, uDataBase, uMensErro, dAtivoFixo, uSistema;

{$R *.DFM}

//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TfrmAcertaSaldo.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;
//========================================================================================
procedure TfrmAcertaSaldo.FormCreate(Sender: TObject);
begin
   inherited;
   qryBem.Prepare;
   qryGrupos.Prepare;
   qrySaldoContabBem.Prepare;
   qryMovContabBem.Prepare;
   qryRemSaldoContabBem.Prepare;
   qryRemSaldoContabGrupo.Prepare;
   qryAtuBem.Prepare;
   qryAtuReavaliacao.Prepare;
   qryAtuAcrescimo.Prepare;
   qryMovTransf.Prepare;
   qryGrupoIni.Prepare;
   qryGrupoIni.Open;
end;
//========================================================================================
procedure TfrmAcertaSaldo.FormActivate(Sender: TObject);
begin
   inherited;
   rdgTipoBem.SetFocus;
end;
//========================================================================================
procedure TfrmAcertaSaldo.bbtnConfirmarClick(Sender: TObject);
var
   bEntrou                        : Boolean;
   fValOrg, fCmBem,
   fDepLanc, fCmDep,
   fReavValOrg, fReavCmBem,
   fReavDepLanc, fReavCmDep,
   fUltReavValOrg, fUltReavCmBem,
   fUltReavDepLanc, fUltReavCmDep : Extended;
   fBem, fPessoa                   : Extended;
   iGrupo,iLocal,iResp            : Integer;
   dDataMov                       : tDateTime;
   sDataMov                       : String;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   Screen.Cursor     := crSQLWait;
   prgbar.MinValue   := 0;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblBem.Caption    := '';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Remove os lançamentos de Saldo
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      lblStatus.Caption := 'Removendo Saldo Anterior...';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if (ePlaca.Text <> '') or (cmbGrupoIni.Text <> '') then
      begin
         qryRemSaldoContabBem.UnPrepare;
         //-------------------------------------------------------------------------------
         if ePlaca.Text <> '' then
            qryRemSaldoContabBem.SQL.Strings[5] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
         else
            qryRemSaldoContabBem.SQL.Strings[5] := ' ';
         if cmbGrupoIni.Text <> '' then
            qryRemSaldoContabBem.SQL.Strings[6] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
         else
            qryRemSaldoContabBem.SQL.Strings[6] := ' ';
         //-------------------------------------------------------------------------------
         qryRemSaldoContabBem.Prepare;
         qryRemSaldoContabBem.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
         qryRemSaldoContabBem.ExecSQL;
         if qryRemSaldoContabBem.RowsAffected < 0 then
            Raise eExcessaoCAF.Create('Removendo Saldo Anterior (1)');
         //-------------------------------------------------------------------------------
         CommitTransacao;
      end else
      begin
         if rdgRemover.ItemIndex = 0 then
         begin
            if not qryRemSaldoContabGrupo.Prepared then
               qryRemSaldoContabGrupo.Prepare;
            qryGrupos.Close;
            qryGrupos.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
            qryGrupos.Open;
            prgBar.Progress := 0;
            prgbar.MaxValue := qryGrupos.RecordCount;
            while not qryGrupos.EOF do
            begin
               prgBar.Progress := prgBar.Progress + 1;
               lblStatus.Caption := 'Removendo Saldo Anterior - Grupo ('+inttostr(prgBar.Progress)+' em '+inttostr(prgbar.MaxValue)+')';
               Application.ProcessMessages;
               //-------------------------------------------------------------------------
               qryRemSaldoContabGrupo.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
               qryRemSaldoContabGrupo.ParamByName('PIDGRUPO').AsInteger   := qryGruposIDGRUPO.AsInteger;
               qryRemSaldoContabGrupo.ExecSQL;
               if qryRemSaldoContabGrupo.RowsAffected < 0 then
                  Raise eExcessaoCAF.Create('Removendo Saldo Anterior (2)');
               //-------------------------------------------------------------------------
               // Commit do Grupo
               //-------------------------------------------------------------------------
               CommitTransacao;
               StartTransacao;
               //-------------------------------------------------------------------------
               qryGrupos.Next;
            end;
            CommitTransacao;
            qryGrupos.Close;
         end else
         begin
            if not qryRemSaldoContabConj.Prepared then
               qryRemSaldoContabConj.Prepare;
            qryConjuntos.Close;
            qryConjuntos.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
            qryConjuntos.Open;
            prgBar.Progress := 0;
            prgbar.MaxValue := qryConjuntos.RecordCount;
            while not qryConjuntos.EOF do
            begin
               prgBar.Progress := prgBar.Progress + 1;
               lblStatus.Caption := 'Removendo Saldo Anterior - Conjunto ('+inttostr(prgBar.Progress)+' em '+inttostr(prgbar.MaxValue)+')';
               Application.ProcessMessages;
               //-------------------------------------------------------------------------
               qryRemSaldoContabConj.ParamByName('PFLGIMOVEL').AsInteger  := rdgTipoBem.ItemIndex;
               qryRemSaldoContabConj.ParamByName('PIDCONJUNTO').AsInteger := qryConjuntosIDCONJUNTO.AsInteger;
               qryRemSaldoContabConj.ExecSQL;
               if qryRemSaldoContabConj.RowsAffected < 0 then
                  Raise eExcessaoCAF.Create('Removendo Saldo Anterior (3)');
               //-------------------------------------------------------------------------
               // Commit do Conjunto
               //-------------------------------------------------------------------------
               CommitTransacao;
               StartTransacao;
               //-------------------------------------------------------------------------
               qryConjuntos.Next;
            end;
            CommitTransacao;
            qryConjuntos.Close;
         end;
      end;
   except
      on E : Exception do
      begin
         Screen.Cursor := crDefault;
         RollBackTransacao;
         MsgDlg('Processamento Abortado.' + #13 + 'Erro : ' + E.Message, 'Erro', mtError, [mbOk], 0) ;
         bbtnConfirmar.Enabled := True;
         pnlStatus.Visible := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Preparando Histórico ...';
   Application.ProcessMessages;
   qryBem.Close;
   if ePlaca.Text <> '' then
      qryBem.SQL.Strings[4] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
   else
      qryBem.SQL.Strings[4] := ' ';
   if cmbGrupoIni.Text <> '' then
      qryBem.SQL.Strings[5] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
   else
      qryBem.SQL.Strings[5] := ' ';
   qryBem.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
   qryBem.Open;
   prgBar.Progress := 0;
   prgbar.MaxValue := qryBem.RecordCount;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   StartTransacao;
   try
      bEntrou := False;
      qryBem.First;
      while not qryBem.EOF do
      begin
         bEntrou := True;
         lblStatus.Caption := 'Calculando Saldo do BEM ' + qryBem.FieldByName('PLACA').AsString;
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 50) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         // Verifica se o bem está totalmente baixado. Se estiver zera o último lançamento
         //-------------------------------------------------------------------------------
         //if qryBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         //begin
         //   qryMovBaixa.Close;
         //   qryMovBaixa.ParamByName('IDBEM').AsInteger    := qryBem.FieldByName('IDBEM').AsInteger;
         //   qryMovBaixa.ParamByName('IDPESSOA').AsInteger := qryBem.FieldByName('IDPESSOA').AsInteger;
         //   qryMovBaixa.Open;
         //   dDataBaixa := qryMovBaixa.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         //end else
         //begin
         //   dDataBaixa := -1;
         //end;
         //-------------------------------------------------------------------------------
         fValOrg  := 0;
         fCmBem   := 0;
         fDepLanc := 0;
         fCmDep   := 0;
         fReavValOrg  := 0;
         fReavCmBem   := 0;
         fReavDepLanc := 0;
         fReavCmDep   := 0;
         fUltReavValOrg  := 0;
         fUltReavCmBem   := 0;
         fUltReavDepLanc := 0;
         fUltReavCmDep   := 0;
         //-------------------------------------------------------------------------------
         qrySaldoContabBem.Close;
         qrySaldoContabBem.ParamByName('PIDBEM').AsInteger  := qryBemIDBEM.AsInteger;
         qrySaldoContabBem.ParamByName('PIDPESSOA').AsFloat := qryBemIDPESSOA.AsFloat;
         qrySaldoContabBem.Open;
         qryMovContabBem.Close;
         qryMovContabBem.ParamByName('PIDBEM').AsInteger := qryBemIDBEM.AsInteger;
         qryMovContabBem.Open;
         while not qryMovContabBem.EOF do
         begin
            fValOrg         := ConvNum(fValOrg         + qryMovContabBem.FieldByName('VALORG').AsFloat);
            fCmBem          := ConvNum(fCmBem          + qryMovContabBem.FieldByName('CMBEM').AsFloat);
            fDepLanc        := ConvNum(fDepLanc        + qryMovContabBem.FieldByName('DEPLANC').AsFloat);
            fCmDep          := ConvNum(fCmDep          + qryMovContabBem.FieldByName('CMDEP').AsFloat);
            fReavValOrg     := ConvNum(fReavValOrg     + qryMovContabBem.FieldByName('REAVVALORG').AsFloat);
            fReavCmBem      := ConvNum(fReavCmBem      + qryMovContabBem.FieldByName('REAVCMBEM').AsFloat);
            fReavDepLanc    := ConvNum(fReavDepLanc    + qryMovContabBem.FieldByName('REAVDEPLANC').AsFloat);
            fReavCmDep      := ConvNum(fReavCmDep      + qryMovContabBem.FieldByName('REAVCMDEP').AsFloat);
            fUltReavValOrg  := ConvNum(fUltReavValOrg  + qryMovContabBem.FieldByName('ULTREAVVALORG').AsFloat);
            fUltReavCmBem   := ConvNum(fUltReavCmBem   + qryMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat);
            fUltReavDepLanc := ConvNum(fUltReavDepLanc + qryMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat);
            fUltReavCmDep   := ConvNum(fUltReavCmDep   + qryMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat);
            //----------------------------------------------------------------------------
            if not qrySaldoContabBem.EOF then
            begin
               if qryMovContabBemDATAMOVIMENTACAO.AsDateTime = qrySaldoContabBemDATASLDBEM.AsDateTime then
               begin
                  qryUpdSaldoContabBem.ParamByName('IDBEM').AsInteger           := qryMovContabBem.FieldByName('IDBEM').AsInteger;
                  qryUpdSaldoContabBem.ParamByName('IDPESSOA').AsInteger        := qryMovContabBem.FieldByName('IDPESSOA').AsInteger;
                  qryUpdSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime     := qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  qryUpdSaldoContabBem.ParamByName('VALORG').AsCurrency         := fValOrg;
                  qryUpdSaldoContabBem.ParamByName('CMBEM').AsCurrency          := fCmBem;
                  qryUpdSaldoContabBem.ParamByName('DEPLANC').AsCurrency        := fDepLanc;
                  qryUpdSaldoContabBem.ParamByName('CMDEP').AsCurrency          := fCmDep;
                  qryUpdSaldoContabBem.ParamByName('REAVVALORG').AsCurrency     := fReavValOrg;
                  qryUpdSaldoContabBem.ParamByName('REAVCMBEM').AsCurrency      := fReavCmBem;
                  qryUpdSaldoContabBem.ParamByName('REAVDEPLANC').AsCurrency    := fReavDepLanc;
                  qryUpdSaldoContabBem.ParamByName('REAVCMDEP').AsCurrency      := fReavCmDep;
                  qryUpdSaldoContabBem.ParamByName('ULTREAVVALORG').AsCurrency  := fUltReavValOrg;
                  qryUpdSaldoContabBem.ParamByName('ULTREAVCMBEM').AsCurrency   := fUltReavCmBem;
                  qryUpdSaldoContabBem.ParamByName('ULTREAVDEPLANC').AsCurrency := fUltReavDepLanc;
                  qryUpdSaldoContabBem.ParamByName('ULTREAVCMDEP').AsCurrency   := fUltReavCmDep;
                  qryUpdSaldoContabBem.ExecSQL;
                  if qryUpdSaldoContabBem.RowsAffected <= 0 then
                  begin
                     MsgDlg('Erro qryUpdSaldoContabBem : IdBem = '+qryMovContabBem.FieldByName('IDBEM').AsString,'Erro',mtError,[mbOk],0) ;
                     Raise eExcessaoCAF.Create('Preparando Saldos');
                  end;
                  //----------------------------------------------------------------------
                  qryMovContabBem.Next;
                  qrySaldoContabBem.Next;
               end else
               if qryMovContabBemDATAMOVIMENTACAO.AsDateTime < qrySaldoContabBemDATASLDBEM.AsDateTime then
               begin
                  qryInsSaldoContabBem.ParamByName('IDBEM').AsInteger           := qryMovContabBem.FieldByName('IDBEM').AsInteger;
                  qryInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger        := qryMovContabBem.FieldByName('IDPESSOA').AsInteger;
                  qryInsSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime     := qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  qryInsSaldoContabBem.ParamByName('VALORG').AsCurrency         := fValOrg;
                  qryInsSaldoContabBem.ParamByName('CMBEM').AsCurrency          := fCmBem;
                  qryInsSaldoContabBem.ParamByName('DEPLANC').AsCurrency        := fDepLanc;
                  qryInsSaldoContabBem.ParamByName('CMDEP').AsCurrency          := fCmDep;
                  qryInsSaldoContabBem.ParamByName('REAVVALORG').AsCurrency     := fReavValOrg;
                  qryInsSaldoContabBem.ParamByName('REAVCMBEM').AsCurrency      := fReavCmBem;
                  qryInsSaldoContabBem.ParamByName('REAVDEPLANC').AsCurrency    := fReavDepLanc;
                  qryInsSaldoContabBem.ParamByName('REAVCMDEP').AsCurrency      := fReavCmDep;
                  qryInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsCurrency  := fUltReavValOrg;
                  qryInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsCurrency   := fUltReavCmBem;
                  qryInsSaldoContabBem.ParamByName('ULTREAVDEPLANC').AsCurrency := fUltReavDepLanc;
                  qryInsSaldoContabBem.ParamByName('ULTREAVCMDEP').AsCurrency   := fUltReavCmDep;
                  qryInsSaldoContabBem.ExecSQL;
                  if qryInsSaldoContabBem.RowsAffected <= 0 then
                  begin
                     MsgDlg('Erro qryInsSaldoContabBem : IdBem = '+qryMovContabBemIDBEM.AsString,'Erro',mtError,[mbOk],0) ;
                     Raise eExcessaoCAF.Create('Preparando Saldos');
                  end;
                  //----------------------------------------------------------------------
                  qryMovContabBem.Next;
               end else
               if qryMovContabBemDATAMOVIMENTACAO.AsDateTime > qrySaldoContabBemDATASLDBEM.AsDateTime then
               begin
                  qryDelSaldoContabBem.ParamByName('IDBEM').AsInteger        := qryMovContabBemIDBEM.AsInteger;
                  qryDelSaldoContabBem.ParamByName('IDPESSOA').AsInteger     := qryMovContabBemIDPESSOA.AsInteger;
                  qryDelSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime  := qryMovContabBemDATAMOVIMENTACAO.AsDateTime;
                  qryDelSaldoContabBem.ExecSQL;
                  if qryDelSaldoContabBem.RowsAffected <= 0 then
                  begin
                     MsgDlg('Erro qryDelSaldoContabBem : IdBem = '+qryMovContabBemIDBEM.AsString,'Erro',mtError,[mbOk],0) ;
                     Raise eExcessaoCAF.Create('Preparando Saldos');
                  end;
                  //----------------------------------------------------------------------
                  qrySaldoContabBem.Next;
               end;
            end else
            begin
               qryInsSaldoContabBem.ParamByName('IDBEM').AsInteger           := qryMovContabBemIDBEM.AsInteger;
               qryInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger        := qryMovContabBemIDPESSOA.AsInteger;
               qryInsSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime     := qryMovContabBemDATAMOVIMENTACAO.AsDateTime;
               qryInsSaldoContabBem.ParamByName('VALORG').AsCurrency         := fValOrg;
               qryInsSaldoContabBem.ParamByName('CMBEM').AsCurrency          := fCmBem;
               qryInsSaldoContabBem.ParamByName('DEPLANC').AsCurrency        := fDepLanc;
               qryInsSaldoContabBem.ParamByName('CMDEP').AsCurrency          := fCmDep;
               qryInsSaldoContabBem.ParamByName('REAVVALORG').AsCurrency     := fReavValOrg;
               qryInsSaldoContabBem.ParamByName('REAVCMBEM').AsCurrency      := fReavCmBem;
               qryInsSaldoContabBem.ParamByName('REAVDEPLANC').AsCurrency    := fReavDepLanc;
               qryInsSaldoContabBem.ParamByName('REAVCMDEP').AsCurrency      := fReavCmDep;
               qryInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsCurrency  := fUltReavValOrg;
               qryInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsCurrency   := fUltReavCmBem;
               qryInsSaldoContabBem.ParamByName('ULTREAVDEPLANC').AsCurrency := fUltReavDepLanc;
               qryInsSaldoContabBem.ParamByName('ULTREAVCMDEP').AsCurrency   := fUltReavCmDep;
               qryInsSaldoContabBem.ExecSQL;
               if qryInsSaldoContabBem.RowsAffected <= 0 then
               begin
                  MsgDlg('Erro qryInsSaldoContabBem : IdBem = '+qryMovContabBem.FieldByName('IDBEM').AsString,
                         'Erro',mtError,[mbOk],0) ;
                  Raise eExcessaoCAF.Create('Preparando Saldos');
               end;
               //-------------------------------------------------------------------------
               qryMovContabBem.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         qryBem.Next;
      end;
      if not bEntrou then
         Raise eExcessaoCAF.Create('Não entrou no módulo I de reconstrução');
      //----------------------------------------------------------------------------------
      CommitTransacao;
      StartTransacao;
      //----------------------------------------------------------------------------------
      // Atualização do histórico de transferências
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Atualizando Transferências ...';
      prgBar.Progress := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      AssignFile(fLog,'C:\CAFLOG.TXT');
      Rewrite(fLog);
      sLinha := 'IDBEM , IDPESSOA , IDGRUPO , IDLOCALIZACAO , IDRESPONSAVEL';
      Writeln(fLog,sLinha);
      //----------------------------------------------------------------------------------
      qrySCBTransf.Close;
      qrySCBTransf.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      //----------------------------------------------------------------------------------
      if ePlaca.Text <> '' then
         qrySCBTransf.SQL.Strings[5] := ' AND (SC.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qrySCBTransf.SQL.Strings[5] := ' ';
      if cmbGrupoIni.Text <> '' then
         qrySCBTransf.SQL.Strings[6] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qrySCBTransf.SQL.Strings[6] := ' ';
      //----------------------------------------------------------------------------------
      qrySCBTransf.Open;
      prgbar.MaxValue := qrySCBTransf.RecordCount;
      while not qrySCBTransf.EOF do
      begin
         fBem    := qrySCBTransf.FieldByName('IDBEM').AsFloat;
         fPessoa := qrySCBTransf.FieldByName('IDPESSOA').AsFloat;
         //lblBem.Caption := 'IDBEM = ' + trim(floattostr(fBem)) + ' - ' + trim(floattostr(fPessoa));
         Application.ProcessMessages;
         if (fBem = 0) or (fPessoa = 0) then
            Raise eExcessaoCAF.Create('Dados do Bem na query SCBTRANSF são inválidos!' + #13 +
                                      'IDBEM = ' + floattostr(fBem) + ' - ' + floattostr(fPessoa));
         //-------------------------------------------------------------------------------
         // Dados atuais do bem
         //-------------------------------------------------------------------------------
         qryBemAtual.Close;
         qryBemAtual.ParamByName('IDBEM').AsFloat    := fBem;
         qryBemAtual.ParamByName('IDPESSOA').AsFloat := fPessoa;
         qryBemAtual.Open;
         if qryBemAtual.IsEmpty then
            Raise eExcessaoCAF.Create('Dados do Bem na query SCBTRANSF são inválidos ou não possui conjunto associado!' + #13 +
                                      'IDBEM = ' + floattostr(fBem) + 'IDPESSOA = ' + floattostr(fPessoa));
         iGrupo := qryBemAtual.FieldByName('IDGRUPO').AsInteger;
         iLocal := qryBemAtual.FieldByName('IDLOCALIZACAO').AsInteger;
         iResp  := qryBemAtual.FieldByName('IDRESPONSAVEL').AsInteger;
         if (iGrupo = 0) or (iLocal = 0) or (iResp = 0) then
            Raise eExcessaoCAF.Create('Dados do Bem na query BEMATUAL é inválido!' + #13 +
                                      'IDGRUPO = ' + inttostr(iGrupo) + 'IDLOCALIZACAO = ' + inttostr(iLocal) + 'IDRESPONSAVEL = ' + inttostr(iResp));
         //-------------------------------------------------------------------------------
         // Dados de transferencia anteriores do bem
         //-------------------------------------------------------------------------------
         qryMovTransf.Close;
         qryMovTransf.ParamByName('IDBEM').AsFloat    := fBem;
         qryMovTransf.ParamByName('IDPESSOA').AsFloat := fPessoa;
         qryMovTransf.Open;
         //-------------------------------------------------------------------------------
         while (not qrySCBTransf.EOF) and (qrySCBTransf.FieldByName('IDBEM').AsFloat = fBem) and
                                          (qrySCBTransf.FieldByName('IDPESSOA').AsFloat = fPessoa) do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Atualiza os dados na tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            sDataMov := qrySCBTransf.FieldByName('DATASLDBEM').AsString;
            qryUpdSCBTransf.ParamByName('IDBEM').AsFloat           := fBem;
            qryUpdSCBTransf.ParamByName('IDPESSOA').AsFloat        := fPessoa;
            qryUpdSCBTransf.ParamByName('DATASLDBEM').AsDateTime   := qrySCBTransf.FieldByName('DATASLDBEM').AsDateTime;
            qryUpdSCBTransf.ParamByName('IDGRUPO').AsInteger       := iGrupo;
            qryUpdSCBTransf.ParamByName('IDLOCALIZACAO').AsInteger := iLocal;
            qryUpdSCBTransf.ParamByName('IDRESPONSAVEL').AsInteger := iResp;
            qryUpdSCBTransf.ExecSQL;
            //----------------------------------------------------------------------------
            // Verifica mudança no grupo, localização ou responsável do bem
            //----------------------------------------------------------------------------
            if not qryMovTransf.IsEmpty then
            begin
               if qrySCBTransf.FieldByName('DATASLDBEM').AsDateTime = qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime then
               begin
                  dDataMov := qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  while (not qryMovTransf.EOF) and
                        (qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                  begin
                     if not qryMovTransf.FieldByName('IDGRUPANT').IsNull then
                        if GrupoExiste(qryMovTransf.FieldByName('IDGRUPANT').AsFloat) then
                           iGrupo := qryMovTransf.FieldByName('IDGRUPANT').AsInteger;
                     if not qryMovTransf.FieldByName('IDLOCALANT').IsNull then
                        if LocalExiste(qryMovTransf.FieldByName('IDLOCALANT').AsFloat) then
                           iLocal := qryMovTransf.FieldByName('IDLOCALANT').AsInteger;
                     if not qryMovTransf.FieldByName('IDRESPANT').IsNull then
                        if RespExiste(qryMovTransf.FieldByName('IDRESPANT').AsFloat) then
                           iResp  := qryMovTransf.FieldByName('IDRESPANT').AsInteger;
                     //-------------------------------------------------------------------
                     qryMovTransf.Next;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            if (prgBar.Progress mod 50) = 0 then
            begin
               CommitTransacao;
               StartTransacao;
            end;
            //----------------------------------------------------------------------------
            qrySCBTransf.Next;
         end;
      end;
      CloseFile(fLog);
      //----------------------------------------------------------------------------------
      // Ajusta os Saldos das Tabelas BEM, REAVALIACAO e ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      // Posiciona a tabela Bem
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Tabela BEM ...';
      prgBar.Progress := 0;
      Application.ProcessMessages;
      qryAtuBem.Close;
      //----------------------------------------------------------------------------------
      if ePlaca.Text <> '' then
         qryAtuBem.SQL.Strings[59] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qryAtuBem.SQL.Strings[59] := ' ';
      if cmbGrupoIni.Text <> '' then
         qryAtuBem.SQL.Strings[60] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qryAtuBem.SQL.Strings[60] := ' ';
      //----------------------------------------------------------------------------------
      qryAtuBem.ParamByName('PDATAMOV').AsDateTime  := date;
      qryAtuBem.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      qryAtuBem.Open;
      //----------------------------------------------------------------------------------
      prgbar.MaxValue := qryBem.RecordCount;
      while not qryAtuBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Tabela BEM - Atualizando Placa ' + qryAtuBemPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 50) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBemVALORG.AsFloat - qryAtuBemVALORG0.AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBemVALORG.AsCurrency := qryAtuBemVALORG0.AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBemCMBEM.AsFloat - qryAtuBemCMBEM0.AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBemCMBEM.AsCurrency := qryAtuBemCMBEM0.AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBemDEPLANC.AsFloat - qryAtuBemDEPLANC0.AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBemDEPLANC.AsCurrency := qryAtuBemDEPLANC0.AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBemCMDEP.AsFloat - qryAtuBemCMDEP0.AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBemCMDEP.AsCurrency := qryAtuBemCMDEP0.AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryAtuBem.Next;
      end;
      CommitTransacao;
      StartTransacao;
      //----------------------------------------------------------------------------------
      // Posiciona a tabela Reavaliacao
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Tabela REAVALIACAO ...';
      prgBar.Progress := 0;
      Application.ProcessMessages;
      qryAtuReavaliacao.Close;
      //----------------------------------------------------------------------------------
      if ePlaca.Text <> '' then
         qryAtuReavaliacao.SQL.Strings[59] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qryAtuReavaliacao.SQL.Strings[59] := ' ';
      if cmbGrupoIni.Text <> '' then
         qryAtuReavaliacao.SQL.Strings[60] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qryAtuReavaliacao.SQL.Strings[60] := ' ';
      //----------------------------------------------------------------------------------
      qryAtuReavaliacao.ParamByName('PDATAMOV').AsDateTime  := Date;
      qryAtuReavaliacao.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      qryAtuReavaliacao.Open;
      prgbar.MaxValue := qryAtuReavaliacao.RecordCount;
      //----------------------------------------------------------------------------------
      while not qryAtuReavaliacao.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Tabela REAVALIACAO - Atualizando Placa ' + qryAtuReavaliacaoPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if ePlaca.Text <> '' then
            if qryAtuReavaliacaoIDBEM.AsInteger <> iIdBem then
            begin
               qryAtuReavaliacao.Next;
               Continue;
            end;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 50) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacaoVALORG.AsFloat - qryAtuReavaliacaoVALORG0.AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacaoVALORG.AsCurrency := qryAtuReavaliacaoVALORG0.AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacaoCMBEM.AsFloat - qryAtuReavaliacaoCMBEM0.AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacaoCMBEM.AsCurrency := qryAtuReavaliacaoCMBEM0.AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacaoDEPLANC.AsFloat - qryAtuReavaliacaoDEPLANC0.AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacaoDEPLANC.AsCurrency := qryAtuReavaliacaoDEPLANC0.AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacaoCMDEP.AsFloat - qryAtuReavaliacaoCMDEP0.AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacaoCMDEP.AsCurrency := qryAtuReavaliacaoCMDEP0.AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryAtuReavaliacao.Next;
      end;
      CommitTransacao;
      StartTransacao;
      //----------------------------------------------------------------------------------
      // Posiciona a tabela AcrescimoValor
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Tabela ACRESCIMOVALOR ...';
      prgBar.Progress := 0;
      Application.ProcessMessages;
      qryAtuAcrescimo.Close;
      //----------------------------------------------------------------------------------
      if ePlaca.Text <> '' then
         qryAtuAcrescimo.SQL.Strings[59] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qryAtuAcrescimo.SQL.Strings[59] := ' ';
      if cmbGrupoIni.Text <> '' then
         qryAtuAcrescimo.SQL.Strings[60] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qryAtuAcrescimo.SQL.Strings[60] := ' ';
      //----------------------------------------------------------------------------------
      qryAtuAcrescimo.ParamByName('PDATAMOV').AsDateTime  := Date;
      qryAtuAcrescimo.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      qryAtuAcrescimo.Open;
      prgbar.MaxValue := qryAtuAcrescimo.RecordCount;
      //----------------------------------------------------------------------------------
      while not qryAtuAcrescimo.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Tabela ACRESCIMOVALOR - Atualizando Placa ' + qryAtuAcrescimoPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 50) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimoVALORG.AsFloat - qryAtuAcrescimoVALORG0.AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimoVALORG.AsCurrency := qryAtuAcrescimoVALORG0.AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimoCMBEM.AsFloat - qryAtuAcrescimoCMBEM0.AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimoCMBEM.AsCurrency := qryAtuAcrescimoCMBEM0.AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimoDEPLANC.AsFloat - qryAtuAcrescimoDEPLANC0.AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimoDEPLANC.AsCurrency := qryAtuAcrescimoDEPLANC0.AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimoCMDEP.AsFloat - qryAtuAcrescimoCMDEP0.AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimoCMDEP.AsCurrency := qryAtuAcrescimoCMDEP0.AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryAtuAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      CommitTransacao;
      pnlStatus.Visible := False;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
      bbtnConfirmar.Enabled := True;
   except
      on E : Exception do
      begin
         Screen.Cursor := crDefault;
         RollBackTransacao;
         MsgDlg('Processamento Abortado.' + #13 + 'Erro : ' + E.Message,
                'Erro', mtError, [mbOk], 0) ;
         bbtnConfirmar.Enabled := True;
         pnlStatus.Visible := False;
      end;
   end;
end;
//========================================================================================
procedure TfrmAcertaSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBem.Close;
   qryGrupos.Close;
   qryConjuntos.Close;
   qrySaldoContabBem.Close;
   qryMovContabBem.Close;
   qryAtuBem.Close;
   qryAtuReavaliacao.Close;
   qryAtuAcrescimo.Close;
   qryGrupoIni.Close;
   qryMovTransf.Close;
   qryBem.UnPrepare;
   qryGrupos.UnPrepare;
   qrySaldoContabBem.UnPrepare;
   qryMovContabBem.UnPrepare;
   qryMovTransf.UnPrepare;
   qryRemSaldoContabBem.UnPrepare;
   qryRemSaldoContabGrupo.UnPrepare;
   qryRemSaldoContabConj.UnPrepare;
   qryAtuBem.UnPrepare;
   qryAtuReavaliacao.UnPrepare;
   qryAtuAcrescimo.UnPrepare;
   qryGrupoIni.UnPrepare;
end;
//========================================================================================
procedure TfrmAcertaSaldo.ePlacaExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if ePlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := strtofloat(ePlaca.Text);
      qryPlaca.Open;
      if qryPlaca.isEmpty then
      begin
         msgdlg('Placa não Localizada','Erro', mtError, [mbOk], 0);
         ePlaca.Text := '';
      end else
      begin
         iIdBem := qryPlacaIDBEM.AsInteger;
      end;
   end;
end;
//========================================================================================
procedure TfrmAcertaSaldo.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      iIdBem      := strtoint(dtmAtivoFixo.MSBem.ValoresChave[1]);
      ePlaca.Text := dtmAtivoFixo.MSBem.ValoresChave[2];
   end else
      ePlaca.Text := '';
end;
//========================================================================================
function TfrmAcertaSaldo.GrupoExiste(fGrupo : Extended) : Boolean;
begin
   qryGrupoExiste.Close;
   qryGrupoExiste.ParamByName('IDGRUPO').AsFloat  := fGrupo;
   qryGrupoExiste.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryGrupoExiste.Open;
   if qryGrupoExiste.IsEmpty then
   begin
      sLinha := qrySCBTransf.FieldByName('IDBEM').AsString + ' , ' +
                qrySCBTransf.FieldByName('IDPESSOA').AsString + ' , ' +
                floattostr(fGrupo) + ' , , ';
      Writeln(fLog,sLinha);
      result := False;
   end else
      result := True;
end;
//========================================================================================
function TfrmAcertaSaldo.LocalExiste(fLocal : Extended) : Boolean;
begin
   qryLocalExiste.Close;
   qryLocalExiste.ParamByName('IDLOCALIZACAO').AsFloat := fLocal;
   qryLocalExiste.ParamByName('IDPESSOA').AsFloat      := Sistema.IdEmpresa;
   qryLocalExiste.Open;
   if qryLocalExiste.IsEmpty then
   begin
      sLinha := qrySCBTransf.FieldByName('IDBEM').AsString + ' , ' +
                qrySCBTransf.FieldByName('IDPESSOA').AsString + ' , ' +
                ' , ' + floattostr(fLocal) + ' , ';
      Writeln(fLog,sLinha);
      result := False;
   end else
      result := True;
end;
//========================================================================================
function TfrmAcertaSaldo.RespExiste(fResp : Extended) : Boolean;
begin
   qryRespExiste.Close;
   qryRespExiste.ParamByName('IDRESPONSAVEL').AsFloat := fResp;
   qryRespExiste.Open;
   if qryRespExiste.IsEmpty then
   begin
      sLinha := qrySCBTransf.FieldByName('IDBEM').AsString + ' , ' +
                qrySCBTransf.FieldByName('IDPESSOA').AsString + ' , ' +
                ' , , ' + floattostr(fResp);
      Writeln(fLog,sLinha);
      result := False;
   end else
      result := True;
end;

end.




