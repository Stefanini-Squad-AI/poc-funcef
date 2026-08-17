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
    qryAtuReavaliacao: TwwQuery;
    spdPesquisa: TBitBtn;
    ePlaca: TEdit;
    Label26: TLabel;
    qryPlaca: TwwQuery;
    qryRemSaldoContabGrupo: TwwQuery;
    qryGrupos: TwwQuery;
    qryGrupoIni: TwwQuery;
    qryMovTransf: TwwQuery;
    qrySCBTransf: TwwQuery;
    qryBemAtual: TwwQuery;
    qryUpdSCBTransf: TwwQuery;
    qryMovBaixa: TwwQuery;
    rdgRemover: TRadioGroup;
    qryRemSaldoContabConj: TwwQuery;
    qryConjuntos: TwwQuery;
    lblBem: TLabel;
    qryRespExiste: TwwQuery;
    qryLocalExiste: TwwQuery;
    qryGrupoExiste: TwwQuery;
    edDesBem: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    cmbGrupoIni: TwwDBLookupCombo;
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
    function ConvNum(fNum : Extended) : Currency;
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
function TfrmAcertaSaldo.ConvNum(fNum : Extended) : Currency;
begin
   Result := strtofloat(Format('%20.4f',[fNum]));
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
   qryRemSaldoContabConj.Prepare;
   qryAtuBem.Prepare;
   qryAtuReavaliacao.Prepare;
   qryAtuAcrescimo.Prepare;
   qryMovTransf.Prepare;
   qryGrupoIni.Prepare;
   qryGrupoIni.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryGrupoIni.Open;
   //-------------------------------------------------------------------------------------
   iIdBem      := -1;
   ePlaca.Text := '';
   edDesBem.Text := '';
end;
//========================================================================================
procedure TfrmAcertaSaldo.FormActivate(Sender: TObject);
begin
   inherited;
