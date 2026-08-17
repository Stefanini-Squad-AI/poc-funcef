unit FCadMontaFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, DBCtrls, ComCtrls,
  CMTree, Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, ImgList, fcTreeView;

type
  TfrmCadMontaFluxo = class(TfrmCadastroCS)
    qryTipoRecDes: TwwQuery;
    dsTipoRecDes: TwwDataSource;
    qryTipoRecDesCODTIPRECDES: TStringField;
    qryTipoRecDesRECPAG: TStringField;
    qryTipoRecDesIDPESSOA: TFloatField;
    qryTipoRecDesDESCRICAO: TStringField;
    qryTipoRecDesANASINT: TStringField;
    qryParamCapCar: TwwQuery;
    qryAux: TwwQuery;
    sbtnOrdenar: TToolbarButton97;
    updDetLinha: TUpdateSQL;
    dsDetLinha: TwwDataSource;
    qryDetLinha: TwwQuery;
    updDetTipo: TUpdateSQL;
    dsDetTipo: TwwDataSource;
    qryDetTipo: TwwQuery;
    updLinhasPos: TUpdateSQL;
    dsLinhasPos: TwwDataSource;
    qryLinhasPos: TwwQuery;
    updTiposDocumento: TUpdateSQL;
    dsTiposDocumento: TwwDataSource;
    qryTiposDocumento: TwwQuery;
    qryTestaRepeticao: TwwQuery;
    ToolbarSep972: TToolbarSep97;
    bbtnVerificar: TBitBtn;
    updDetAux: TUpdateSQL;
    qryDetAux: TwwQuery;
    PgcMontaFluxo: TPageControl;
    tbshCadastro: TTabSheet;
    tbshMapaFluxo: TTabSheet;
    pnlLinhas: TPanel;
    spdVai2: TSpeedButton;
    spdVolta2: TSpeedButton;
    dbgLinhasSel: TwwDBGrid;
    Panel1: TPanel;
    lblLinhasSel: TLabel;
    Panel2: TPanel;
    lblLinhasP: TLabel;
    dbgLinhasPos: TwwDBGrid;
    pnlTipoRecDes: TPanel;
    spdVai1: TSpeedButton;
    spdVolta1: TSpeedButton;
    TreeTiposPos: TCMTreeView;
    pnlTituloP: TPanel;
    lblTituloP: TLabel;
    dbgTiposSel: TwwDBGrid;
    pnlTitulosDe: TPanel;
    lblTitulosDe: TLabel;
    PnlTiposDocumento: TPanel;
    btnAdicionaTipoDoc: TSpeedButton;
    btnSubtraiTipDoc: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    dbgTiposDocSelecionados: TwwDBGrid;
    Panel5: TPanel;
    Label2: TLabel;
    dbgTiposDocDisponiveis: TwwDBGrid;
    lblDescricao: TLabel;
    dbeDescricao: TwwDBEdit;
    dbgTipoCalculo: TDBRadioGroup;
    gbAcumula: TGroupBox;
    dbcAcumula: TDBCheckBox;
    dbrgPosicaoTotal: TDBRadioGroup;
    TrvMapaFluxo: TfcTreeView;
    qryMapaFluxo: TwwQuery;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdVai2Click(Sender: TObject);
    procedure spdVolta2Click(Sender: TObject);
    procedure spdVai1Click(Sender: TObject);
    procedure spdVolta1Click(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnOrdenarClick(Sender: TObject);
    procedure dbgTipoCalculoClick(Sender: TObject);
    procedure btnAdicionaTipoDocClick(Sender: TObject);
    procedure btnSubtraiTipDocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnVerificarClick(Sender: TObject);
  private
    { Private declarations }
    procedure InserirMontaFluxo;
    procedure AlterarMontaFluxo;
    procedure ExcluirMontaFluxo;
    procedure InserirCompFluxo;
    procedure ExcluirCompFluxo;
    procedure SelecionaFilhos(iCodLinhaFluxo: Integer);
    function  GerarSequencia(iCodLinhaFluxo: LongInt): Longint;
    procedure GeraMapaFluxo;
  public
    { Public declarations }
  end;

var
  frmCadMontaFluxo: TfrmCadMontaFluxo;
  sSql,sMascaraCAR,sMascaraCAP:String;
implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,UAutorizacao,uSistema,uFuncaoGeral,
  FOrdenaFluxo, FVerificaFluxo;

procedure TfrmCadMontaFluxo.FormCreate(Sender: TObject);
begin
   inherited;
   MontaSelect.Filtro.Add('MONTAFLUXO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   //
   pnlLinhas.Enabled:=False;
   pnlTipoRecDes.Enabled:=False;
   //
   qryParamCAPCAR.Close;
   qryParamCAPCAR.SQL.Clear;
   qryParamCAPCAR.SQL.text := 'SELECT MASCARADESEMB FROM PARAMCAP WHERE IDPESSOA = '+INTTOSTR(Sistema.IdEmpresa)+' AND RECPAG = ''R''';
   qryParamCAPCAR.Open;
   //
   sMascaraCAR:=trim(qryParamCapCar.FieldByName('MASCARADESEMB').AsString);
   //
   qryParamCAPCAR.Close;
   qryParamCAPCAR.SQL.Clear;
   qryParamCAPCAR.SQL.text := 'SELECT MASCARADESEMB FROM PARAMCAP WHERE IDPESSOA = '+INTTOSTR(Sistema.IdEmpresa)+' AND RECPAG = ''P''';
   qryParamCAPCAR.Open;
   //
   sMascaraCAP:=trim(qryParamCapCar.FieldByName('MASCARADESEMB').AsString);
   //
   SelecionaFilhos(0);
   PgcMontaFluxo.ActivePageIndex:=1;
   GeraMapaFluxo;   
   PgcMontaFluxo.ActivePageIndex:=0;
end;

procedure TfrmCadMontaFluxo.CmeCadastroInsert(Sender: TObject);
begin
   SelecionaFilhos(0);
   inherited;
   dbgTipoCalculo.SetFocus;
   //qry.FieldByName('TIPOCALCULO').AsString:='T';
   qry.FieldByName('FLGACUMULA').AsString:='N';
   qry.FieldByName('PosicaoTotal').AsString:='I';
   pnlLinhas.Enabled:=False;
   pnlTipoRecDes.Enabled:=False;
end;

procedure TfrmCadMontaFluxo.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbgTipoCalculo.SetFocus;
end;

procedure TfrmCadMontaFluxo.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then SelecionaFilhos(StrToInt(MontaSelect.ValoresChave[0]));
end;


procedure TfrmCadMontaFluxo.CmeCadastroConfirma(Sender: TObject);
begin
  if sbtnInserir.Down = True then
  begin
     try
        StartTransacao;
        InserirMontaFluxo;
        if qry.FieldByName('TIPOCALCULO').AsString <> 'T' then InserirCompFluxo;
        CommitTransacao;
        GeraMapaFluxo;
     except
        MsgDlg('Inclusão Não Efetuada','Erro',mtError,[mbOk],0);
        RollBackTransacao;
        raise;
     end;
  end;

  if sbtnAlterar.Down = True then
  begin
     try
        StartTransacao;
        AlterarMontaFluxo;
        ExcluirCompFluxo;
        if qry.FieldByName('TIPOCALCULO').AsString <> 'T' then InserirCompFluxo;
        CommitTransacao;
        SelecionaFilhos(qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger);
        GeraMapaFluxo;
     except
        MsgDlg('Alteração Não Efetuada','Erro',mtError,[mbOk],0);
        RollBackTransacao;
        raise;
     end;
  end;
  
  qryDetLinha.CancelUpdates;
  qryDetTipo.CancelUpdates;
  qry.CancelUpdates;
  pnlLinhas.Enabled:=False;
  pnlTipoRecDes.Enabled:=False;
end;

procedure TfrmCadMontaFluxo.CmeCadastroDelete(Sender: TObject);
begin
   try
      StartTransacao;
      ExcluirCompFluxo;
      ExcluirMontaFluxo;
      qryDetLinha.CancelUpdates;
      qryDetTipo.CancelUpdates;
      qry.CancelUpdates;
      CommitTransacao;
      SelecionaFilhos(qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger);
      GeraMapaFluxo;
   except
      MsgDlg('Exclusão Não Efetuada','Erro',mtError,[mbOk],0);
      FuncaoGeral.TiraIcone;
      RollBackTransacao;
      raise;
   end;
   pnlLinhas.Enabled:=False;
   pnlTipoRecDes.Enabled:=False;
end;

procedure TfrmCadMontaFluxo.SelecionaFilhos(iCodLinhaFluxo: Integer);
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.text := 'SELECT * FROM MONTAFLUXO WHERE CODLINHAFLUXO = '+IntToStr(iCodLinhaFluxo);
   qry.Open;
   //

   qryDetTipo.Close;
   qryDetTipo.SQL.Clear;

   qryDetTipo.SQL.text := 'SELECT C.*,T.CODTIPRECDES,T.RECPAG,T.IDPESSOA,T.DESCRICAO '+
                          'FROM COMPFLUXO C,TIPORECEBDESEMB T '+
                          'WHERE C.CODLINHAFLUXO = '+IntToStr(iCodLinhaFluxo)+' AND '+
                          '      C.CODTIPRECDES = T.CODTIPRECDES AND '+
                          '      C.IDPESSOA = T.IDPESSOA AND '+
                          '      C.RECPAG = T.RECPAG '+
                          'ORDER BY T.DESCRICAO ';
   if iCodLinhaFluxo<>0 then
      if (dbgTipoCalculo.ItemIndex=2) or (dbgTipoCalculo.ItemIndex=3) then
         qryDetTipo.SQL.text := 'SELECT C.*,T.RECPAG,T.DESCRICAO '+
                                'FROM COMPFLUXO C,TIPODOCRECPAG T '+
                                'WHERE C.CODLINHAFLUXO = '+IntToStr(iCodLinhaFluxo)+' AND '+
                                '      C.CODTIPDOC = T.CODTIPDOC AND '+
                                '      C.RECPAG = T.RECPAG '+
                                'ORDER BY T.DESCRICAO ';
   qryDetTipo.Open;
   //
   qryDetLinha.Close;
   qryDetLinha.SQL.Clear;
   qryDetLinha.SQL.text := 'SELECT C.*,M.CODLINHAFLUXO,M.DESCRICAO '+
                           'FROM COMPFLUXO C,MONTAFLUXO M '+
                           'WHERE C.CODLINHAFLUXO = '+IntToStr(iCodLinhaFluxo)+' AND '+
                           '      C.CODCOMPLINHA = M.CODLINHAFLUXO AND '+
                           '      C.CODTIPRECDES IS NULL '+
                           'ORDER BY M.DESCRICAO ';
   qryDetLinha.Open;
   //
   qryLinhasPos.Close;
   qryLinhasPos.SQL.Clear;
   qryLinhasPos.SQL.text :='SELECT CODLINHAFLUXO,DESCRICAO FROM MONTAFLUXO WHERE IDPESSOA = '+
                           IntToStr(Sistema.IdEmpresa)+' AND TIPOCALCULO <> ''T'' ORDER BY DESCRICAO';
   qryLinhasPos.Open;
   //
   qryDetLinha.First;
   while not(qryDetLinha.Eof) do
   begin
      qryLinhasPos.First;
      while not qryLinhasPos.Eof do
      begin
         if qryDetLinha.FieldByName('CODCOMPLINHA').AsInteger = qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger then
          begin
             qryLinhasPos.Delete;
             Break;
          end;
         qryLinhasPos.Next;
      end;
      qryDetLinha.Next;
   end;
   //
   if (qry.FieldByName('TIPOCALCULO').AsString = 'R') or
      (qry.FieldByName('TIPOCALCULO').AsString = 'P') then
      pnlTipoRecDes.BringToFront
   else
      pnlTipoRecDes.SendToBack;
   //
   dbgTipoCalculoClick(nil);
end;

procedure TfrmCadMontaFluxo.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(dbeDescricao.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a Descrição da Linha','Erro',mtError,[mbOk],0);
       dbeDescricao.SetFocus;
       exit;
     end;
  inherited;
end;

procedure TfrmCadMontaFluxo.spdVai2Click(Sender: TObject);
begin
  inherited;
  if qryLinhasPos.RecordCount = 0 Then
  Begin
     MsgDlg('Não existe nenhuma linha cadastrada','Erro',mtError,[mbOk],0);
     exit;
  end;
  qryDetLinha.Insert;
  qryDetLinha.FieldByName('CODCOMPLINHA').AsInteger  := qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger;
  qryDetLinha.FieldByName('DESCRICAO').AsString  := qryLinhasPos.FieldByName('DESCRICAO').AsString;
  qryDetLinha.FieldByname('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
  qryDetLinha.Post;
  qryLinhasPos.Delete;
end;

procedure TfrmCadMontaFluxo.spdVolta2Click(Sender: TObject);
begin
  inherited;
  if qryDetLinha.RecordCount = 0 Then
   begin
      MsgDlg('Não existe nenhuma linha selecionada','Erro',mtError,[mbOk],0);
      exit;
   end;
  qryLinhasPos.Insert;
  qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger  := qryDetLinha.FieldByName('CODCOMPLINHA').AsInteger;
  qryLinhasPos.FieldByName('DESCRICAO').AsString  := qryDetLinha.FieldByName('DESCRICAO').AsString;
  qryLinhasPos.Post;
  qryDetLinha.Delete;
end;

procedure TfrmCadMontaFluxo.InserirMontaFluxo;
begin
   if qry.FieldByName('CODLINHAFLUXO').AsInteger <=0 then
    begin
       qry.FieldByName('CODLINHAFLUXO').AsInteger:=LeUltRegistro(nil,'MONTAFLUXO');
       qry.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
       qry.FieldByName('ORDEM').AsInteger:=qry.FieldByName('CODLINHAFLUXO').AsInteger;
    end;

   qryAux.Close;
   sSql :='INSERT INTO MONTAFLUXO(CODLINHAFLUXO,IDPESSOA,DESCRICAO,'+
          'ORDEM,TIPOCALCULO,FLGACUMULA,POSICAOTOTAL) VALUES(';
   sSql :=sSql+qry.FieldByName('CODLINHAFLUXO').AsString+','+
               InttoStr(Sistema.IdEmpresa);
   sSql :=sSql+','''+qry.FieldByName('DESCRICAO').AsString+''','+
                     qry.FieldByName('ORDEM').AsString;
   sSql :=sSql+','''+qry.FieldByName('TIPOCALCULO').AsString+''','''+
                     qry.FieldByName('FLGACUMULA').AsString+'''';
   sSql :=sSql+','''+qry.FieldByName('POSICAOTOTAL').AsString+''')';
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSql);
   qryAux.ExecSQL;
end;

procedure TfrmCadMontaFluxo.AlterarMontaFluxo;
begin
   qryAux.Close;
   sSql :='UPDATE MONTAFLUXO SET DESCRICAO = '''+qry.FieldByName('DESCRICAO').AsString+'''';
   sSql :=sSql+',ORDEM = '+qry.FieldByName('ORDEM').AsString;
   sSql :=sSql+',TIPOCALCULO = '''+qry.FieldByName('TIPOCALCULO').AsString+'''';
   sSql :=sSql+',FLGACUMULA = '''+qry.FieldByName('FLGACUMULA').AsString+'''';
   sSql :=sSql+',POSICAOTOTAL = '''+qry.FieldByName('POSICAOTOTAL').AsString+'''';
   sSql :=sSql+' WHERE CODLINHAFLUXO = '+IntToStr(qry.FieldByName('CODLINHAFLUXO').AsInteger);
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSql);
   qryAux.ExecSQL;
end;

procedure TfrmCadMontaFluxo.ExcluirMontaFluxo;
begin
   qryAux.Close;
   sSql :='DELETE FROM MONTAFLUXO WHERE CODLINHAFLUXO = '+
          IntToStr(qry.FieldByName('CODLINHAFLUXO').AsInteger);
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSql);
   qryAux.ExecSQL;
end;

procedure TfrmCadMontaFluxo.InserirCompFluxo;
var
   iSequencia:Integer;
begin
   qryDetLinha.First;
   iSequencia := GerarSequencia(qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger);
   while (not qryDetLinha.EOF) do
   begin
      qryAux.Close;
      sSql:='INSERT INTO COMPFLUXO(CODLINHAFLUXO,IDSEQUENCIA,CODCOMPLINHA,IDPESSOA) VALUES(';
      sSql:=sSql+qry.FieldByName('CODLINHAFLUXO').AsString+','+IntToStr(iSequencia);
      sSql:=sSql+','+qryDetLinha.FieldByName('CODCOMPLINHA').AsString;
      sSql:=sSql+','+IntToStr(Sistema.IdEmpresa)+')';
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.ExecSQL;
      Inc(iSequencia);      
      qryDetLinha.Next;
   end;
   //
   qryDetTipo.First;
   //iSequencia := GerarSequencia(qryLinhasPos.FieldByName('CODLINHAFLUXO').AsInteger);
   while (not qryDetTipo.EOF) do
   begin
      qryAux.Close;
      sSql :='INSERT INTO COMPFLUXO(CODLINHAFLUXO,IDSEQUENCIA,CODTIPRECDES,RECPAG,IDPESSOA,'+
             'CODCOMPLINHA,CODTIPDOC) VALUES(';
      sSql :=sSql+qry.FieldByName('CODLINHAFLUXO').AsString+','+IntToStr(iSequencia);
      sSql :=sSql+','''+qryDetTipo.FieldByName('CODTIPRECDES').AsString+''','''+
                        qryDetTipo.FieldByName('RECPAG').AsString+'''';
      sSql :=sSql+','+IntToStr(Sistema.IdEmpresa)+','+qry.FieldByName('CODLINHAFLUXO').AsString;
      if qryDetTipo.FieldByName('CODTIPDOC').AsFloat=0 then
         sSql:=sSql+',null)'
      else
         sSql:=sSql+','+Trim(qryDetTipo.FieldByName('CODTIPDOC').AsString)+')';
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.ExecSQL;
      Inc(iSequencia);
      qryDetTipo.Next;
   end;
end;

procedure TfrmCadMontaFluxo.ExcluirCompFluxo;
begin
   qryAux.Close;
   sSql :='DELETE FROM COMPFLUXO WHERE CODLINHAFLUXO = '+
          IntToStr(qry.FieldByName('CODLINHAFLUXO').AsInteger);
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSql);
   qryAux.ExecSQL;
end;

procedure TfrmCadMontaFluxo.spdVai1Click(Sender: TObject);
var
   bRepetido   : Boolean;
   iNumCarRD   : Integer;
begin
  inherited;
  if qryTipoRecDes.RecordCount = 0 Then
  Begin
     MsgDlg('Não existe nenhum Tipo cadastrado','Erro',mtError,[mbOk],0);
     exit;
  end;

  iNumCarRD:=Length(Trim(qryTipoRecDes.FieldByName('CODTIPRECDES').AsString));

  bRepetido:=False;
  try
     qryDetTipo.DisableControls;
     qryDetTipo.First;
     while not(qryDetTipo.Eof) do
     begin
        if (qryDetTipo.FieldByName('CODTIPRECDES').AsString=
            qryTipoRecDes.FieldByName('CODTIPRECDES').AsString) OR
           (Copy(Trim(qryDetTipo.FieldByName('CODTIPRECDES').AsString),1,iNumCarRD)=
            Trim(qryTipoRecDes.FieldByName('CODTIPRECDES').AsString)) then
         begin
            bRepetido:=True;
            Break;
         end;
        qryDetTipo.Next;
     end;
  finally
     qryDetTipo.EnableControls;
  end;

  if bRepetido then
     MsgDlg('Tipo de Recebimento/Desembolso já selecionado.','Erro',mtError,[mbOk],0)
  else
   begin
      //Teste entre outras linhas
      qryTestaRepeticao.Close;
      qryTestaRepeticao.SQL.Text:='SELECT Count(*) AS QtdeLinhas FROM CompFluxo '+
                                  'WHERE ((RTrim(CODTIPRECDES)= '''+
                                     Trim(qryTipoRecDes.FieldByName('CODTIPRECDES').AsString)+''') OR '+
                                  '      (SubStr(RTrim(CODTIPRECDES),1,'+IntToStr(iNumCarRD)+') = '''+
                                     Trim(qryTipoRecDes.FieldByName('CODTIPRECDES').AsString)+''') OR '+
                                  '      (RTrim(CODTIPRECDES)=SubStr('''+
                                     Trim(qryTipoRecDes.FieldByName('CODTIPRECDES').AsString)+''',1, '+
                                  '       Length(RTrim(CODTIPRECDES))))) AND '+
                                  '      (CODLINHAFLUXO<>'+
                                     FloatToStr(qry.FieldByName('CODLINHAFLUXO').AsFloat)+') AND '+
                                  '      (RECPAG = '''+qryTipoRecDes.FieldByName('RECPAG').AsString+''')';
      qryTestaRepeticao.Open;

      bRepetido:=False;
      if qryTestaRepeticao.FieldByName('QtdeLinhas').AsFloat<>0 then
         if (MsgDlg('Tipo de Recebimento/Desembolso já selecionado ou existe uma'+#10+#13+
                   'outra linha que contém o mesmo Tipo de Recebimento/Desembolso '+#10+#13+
                   'ou um outro que o englobe.'+#10+#13+
                   'Deseja Incluir assim mesmo ? ','Erro',mtError,[mbYes,mbNo],0) = mrNo) then
             bRepetido:=True;

      if not(bRepetido) then
       begin
          qryDetTipo.Append;
          qryDetTipo.FieldByName('CODTIPRECDES').AsString:=qryTipoRecDes.FieldByName('CODTIPRECDES').AsString;
          qryDetTipo.FieldByName('RECPAG').AsString:=qryTipoRecDes.FieldByName('RECPAG').AsString;
          qryDetTipo.FieldByName('IDPESSOA').AsInteger:=qryTipoRecDes.FieldByName('IDPESSOA').AsInteger;
          qryDetTipo.FieldByName('DESCRICAO').AsString:=qryTipoRecDes.FieldByName('DESCRICAO').AsString;
          qryDetTipo.Post;
       end;

       qryTestaRepeticao.Close;
    end;
end;

procedure TfrmCadMontaFluxo.spdVolta1Click(Sender: TObject);
begin
  inherited;
  if qryDetTipo.RecordCount = 0 Then
  Begin
     MsgDlg('Não existe nenhum Tipo selecionado','Erro',mtError,[mbOk],0);
     exit;
  end;
  qryDetTipo.Delete;
end;

function TfrmCadMontaFluxo.GerarSequencia(iCodLinhaFluxo: LongInt): Longint;
begin
   qryAux.Close;
   sSql := 'Select Max(IDSEQUENCIA) as ProxSequencia From COMPFLUXO '+
           'Where CODLINHAFLUXO = '+IntToStr(iCodLinhaFluxo);
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSql);
   qryAux.Open;
   Result:=qryAux.FieldByName('ProxSequencia').AsInteger + 1;
   qryAux.Close;
end;

procedure TfrmCadMontaFluxo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnOrdenar.Enabled:=True;
   if (sbtnInserir.Down = True) or (sbtnAlterar.Down = True) or (sbtnApagar.Down = True) then
      sbtnOrdenar.Enabled:=False;
   bbtnVerificar.Enabled:=not((sbtnInserir.Down = True) or (sbtnAlterar.Down = True) or (sbtnApagar.Down = True));

   tbshCadastro.Enabled:=pnlFundo.Enabled;
   tbshMapaFluxo.Enabled:=True;
   PgcMontaFluxo.ActivePageIndex:=0;
   pnlFundo.Enabled:=True;
end;


procedure TfrmCadMontaFluxo.sbtnOrdenarClick(Sender: TObject);
begin
  inherited;
  frmOrdenaFluxo:=TfrmOrdenaFluxo.Create(Self);
  frmOrdenaFluxo.ShowModal;
  GeraMapaFluxo;
  sbtnOrdenar.Down:=False;
end;

procedure TfrmCadMontaFluxo.dbgTipoCalculoClick(Sender: TObject);
begin
   pnlLinhas.Enabled:=False;
   pnlTipoRecDes.Enabled:=False;
   PnlTiposDocumento.Enabled:=False;
   dbcAcumula.Enabled:=True;

   case dbgTipoCalculo.ItemIndex of
      0: begin
            pnlTipoRecDes.BringToFront;
            pnlTipoRecDes.Enabled:=True;

            qryTipoRecDes.Close;
            qryTipoRecDes.SQL.Clear;
            qryTipoRecDes.SQL.text := 'SELECT * FROM TIPORECEBDESEMB WHERE IDPESSOA = '+
                                      IntToStr(Sistema.IdEmpresa)+
                                      ' AND RECPAG = ''R'' ORDER BY CODTIPRECDES';
            qryTipoRecDes.Open;

            TreeTiposPos.Mascara:=sMascaraCAR;
            TreeTiposPos.MontaArvore;
         end;
      1: begin
            pnlTipoRecDes.BringToFront;
            pnlTipoRecDes.Enabled:=True;

            qryTipoRecDes.Close;
            qryTipoRecDes.SQL.Clear;
            qryTipoRecDes.SQL.text := 'SELECT * FROM TIPORECEBDESEMB WHERE IDPESSOA = '+
                                      IntToStr(Sistema.IdEmpresa)+
                                      ' AND RECPAG = ''P'' ORDER BY CODTIPRECDES';
            qryTipoRecDes.Open;

            TreeTiposPos.Mascara:=sMascaraCAP;
            TreeTiposPos.MontaArvore;
         end;
      2: begin
            PnlTiposDocumento.BringToFront;
            PnlTiposDocumento.Enabled:=True;

            qryTiposDocumento.Close;
            qryTiposDocumento.ParamByName('CODLINHAFLUXO').AsInteger:=
                              qry.FieldByName('CODLINHAFLUXO').AsInteger;
            qryTiposDocumento.ParamByName('RECPAG').AsString:='R';
            qryTiposDocumento.Open;
            PnlTiposDocumento.BringToFront;
         end;
      3: begin
            PnlTiposDocumento.BringToFront;
            PnlTiposDocumento.Enabled:=True;

            qryTiposDocumento.Close;            
            qryTiposDocumento.ParamByName('CODLINHAFLUXO').AsInteger:=
                              qry.FieldByName('CODLINHAFLUXO').AsInteger;
            qryTiposDocumento.ParamByName('RECPAG').AsString:='P';
            qryTiposDocumento.Open;
            PnlTiposDocumento.BringToFront;
         end;
      4: begin
            pnlLinhas.BringToFront;
            pnlLinhas.Enabled:=True;
         end;
      5: begin
            dbcAcumula.Enabled:=False;
            pnlLinhas.BringToFront;
         end;
   end;
end;

procedure TfrmCadMontaFluxo.btnAdicionaTipoDocClick(Sender: TObject);
begin
   inherited;
   if qryTiposDocumento.RecordCount = 0 Then
    begin
       MsgDlg('Não existe nenhum Tipo de Documento cadastrado','Erro',mtError,[mbOk],0);
       exit;
    end;
   qryDetTipo.Insert;
   qryDetTipo.FieldByName('RECPAG').AsString:=qryTiposDocumento.FieldByName('RECPAG').AsString;
   qryDetTipo.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
   qryDetTipo.FieldByName('DESCRICAO').AsString:=qryTiposDocumento.FieldByName('DESCRICAO').AsString;
   qryDetTipo.FieldByName('CODTIPDOC').AsFloat:=qryTiposDocumento.FieldByName('CODTIPDOC').AsFloat;
   qryDetTipo.Post;
end;

procedure TfrmCadMontaFluxo.btnSubtraiTipDocClick(Sender: TObject);
begin
   inherited;
   if qryDetTipo.RecordCount = 0 Then
    begin
       MsgDlg('Não existe nenhum Tipo de Documento selecionado','Erro',mtError,[mbOk],0);
       exit;
    end;
   qryDetTipo.Delete;
   dbgTipoCalculoClick(nil);
end;


procedure TfrmCadMontaFluxo.bbtnVerificarClick(Sender: TObject);
var
   sTipoAux    : String;
   iModoAux    : Integer;
   bCancelado  : Boolean;
   bErro       : Boolean;
begin
   iModoAux:=0;
   bCancelado:=False;

   with TfrmVerificaFluxo.Create(Self) do
   try
      if (ShowModal = mrOk) and (iNumMarcados<>0) then
       begin
          sTipoAux:=sTipo;
          iModoAux:=rgModoInclusao.ItemIndex;

          qryDetAux.Close;
          qryDetAux.Open;

          qryTipoRecDes.First;
          while not(qryTipoRecDes.Eof) do
          begin
             if (qryTipoRecDes.FieldByName('SELECIONADO').AsString='S') Then
              begin
                 qryDetAux.Insert;
                 qryDetAux.FieldByName('RECPAG').AsString:=
                                       qryTipoRecDes.FieldByName('RECPAG').AsString;
                 qryDetAux.FieldByName('DESCRICAO').AsString:=
                                       qryTipoRecDes.FieldByName('DESCRICAO').AsString;
                 qryDetAux.FieldByName('CODTIPRECDES').AsString:=
                                       qryTipoRecDes.FieldByName('CODTIPRECDES').AsString;;
                 qryDetAux.Post;
                 Dec(iNumMarcados);
              end;

             if iNumMarcados=0 then Break;

             qryTipoRecDes.Next;
          end;
       end
      else
       bCancelado:=True;
   finally;
      Free;
   end;

   if bCancelado then Exit;

   if iModoAux=0 then
    begin
      //Tipos de Rec/Des em Nova Linha
      sbtnInserir.Click;
      if sTipoAux='R' then
         dbgTipoCalculo.ItemIndex:=0
      else
         dbgTipoCalculo.ItemIndex:=1;
     end
    else
     begin
        //Tipos de Rec/Des em Linha já existente
        bErro:=True;
        while bErro do
        begin
           sbtnProcurar.Click;
           if (MontaSelect.RetornouValor) then
            begin
               if ((qry.FieldByName('TIPOCALCULO').AsString='R') and (sTipoAux='R')) or
                  ((qry.FieldByName('TIPOCALCULO').AsString='P') and (sTipoAux='P')) then
                begin
                   bErro:=False;
                   bCancelado:=False;
                   sbtnAlterar.Click;
                end
               else
                begin
                   MsgDlg('Linha Incompatível com os tipos de Recebimento/Desembolso '+#10+#13+
                          'selecionados.','Erro',mtError,[mbOk],0);
                   bErro:=True;
                   bCancelado:=False;
                end;
            end
           else
            begin
               bErro:=False;
               bCancelado:=True;
            end;
        end;
     end;

    if not(bCancelado) then
     begin                         
          qryDetAux.First;
          while not(qryDetAux.Eof) do
          begin
             qryDetTipo.Insert;
             qryDetTipo.FieldByName('RECPAG').AsString:=
                                   qryDetAux.FieldByName('RECPAG').AsString;
             qryDetTipo.FieldByName('IDPESSOA').AsInteger:=Sistema.IdEmpresa;
             qryDetTipo.FieldByName('DESCRICAO').AsString:=
                                   qryDetAux.FieldByName('DESCRICAO').AsString;
             qryDetTipo.FieldByName('CODTIPRECDES').AsString:=
                                   qryDetAux.FieldByName('CODTIPRECDES').AsString;;
             qryDetTipo.Post;
             qryDetAux.Next;
          end;
     end;

   qryDetAux.Close;

end;

procedure TfrmCadMontaFluxo.GeraMapaFluxo;
var
   sLinhaFluxoAnt : String;
   rGrupoAnterior : Real;
   Grupo          : array [1..100] of TfcTreeNode;
   iIndice        : Integer;
   sRadical       : array [1..100] of String;
   mskedMascara   : TMaskEdit;
begin
   mskedMascara:=TMaskEdit.Create(Self);
   try
      qryMapaFluxo.Close;
      qryMapaFluxo.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
      qryMapaFluxo.Open;

      if qryMapaFluxo.IsEmpty then
       begin
          qryMapaFluxo.Close;
          Exit;
       end;

      qryMapaFluxo.First;

      TrvMapaFluxo.Visible:=False;
      TrvMapaFluxo.Items.Clear;

      while not(qryMapaFluxo.Eof) do
      begin
         //Inclui linha do Fluxo
         Grupo[1]:=TrvMapaFluxo.Items.Add(nil,qryMapaFluxo.FieldByName('LinhaFluxo').AsString);

         //Inclui linhas que compoem a linha do Fluxo
         sLinhaFluxoAnt:=qryMapaFluxo.FieldByName('LinhaFluxo').AsString;
         while (qryMapaFluxo.FieldByName('LinhaFluxo').AsString=sLinhaFluxoAnt) and
               not(qryMapaFluxo.Eof) do
         begin
            iIndice:=1;
            rGrupoAnterior:=qryMapaFluxo.FieldByName('Grupo').AsFloat;
            sRadical[iIndice]:=Trim(qryMapaFluxo.FieldByName('CODTIPRECDES').AsString);
            while ((rGrupoAnterior=qryMapaFluxo.FieldByName('Grupo').AsFloat) and
                   not(qryMapaFluxo.Eof))do
            begin
               case qryMapaFluxo.FieldByName('TIPOLINHA').AsInteger of
                  0: if Trim(qryMapaFluxo.FieldByName('TIPORECDES').AsString)<>'' then
                      begin
                         if Length(sRadical[iIndice])<
                            Length(Trim(qryMapaFluxo.FieldByName('CODTIPRECDES').AsString)) then
                          begin
                             Inc(iIndice);
                             sRadical[iIndice]:=Trim(qryMapaFluxo.FieldByName('CODTIPRECDES').AsString);
                          end;


                         if qryMapaFluxo.FieldByName('RECPAG').AsString='R' then
                            mskedMascara.EditMask:=sMascaraCAR+';0; '
                         else
                            mskedMascara.EditMask:=sMascaraCAP+';0; ';

                         mskedMascara.Text:=Trim(qryMapaFluxo.FieldByName('CODTIPRECDES').AsString);

                         if Trim(qryMapaFluxo.FieldByName('CODTIPRECDES').AsString)='' then
                            Grupo[iIndice+1]:=TrvMapaFluxo.Items.AddChild(Grupo[iIndice],
                                                 qryMapaFluxo.FieldByName('TIPORECDES').AsString)
                         else
                            Grupo[iIndice+1]:=TrvMapaFluxo.Items.AddChild(Grupo[iIndice],
                                                 mskedMascara.EditText+' - '+
                                                 qryMapaFluxo.FieldByName('TIPORECDES').AsString);
                      end;

                   1: Grupo[2]:=TrvMapaFluxo.Items.AddChild(Grupo[1],
                                   FormatFloat('#####',qryMapaFluxo.FieldByName('CODTIPDOC').AsFloat)+
                                   ' - '+qryMapaFluxo.FieldByName('TIPODOC').AsString);
               end;

               qryMapaFluxo.Next;
            end;
         end;
      end;
      //
      TrvMapaFluxo.Visible:=True;
      qryMapaFluxo.Close;
   finally
      mskedMascara.Free;
   end;
end;

end.
