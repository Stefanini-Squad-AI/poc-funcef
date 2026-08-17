(*******************************************************************************
 08/01/99
  Alteração na exclusão do tipo de desembolso:
    DataSet not in Edit or Insert Mode e Stack Overflow
  Caso a máscara não possua analítico permitir cadastro de contas para o tipo de desembolso;
 17/03/1999 - 02.06.00
  Otmização - Troca do Treeview da Contabilidade Por Pesquisa Com Montaselect;
 19/03/1999 - 02.08.04
  Alteração dos Captions e Mensagens das Contas Contábeis.
 23/08/1999 - 02.13.00
  Inclusão da indicação do cáculo obrigatório do imposto para o tipo de recebimento,
  desembolso cadastrado
 11/10/1999
   Teste da alteração do tipo de desembolso/recebimento para analítico/sintético
   não permitindo a operação caso existam lançamentos para o tipo de desembolso
   específico;
 05/05/2000 - 2.20.02
   Inclusão da Gravação do Hsitórico Padrão Para Lançamentos Contábeis Associados
   Aop Tipo de Recebimento/Desembolso
 *******************************************************************************)

unit FCadTipoDesemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, wwQuery, uCmTypes,   
  Mask, wwdblook, wwdbedit, TB97, Tb97Tlbr, TB97Ctls, FTelaAut, MontaSelect,
  IvDictio, IvMulti, IvEMulti, CMProcuraMask, CMTree, CMDBLookupCombo,
  Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList;