//   rdgTipoBem.SetFocus;
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
   fUltReavDepLanc, fUltReavCmDep : Currency;
   fBem, fPessoa                  : Extended;
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
            qryRemSaldoContabBem.SQL.Strings[6] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
         else
            qryRemSaldoContabBem.SQL.Strings[6] := ' ';
         if cmbGrupoIni.Text <> '' then
            qryRemSaldoContabBem.SQL.Strings[7] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
         else
            qryRemSaldoContabBem.SQL.Strings[7] := ' ';
         //-------------------------------------------------------------------------------
         qryRemSaldoContabBem.Prepare;
         qryRemSaldoContabBem.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
         qryRemSaldoContabBem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryRemSaldoContabBem.ExecSQL;
         if qryRemSaldoContabBem.RowsAffected <= 0 then
            Raise Exception.Create('Removendo Saldo Anterior (1)');
         //-------------------------------------------------------------------------------
         CommitTransacao;
      end else
      begin
         if rdgRemover.ItemIndex = 0 then
         begin
            if not qryRemSaldoContabGrupo.Prepared then
               qryRemSaldoContabGrupo.Prepare;
            qryGrupos.Close;
            qryGrupos.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
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
               qryRemSaldoContabGrupo.ParamByName('PIDGRUPO').AsInteger   := qryGrupos.FieldByName('IDGRUPO').AsInteger;
               qryRemSaldoContabGrupo.ParamByName('IDPESSOA').AsInteger   := qryGrupos.FieldByName('IDPESSOA').AsInteger;
               qryRemSaldoContabGrupo.ExecSQL;
               if qryRemSaldoContabGrupo.RowsAffected < 0 then
                  Raise Exception.Create('Removendo Saldo Anterior (2)');
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
            qryConjuntos.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
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
               qryRemSaldoContabConj.ParamByName('PIDCONJUNTO').AsInteger := qryConjuntos.FieldByName('IDCONJUNTO').AsInteger;
               qryRemSaldoContabConj.ParamByName('IDPESSOA').AsInteger    := qryConjuntos.FieldByName('IDPESSOA').AsInteger;
               qryRemSaldoContabConj.ExecSQL;
               if qryRemSaldoContabConj.RowsAffected < 0 then
                  Raise Exception.Create('Removendo Saldo Anterior (3)');
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
         Exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Preparando Histórico ...';
   Application.ProcessMessages;
   qryBem.Close;
   if ePlaca.Text <> '' then
      qryBem.SQL.Strings[7] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
   else
      qryBem.SQL.Strings[7] := ' ';
   if cmbGrupoIni.Text <> '' then
      qryBem.SQL.Strings[8] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
   else
      qryBem.SQL.Strings[8] := ' ';
   qryBem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
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
         qrySaldoContabBem.ParamByName('PIDPESSOA').AsFloat := qryBem.FieldByName('IDPESSOA').AsFloat;
         qrySaldoContabBem.ParamByName('PIDBEM').AsInteger  := qryBem.FieldByName('IDBEM').AsInteger;
         qrySaldoContabBem.Open;
         qryMovContabBem.Close;
         qryMovContabBem.ParamByName('PIDPESSOA').AsFloat   := qryBem.FieldByName('IDPESSOA').AsInteger;
         qryMovContabBem.ParamByName('PIDBEM').AsInteger    := qryBem.FieldByName('IDBEM').AsInteger;
         qryMovContabBem.Open;
         while not qryMovContabBem.EOF do
         begin
            fValOrg         := ConvNum(ConvNum(fValOrg)         + ConvNum(qryMovContabBem.FieldByName('VALORG').AsFloat));
            fCmBem          := ConvNum(ConvNum(fCmBem)          + ConvNum(qryMovContabBem.FieldByName('CMBEM').AsFloat));
            fDepLanc        := ConvNum(ConvNum(fDepLanc)        + ConvNum(qryMovContabBem.FieldByName('DEPLANC').AsFloat));
            fCmDep          := ConvNum(ConvNum(fCmDep)          + ConvNum(qryMovContabBem.FieldByName('CMDEP').AsFloat));
            fReavValOrg     := ConvNum(ConvNum(fReavValOrg)     + ConvNum(qryMovContabBem.FieldByName('REAVVALORG').AsFloat));
            fReavCmBem      := ConvNum(ConvNum(fReavCmBem)      + ConvNum(qryMovContabBem.FieldByName('REAVCMBEM').AsFloat));
            fReavDepLanc    := ConvNum(ConvNum(fReavDepLanc)    + ConvNum(qryMovContabBem.FieldByName('REAVDEPLANC').AsFloat));
            fReavCmDep      := ConvNum(ConvNum(fReavCmDep)      + ConvNum(qryMovContabBem.FieldByName('REAVCMDEP').AsFloat));
            fUltReavValOrg  := ConvNum(ConvNum(fUltReavValOrg)  + ConvNum(qryMovContabBem.FieldByName('ULTREAVVALORG').AsFloat));
            fUltReavCmBem   := ConvNum(ConvNum(fUltReavCmBem)   + ConvNum(qryMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat));
            fUltReavDepLanc := ConvNum(ConvNum(fUltReavDepLanc) + ConvNum(qryMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat));
            fUltReavCmDep   := ConvNum(ConvNum(fUltReavCmDep)   + ConvNum(qryMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat));
            //----------------------------------------------------------------------------
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
               MsgDlg('Erro qryInsSaldoContabBem : IdBem = '+qryMovContabBem.FieldByName('IDBEM').AsString,'Erro',mtError,[mbOk],0) ;
               Raise Exception.Create('Preparando Saldos');
            end;
            //----------------------------------------------------------------------------
            qryMovContabBem.Next;
         end;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 25) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         qryBem.Next;
      end;
      if not bEntrou then
         Raise Exception.Create('Não entrou no módulo I de reconstrução');
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
      AssignFile(fLog, Sistema.TempDir + 'CAFLOG.TXT');
      Rewrite(fLog);
      sLinha := 'IDBEM , IDPESSOA , IDGRUPO , IDLOCALIZACAO , IDRESPONSAVEL';
      Writeln(fLog,sLinha);
      //----------------------------------------------------------------------------------
      qrySCBTransf.Close;
      qrySCBTransf.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
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
         if (fBem = 0) or (fPessoa = 0) then
            Raise Exception.Create('Dados do Bem na query SCBTRANSF são inválidos!' + #13 +
                                      'IDBEM = ' + floattostr(fBem) + ' - ' + floattostr(fPessoa));
         //-------------------------------------------------------------------------------
         // Dados atuais do bem
         //-------------------------------------------------------------------------------
         qryBemAtual.Close;
         qryBemAtual.ParamByName('IDBEM').AsFloat    := fBem;
         qryBemAtual.ParamByName('IDPESSOA').AsFloat := fPessoa;
         qryBemAtual.Open;
         if qryBemAtual.IsEmpty then
            Raise Exception.Create('Dados do Bem na query SCBTRANSF são inválidos ou não possui conjunto associado!' + #13 +
                                      'IDBEM = ' + floattostr(fBem) + 'IDPESSOA = ' + floattostr(fPessoa));
         iGrupo := qryBemAtual.FieldByName('IDGRUPO').AsInteger;
         iLocal := qryBemAtual.FieldByName('IDLOCALIZACAO').AsInteger;
         iResp  := qryBemAtual.FieldByName('IDRESPONSAVEL').AsInteger;
         if (iGrupo = 0) or (iLocal = 0) or (iResp = 0) then
            Raise Exception.Create('Dados do Bem na query BEMATUAL é inválido!' + #13 +
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
            if (prgBar.Progress mod 25) = 0 then
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
         qryAtuBem.SQL.Strings[69] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qryAtuBem.SQL.Strings[69] := ' ';
      if cmbGrupoIni.Text <> '' then
         qryAtuBem.SQL.Strings[70] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qryAtuBem.SQL.Strings[70] := ' ';
      //----------------------------------------------------------------------------------
      qryAtuBem.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
      qryAtuBem.ParamByName('PDATAMOV').AsDateTime  := date + 120;
      qryAtuBem.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      qryAtuBem.Open;
      //----------------------------------------------------------------------------------
      prgbar.MaxValue := qryBem.RecordCount;
      while not qryAtuBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Tabela BEM - Atualizando Placa ' + qryAtuBem.FieldByName('PLACA').AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 25) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('VALORG').AsFloat - qryAtuBem.FieldByName('VALORG0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('VALORG').AsCurrency := qryAtuBem.FieldByName('VALORG0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('CMBEM').AsFloat - qryAtuBem.FieldByName('CMBEM0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('CMBEM').AsCurrency := qryAtuBem.FieldByName('CMBEM0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('DEPLANC').AsFloat - qryAtuBem.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('DEPLANC').AsCurrency := qryAtuBem.FieldByName('DEPLANC0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('CMDEP').AsFloat - qryAtuBem.FieldByName('CMDEP0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('CMDEP').AsCurrency := qryAtuBem.FieldByName('CMDEP0').AsCurrency;
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
         qryAtuReavaliacao.SQL.Strings[69] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qryAtuReavaliacao.SQL.Strings[69] := ' ';
      if cmbGrupoIni.Text <> '' then
         qryAtuReavaliacao.SQL.Strings[70] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qryAtuReavaliacao.SQL.Strings[70] := ' ';
      //----------------------------------------------------------------------------------
      qryAtuReavaliacao.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
      qryAtuReavaliacao.ParamByName('PDATAMOV').AsDateTime  := date + 120;
      qryAtuReavaliacao.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      qryAtuReavaliacao.Open;
      prgbar.MaxValue := qryAtuReavaliacao.RecordCount;
      //----------------------------------------------------------------------------------
      while not qryAtuReavaliacao.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Tabela REAVALIACAO - Atualizando Placa ' + qryAtuReavaliacao.FieldByName('PLACA').AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if ePlaca.Text <> '' then
            if qryAtuReavaliacao.FieldByName('IDBEM').AsInteger <> iIdBem then
            begin
               qryAtuReavaliacao.Next;
               Continue;
            end;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 25) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldByName('VALORG').AsFloat - qryAtuReavaliacao.FieldByName('VALORG0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldByName('VALORG').AsCurrency := qryAtuReavaliacao.FieldByName('VALORG0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldByName('CMBEM').AsFloat - qryAtuReavaliacao.FieldByName('CMBEM0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldByName('CMBEM').AsCurrency := qryAtuReavaliacao.FieldByName('CMBEM0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldByName('DEPLANC').AsFloat - qryAtuReavaliacao.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldByName('DEPLANC').AsCurrency := qryAtuReavaliacao.FieldByName('DEPLANC0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldByName('CMDEP').AsFloat - qryAtuReavaliacao.FieldByName('CMDEP0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldByName('CMDEP').AsCurrency := qryAtuReavaliacao.FieldByName('CMDEP0').AsCurrency;
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
         qryAtuAcrescimo.SQL.Strings[69] := ' AND (B.IDBEM = '+IntToStr(iIdBem)+') '
      else
         qryAtuAcrescimo.SQL.Strings[69] := ' ';
      if cmbGrupoIni.Text <> '' then
         qryAtuAcrescimo.SQL.Strings[70] := ' AND (B.IDGRUPO = ' + qryGrupoIni.FieldByName('IDGRUPO').AsString + ') '
      else
         qryAtuAcrescimo.SQL.Strings[70] := ' ';
      //----------------------------------------------------------------------------------
      qryAtuAcrescimo.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
      qryAtuAcrescimo.ParamByName('PDATAMOV').AsDateTime  := date + 120;
      qryAtuAcrescimo.ParamByName('PFLGIMOVEL').AsInteger := rdgTipoBem.ItemIndex;
      qryAtuAcrescimo.Open;
      prgbar.MaxValue := qryAtuAcrescimo.RecordCount;
      //----------------------------------------------------------------------------------
      while not qryAtuAcrescimo.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Tabela ACRESCIMOVALOR - Atualizando Placa ' + qryAtuAcrescimo.FieldByName('PLACA').AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if (prgBar.Progress mod 25) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldByName('VALORG').AsFloat - qryAtuAcrescimo.FieldByName('VALORG0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldByName('VALORG').AsCurrency := qryAtuAcrescimo.FieldByName('VALORG0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldByName('CMBEM').AsFloat - qryAtuAcrescimo.FieldByName('CMBEM0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldByName('CMBEM').AsCurrency := qryAtuAcrescimo.FieldByName('CMBEM0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldByName('DEPLANC').AsFloat - qryAtuAcrescimo.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldByName('DEPLANC').AsCurrency := qryAtuAcrescimo.FieldByName('DEPLANC0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldByName('CMDEP').AsFloat - qryAtuAcrescimo.FieldByName('CMDEP0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldByName('CMDEP').AsCurrency := qryAtuAcrescimo.FieldByName('CMDEP0').AsCurrency;
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
      qryPlaca.ParamByName('PPLACA').AsFloat   := strtofloat(ePlaca.Text);
      qryPlaca.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      qryPlaca.Open;
      if qryPlaca.isEmpty then
      begin
         msgdlg('Placa não Localizada','Erro', mtError, [mbOk], 0);
         iIdBem := -1;
         ePlaca.Text := '';
         edDesBem.Text := '';
      end else
      begin
         iIdBem   := qryPlaca.FieldByName('IDBEM').AsInteger;
         edDesBem.Text := qryPlaca.FieldByName('DESBEM').AsString;
      end;
   end else
   begin
      iIdBem   := -1;
      edDesBem.Text := '';
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
      edDesBem.Text := dtmAtivoFixo.MSBem.ValoresChave[3];
   end else
   begin
      iIdBem      := -1;
      ePlaca.Text := '';
      edDesBem.Text := '';
   end;
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