type
  TfrmCadTipoDesemb = class(TfrmCadastroCS)
    Panel1: TPanel;
    LbLTipoDesemb: TLabel;
    pnlEdicao: TPanel;
    treeDesemb: TCMTreeView;
    QryAux: TwwQuery;
    SpbImportar: TToolbarButton97;
    qryCODTIPRECDES: TStringField;
    qryRECPAG: TStringField;
    qryIDPESSOA: TFloatField;
    qryPLACONTACREDITO: TStringField;
    qryPLANO: TFloatField;
    qryPLACONTA: TStringField;
    qryIDUSUARIOINCLUSAO: TFloatField;
    qryDESCRICAO: TStringField;
    qryANASINT: TStringField;
    qryFLGOBRIGARESERVA: TStringField;
    qryFLGCALCULAIMPOSTO: TStringField;
    QryTipoAvalia: TwwQuery;
    QryTipoAvaliaIDTIPOAVALIACAO: TFloatField;
    QryTipoAvaliaDESCTIPOAVALIACAO: TStringField;
    qryIDTIPOAVALIACAO: TFloatField;
    qryFLGINDICARECDES: TStringField;
    PageControl1: TPageControl;
    TbsGeral: TTabSheet;
    TbContabilizacao: TTabSheet;
    QryHistorico: TwwQuery;
    QryHistoricoHITCODHIST: TStringField;
    QryHistoricoIDPESSOA: TFloatField;
    QryHistoricoHITDESCR1: TStringField;
    qryHITCODHIST: TStringField;
    qryCODCORRESP: TStringField;
    qrySubConta: TwwQuery;
    qrySubContaCODSUBCONTA: TFloatField;
    qrySubContaNOMESUBCONTA: TStringField;
    qryCODSUBCONTA: TFloatField;
    qrySubContaCre: TwwQuery;
    qrySubContaCreNOMESUBCONTA: TStringField;
    qrySubContaCreCODSUBCONTA: TFloatField;
    qryCODSUBCONTACRE: TFloatField;
    ChkObrigaOrc: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    CkbEfet: TDBCheckBox;
    LblTipoAvalia: TLabel;
    CmbTipoAvalia: TCMDBLookupCombo;
    Label2: TLabel;
    dbedCod: TwwDBEdit;
    Label3: TLabel;
    dbedDescricao: TDBEdit;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    Label1: TLabel;
    CContabil1: TCMProcuraMaskContabil;
    CContabil2: TCMProcuraMaskContabil;
    CMDBLookupCombo1: TCMDBLookupCombo;
    Panel3: TPanel;
    Label5: TLabel;
    dblcSubContaCre: TwwDBLookupCombo;
    Panel2: TPanel;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    Bevel1: TBevel;
    QryTipoRdCorresp: TwwQuery;
    UpdTipoRdCorresp: TUpdateSQL;
    QryTipoRdCorrespIDTIPORDCORRESP: TFloatField;
    QryTipoRdCorrespCODTIPRECDES: TStringField;
    QryTipoRdCorrespRECPAG: TStringField;
    QryTipoRdCorrespIDPESSOA: TFloatField;
    QryTipoRdCorrespCODCORRESP: TStringField;
    Bevel2: TBevel;
    wwDBGrid1: TwwDBGrid;
    Bevel3: TBevel;
    DsTipoRdCorresp: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbedCodExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SpbImportarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure QryTipoRdCorrespAfterInsert(DataSet: TDataSet);
    procedure QryTipoRdCorrespBeforeDelete(DataSet: TDataSet);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    sSql, sOldCodTipoRecDes, sMascPict :String;
    iSoma, ind                         :Integer;
    lNivel                             :Array [0..20] of Integer;
    bMontandoArvore                    :Boolean;

  public
    { Public declarations }
    ObrigaTrdxCCxConta, ObrigaTrdxImposto :Boolean;
    CodTipRecDes                          :String;
    Function VerificaMascara(sMascara : String; var sMascPict : String;
                         var lNivel  : Array  of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
    Function CalcGrau(sNoAnterior : String;lNivel : Array of Integer;
                   ind : Integer;var sPai : String) : Integer;
  end;

var
  frmCadTipoDesemb: TfrmCadTipoDesemb;

implementation

uses USistema, UMensErro, UAutorizacao, DBaseDados, uIntegraBack, uString,
     FImpTipoDesemb, uDataBase, FTrdxCCxConta, fCadRecDesXAgreg;

{$R *.DFM}

Procedure TfrmCadTipoDesemb.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  If Trim(dbedDescricao.Text) = ''    then
  begin
     MsgDlg('Descrição não preenchida','Aviso',mtError,[mbOk],0);
     If dbedDescricao.CanFocus Then dbedDescricao.SetFocus;
     Accept := False
  end
  Else
   If (IntegraBack.Contabilidade = 'S') And
      ((CContabil1.Valida <> VcOk) Or
      (CContabil2.Valida <> VcOk)) Then
      Accept := False
   Else
      Accept := True;
End;

procedure TfrmCadTipoDesemb.FormCreate(Sender: TObject);
begin
  try
    if (IntegraBack.Contabilidade = 'S') then
    begin
      FazQuery(qrySubConta,
        'SELECT '+
          'NOMESUBCONTA, '+
          'CODSUBCONTA '+
        'FROM '+
          'SUBCONTA '+
        'WHERE '+
          '(IDPESSOA = '+IntToStr(Sistema.Idempresa)+') '+
        'ORDER BY NOMESUBCONTA');
    end;

    if (IntegraBack.Contabilidade = 'S') then
    begin
      FazQuery(qrySubContaCre,
        'SELECT '+
          'NOMESUBCONTA, '+
          'CODSUBCONTA '+
        'FROM '+
          'SUBCONTA '+
        'WHERE '+
          '(IDPESSOA = '+IntToStr(Sistema.Idempresa)+') '+
        'ORDER BY NOMESUBCONTA');
    end;

    ObrigaTrdxCCxConta := False;
    ObrigaTrdxImposto  := False;
    CodTipRecDes       := '';

    If QryHistorico.Active Then
      QryHistorico.Close;
    QryHistorico.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
    QryHistorico.Open;

    ChkObrigaOrc.Enabled := (IntegraBack.IntegraOrcamento = 'S');

    If IntegraBack.RecPag = 'R' Then
    Begin
      Caption := 'Cadastro de Tipo de Recebimento';
      LblTipoDesemb.Caption := 'Tipo de Recebimento';
      CContabil2.Caption := ' Conta Contábil ';
      CContabil1.Caption := ' Conta Débito ';
      CmbTipoAvalia.Visible := False;
      LblTipoAvalia.Visible := False;
      CkbEfet.Caption := 'Corresponde a Um Tipo de Recebimento Operacional';
    end
    Else
    Begin
      Caption:='Cadastro de Tipo de Desembolso';
      LblTipoDesemb.Caption:='Tipo de Desembolso';
      CContabil2.Caption := ' Conta Contábil ';
      CContabil1.Caption := ' Conta a Crédito ';
      QryTipoAvalia.Open;
    end;

    CContabil1.Plano := IntegraBack.Plano;
    CContabil1.Mascara := IntegraBack.MascaraPlano;
    CContabil1.Mensagens.Analitica := CContabil1.Caption + CContabil1.Mensagens.Analitica;
    CContabil1.Mensagens.Sintetica := CContabil1.Caption + CContabil1.Mensagens.Sintetica;
    CContabil1.Mensagens.NaoExiste := CContabil1.Caption + CContabil1.Mensagens.NaoExiste;
    CContabil1.Mensagens.EmBranco  := CContabil1.Caption + CContabil1.Mensagens.EmBranco;

    CContabil2.Plano := IntegraBack.Plano;
    CContabil2.Mascara := IntegraBack.MascaraPlano;
    CContabil2.Mensagens.Analitica := CContabil2.Caption + CContabil2.Mensagens.Analitica;
    CContabil2.Mensagens.Sintetica := CContabil2.Caption + CContabil2.Mensagens.Sintetica;
    CContabil2.Mensagens.NaoExiste := CContabil2.Caption + CContabil2.Mensagens.NaoExiste;
    CContabil2.Mensagens.EmBranco  := CContabil2.Caption + CContabil2.Mensagens.EmBranco;

    TbContabilizacao.Enabled :=  (IntegraBack.Contabilidade = 'S');

    sMascPict := '';

    if not VerificaMascara(IntegraBack.MascaraRecDes,sMascPict,lNivel,iSoma,ind) then
    begin
      MessageBeep(0);
      ShowMessage('Máscara Inválida');
      Close;
      Exit;
    end;

    sSql :=
      'SELECT '+
        'CODTIPRECDES, '+
        'RECPAG, '+
        'IDPESSOA, '+
        'PLACONTACREDITO, '+
        'PLANO, '+
        'PLACONTA, '+
        'IDUSUARIOINCLUSAO, '+
        'DESCRICAO, '+
        'ANASINT, '+
        'FLGOBRIGARESERVA, '+
        'FLGCALCULAIMPOSTO, '+
        'IDTIPOAVALIACAO, '+
        'FLGINDICARECDES, '+
        'HITCODHIST, '+
        'CODCORRESP, '+
        'CODSUBCONTA, '+
        'CODSUBCONTACRE '+
      'FROM '+
        'TIPORECEBDESEMB '+
      'WHERE '+
        '(RECPAG = '''+IntegraBack.RecPag+''''+') AND '+
        '(IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') '+
      'ORDER BY CODTIPRECDES';
    FazQuery(Qry, sSql);

    inherited;

    treeDesemb.mascara := IntegraBack.MascaraRecDes;
    bMontandoArvore := True;
    treeDesemb.MontaArvore;
    bMontandoArvore := False;

    Qry.FieldByName('CODTIPRECDES').EditMask := IntegraBack.MascaraRecDes + ';0; ';

    MontaSelect.Mascaras.Add(IntegraBack.MascaraRecDes + ';0; ');
    MontaSelect.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''' + IntegraBack.RecPag + '''');
    MontaSelect.Filtro.Add('TIPORECEBDESEMB.IDPESSOA =  ' + IntToStr(Sistema.IdEmpresa));

    FazQuery(DtmBaseDados.Qry,
      'SELECT '+
        'P.FLGTRDXCCXCONTA, '+
        'P.FLGTRDXIMPOSTOS '+
      'FROM '+
        'PARAMCAP P '+
      'WHERE '+
        'P.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
    ObrigaTrdxCCxConta  := (DtmBaseDados.Qry.FieldByName('FLGTRDXCCXCONTA').AsString = 'S');
    ObrigaTrdxImposto   := (DtmBaseDados.Qry.FieldByName('FLGTRDXIMPOSTOS').AsString = 'S');
  except
    raise;

  end;
end;

procedure TfrmCadTipoDesemb.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := Not Qry.IsEmpty;
end;

procedure TfrmCadTipoDesemb.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbedCod.Enabled := True;
   If dbedCod.CanFocus Then dbedCod.SetFocus;
   pnAnaSint.Enabled := True;
   QryRecPag.AsString := IntegraBack.RecPag;
   QryidPessoa.AsInteger := Sistema.idEmpresa;
   qryFLGINDICARECDES.Asstring := 'S';
end;

function TfrmCadTipoDesemb.VerificaMascara(sMascara : String; var sMascPict : String;
                         var lNivel  : Array  of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
var
  i         : Integer;
begin
  Result    := true;
  lNivel[0] := 1;
  iSoma     := 0;
  sMascPict := copy(sMascara,1,1);

  for i := 1 to Length(sMascara) do begin
     if i > 1
     then sMascPict := sMascPict + copy(sMascara,i,1);
     if copy(sMascara,i,1) ='.' then begin
        ind := ind + 1;
        lnivel[ind] := i - ind - iSoma;
        iSoma := iSoma + lNivel[ind];
     end;
  end;

  if (ind = 0) and (length(sMascara) > 0) then begin
      lnivel[1] := length(sMascara);
      ind := 1;
  end;

  if ind = 0 then
     Result := false;
  lNivel[ind+1] := Length(sMascara) - ind - iSoma;

end;

function  TfrmCadTipoDesemb.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                   ind: Integer; var sPai: String) : Integer;
var
   i    : Integer;
   iAux : Integer;
   sAux : String;
   lAux : Boolean;
begin
   iAux   := 0;
   Result := 0;
   sAux   := '';
   lAux   := false;
   for i:= 1 to ind+1 do
       begin
          inc(Result);
          iAux:=iAux+lNivel[i];
          if length(sNoAnterior)=iAux then
             begin
                lAux:=True;
                sPai := Copy(sNoAnterior,1,iAux-lNivel[i]);
                break;
             end;
       end;
       if not lAux then
          Result:=0;
end;

procedure TfrmCadTipoDesemb.dbedCodExit(Sender: TObject);
var
   iGrau    : Integer;
   lSair    : Boolean;
   lEnabled : Boolean;
   sPai     : String;
begin
  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
     try
        inherited;
        sPai                 := '';
        lEnabled             := True;
        lSair                := False;
        iGrau                := 0;
        if Trim((dbedCod.Text)) <> '' then begin
           iGrau:=CalcGrau(Trim(dbedCod.Text),lNivel,ind,sPai);
           if iGrau=0 then begin
              MessageBeep(0);
              ShowMessage('Máscara Inválida');
              lSair := true;
           end;
        end;
        if not lSair
        then begin
           // Verifica se o tipo de Desemb já está cadastrado
           sSQL := 'SELECT CODTIPRECDES,ANASINT FROM TIPORECEBDESEMB WHERE idPessoa = '+ IntToStr(Sistema.idEmpresa) +' AND RTRIM(CODTIPRECDES) = '''+
                    TRIM(dbEdCod.Text)+''' AND RECPAG = '''+ IntegraBack.RecPag + '''';
           FazQuery(qryAux,sSQL);

           if Not qryAux.IsEmpty then Begin
              MsgDlg('Tipo Desembolso já Cadastrado','Aviso',mtError,[mbOk],0);
              lSair := true;
           end;

           qryAux.Close;
        end;

        if (not lSair) and (iGrau > 1)
        then begin
           // Verifica se conta pai é sintética
           sSql := 'SELECT CODTIPRECDES,ANASINT FROM TIPORECEBDESEMB WHERE idPessoa = '+ IntToStr(Sistema.idEmpresa) +' AND '+
             ' RTRIM(CODTIPRECDES) = '''+trim(sPai)+''' AND RECPAG = '''+IntegraBack.RecPag+'''';

           if Not FazQuery(qryAux,sSQL)
           then begin // não tem pai
              MsgDlg('Não tem Pai','Aviso',mtError,[mbOk],0);
              lSair := true;
           end
           else begin
              if qryAux.FieldByName('ANASINT').AsString = 'A'
              then begin // pai é analítico
                 MsgDlg('Pai é analítico','Aviso',mtError,[mbOk],0);
                 lSair := true;
              end;
           end;
           qryAux.Close;
        end;

        if lSair then begin
           dbEdCod.Text := '';
           dbEdCod.EditText := '';
           Qry.FieldValues['CODTIPRECDES'] := '';
           If dbedCod.CanFocus Then dbedCod.SetFocus;
           exit;
        end;
        if ((iGrau = 1) and (ind+1 >1))
        then begin
           sbtnSintetico.Down  := True;
           Qry.FieldByName('ANASINT').AsString := 'S';
           lEnabled := false;
        end;
        if iGrau = ind+1
        then begin
           sbtnAnalitico.Down  := True;
           Qry.FieldByName('ANASINT').AsString := 'A';
           lEnabled := false;
        end;
        pnAnaSint.Enabled := lEnabled;
     except
         Raise;
     end;
end;

procedure TfrmCadTipoDesemb.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   treeDesemb.Enabled:= False;
   dbedCod.Enabled := False;
   pnAnaSint.Enabled := False;
   If dbedDescricao.CanFocus Then dbedDescricao.SetFocus;
end;

procedure TfrmCadTipoDesemb.CmeCadastroConfirma(Sender: TObject);
Var
  bObrigaTrdxCcxConta, bObrigaTrdxImposto :Boolean;
begin
  bObrigaTrdxCcxConta := False;
  bObrigaTrdxImposto  := False;

  If QryTipoRdCorresp.State In [DsEdit,DsInsert] Then
     QryTipoRdCorresp.Post;

  If CmeCadastro.Operacao in [opInserir, opAlterar] then
  Begin
    If sbtnAnalitico.Down    then
       Qry.FieldByName('ANASINT').AsString := 'A'
    else
       Qry.FieldByName('ANASINT').AsString := 'S';

    if IntegraBack.Contabilidade = 'S' then
       Qry.FieldByName('Plano').AsInteger := IntegraBack.Plano;

   bObrigaTrdxCcxConta :=  (qryPLACONTA.IsNull) And
                           (qryANASINT.ASsTring  = 'A') And
                           (ObrigaTrdxCCxConta) And
                           (CmeCadastro.Operacao = OpInserir);

   bObrigaTrdxImposto  :=  (qryANASINT.ASsTring  = 'A') And
                           (qryFLGCALCULAIMPOSTO.ASsTring  = 'S') And
                           (ObrigaTrdxImposto) And
                           (CmeCadastro.Operacao = OpInserir);

    If bObrigaTrdxCcxConta Or bObrigaTrdxImposto Then
        CodTipRecDes := qryCODTIPRECDES.AsString
    Else
        CodTipRecDes := '';
  End;

  Try
    //Inherited;
    Case CmeCadastro.Operacao Of
      opInserir, opAlterar: AplicaAlteracoes([Qry,QryTipoRdCorresp]);
      opApagar :
      Begin
         QryTipoRdCorresp.First;
         While Not QryTipoRdCorresp.Eof Do
            QryTipoRdCorresp.Delete;

         AplicaAlteracoes([QryTipoRdCorresp,Qry]);
      End;
    End;

    Inherited;

    If CodTipRecDes <> '' Then
    Begin
       If ObrigaTrdxCCxConta And bObrigaTrdxCcxConta Then
          AbrirFormModal(FrmTrdxCCxConta,TFrmTrdxCCxConta);

       If ObrigaTrdxImposto And bObrigaTrdxImposto Then
          AbrirFormModal(FrmCadRecDesXAgreg,TfrmCadRecDesXAgreg);
    End;

    CodTipRecDes := '';
  Except
    CodTipRecDes := '';
    Raise;
  End;
end;

procedure TfrmCadTipoDesemb.sbtnAnaliticoClick(Sender: TObject);
begin
  inherited;
  TbContabilizacao.Enabled := (IntegraBack.Contabilidade = 'S');
end;

procedure TfrmCadTipoDesemb.sbtnSinteticoClick(Sender: TObject);
begin
   inherited;
   Qry.FieldByName('PLACONTA').Clear;
   Qry.FieldByName('PLACONTACREDITO').Clear;
   TbContabilizacao.Enabled := False;
end;

procedure TfrmCadTipoDesemb.sbtnApagarClick(Sender: TObject);
begin

 If (Not QryAux.IsEmpty) And (QryAux.RecordCount > 1) Then  { Força a deleção das pastas analíticas uma a uma }
 Begin
    MsgDlg('Pasta(s) Analítica(s) terão que ser apagada(s) primeiro!','Erro',mtError,[mbOK],0);
    Exit;
 End;

 inherited;

 PnlFundo.Enabled := Not Qry.IsEmpty;
end;

procedure TfrmCadTipoDesemb.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If Not sbtnInserir.Down Then
  Begin
       treeDesemb.Enabled:= True;
       PnlFundo.Enabled := Not Qry.IsEmpty;
  End;
end;

procedure TfrmCadTipoDesemb.sbtnInserirClick(Sender: TObject);
begin
  PnlFundo.Enabled := False;
  treeDesemb.Enabled:= False;

  inherited;
end;

procedure TfrmCadTipoDesemb.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sOldCodTipoRecDes := QryCODTIPRECDES.AsString;
  PnlFundo.Enabled := False;
end;

procedure TfrmCadTipoDesemb.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  treeDesemb.Enabled:= True;
  PnlFundo.Enabled := Not Qry.IsEmpty;
  qry.First;
end;

procedure TfrmCadTipoDesemb.SpbImportarClick(Sender: TObject);
begin
  inherited;
  If Not Qry.Active Then Qry.Open;

  SpbImportar.Down := False;

  If Qry.IsEmpty Then
  Begin
     AbrirFormModal(FrmImpTipoDesemb, TFrmImpTipoDesemb);

     Qry.CLose;
     Qry.Open;

     If Not Qry.IsEmpty Then
     Begin
          bMontandoArvore := True;
          treeDesemb.MontaArvore;
          bMontandoArvore := False;
     End;

     PnlFundo.Enabled := Not Qry.IsEmpty;
  End
  Else
     Msgdlg('Já exitem Tipos de Desembolso cadastrados, impossível importar','Aviso',mterror,[mbOk],0);
end;

Procedure TfrmCadTipoDesemb.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If (MontaSelect.RetornouValor) Then
      Qry.Locate('CODTIPRECDES',Trim(MontaSelect.ValoresChave[0]),[]);
end;

procedure TfrmCadTipoDesemb.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  Qry.Close;
  Qry.Open;
End;

procedure TfrmCadTipoDesemb.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Not Qry.IsEmpty Then
  Begin
     If (Qry.FieldByName('ANASINT').AsString = 'A') Then
         sbtnAnalitico.Down := True
     Else
         sbtnSintetico.Down := True;

     With QryTipoRdCorresp Do
     Begin
        If Active Then Close;
        If Not Prepared Then Prepare;
        ParamByName('RECPAG').AsString := qryRECPAG.AsString;
        ParamByName('CODTIPRECDES').AsString := Trim(qryCODTIPRECDES.AsString);
        ParamByName('IDPESSOA').AsFloat := qryIDPESSOA.AsFloat ;
        Open;
     End;

     If (QryTipoRdCorresp.IsEmpty) And (Not qryCODCORRESP.IsNull) Then
     Begin
        QryTipoRdCorresp.Append;
        QryTipoRdCorrespCODCORRESP.AsString := qryCODCORRESP.AsString;
        QryTipoRdCorresp.Post;
        AplicaAlteracoes([QryTipoRdCorresp]);
     End;
  End;
end;

Procedure TfrmCadTipoDesemb.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  pnAnaSint.Enabled := bbtnConfirmar.Enabled;
  pnlEdicao.Enabled := True;
  TbContabilizacao.Enabled := (pnAnaSint.Enabled And (IntegraBack.Contabilidade = 'S'));
End;

procedure TfrmCadTipoDesemb.QryTipoRdCorrespAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QryTipoRdCorrespIDTIPORDCORRESP.AsInteger := LeultRegistro(nil,'TIPORDCORRESP');
  QryTipoRdCorrespCODTIPRECDES.AsString := QryCODTIPRECDES.AsString;
  QryTipoRdCorrespRECPAG.AsString := IntegraBack.RecPag;
  QryTipoRdCorrespIDPESSOA.AsFloat := Sistema.IdEmpresa;
end;

procedure TfrmCadTipoDesemb.QryTipoRdCorrespBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  If (Not Qry.IsEmpty) And
     (QryTipoRdCorrespCODCORRESP.AsString = qryCODCORRESP.AsString) Then
     qryCODCORRESP.Clear;
end;

end.
