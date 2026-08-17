// ***************************** REGISTRO DE ALTERAÇÕES ************************
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroInsert
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Verificar, antes do registro ser inserido, se o usuário em questão possui permissão para tal.
-------------------------------------------------------------------------------------------------- }

// *****************************************************************************
// Autor(a)   : Vinicius Eduardo Nascimento Maciel
// Rotina     : CmeCadastroFind e dbLcAtiv
// Data       : 20/09/2011
// SOL        : 163982
// KTN        : 1404974
// Alteração  : Foi alterado o combo Atividade/Projeto para que ele retorne
//              apenas as atividades ativas.
//------------------------------------------------------------------------------
// Autor(a)   : Marilza Colpani
// Rotina     : VerificaItem e CmeDetalheBeforeConfirma
// Data       : 18/06/2009
// SOL        : 137176
// KTN        : 834602
// Alteração  : Correção do erro de constraint.
//------------------------------------------------------------------------------
unit FMTCadReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook,uCmTypes,
  uCtrlReqMat, uCtrlAlmox, uCtrlUnidNegocio, uCtrlArtigo,
  uCtrlUnMedida, uCtrlMovEstoque, uCmSqlParams, uCtrlAlmoxCompra,uCtrlPadroes;

type
  TFrmMTCadReq = class(TFrmCadastroMestreDetMT)
    Label3: TLabel;
    edNumReq: TDBEdit;
    Label1: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    RgTipoMov: TDBRadioGroup;
    GrpDatas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edDataEmi: TCMDateTimePicker;
    edDataNec: TCMDateTimePicker;
    edAlmox: TEdit;
    lbALmox: TLabel;
    Label14: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    Label7: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label10: TLabel;
    edSaldo: TRealEdit;
    Label15: TLabel;
    DBMemo2: TDBMemo;
    Label6: TLabel;
    dblcDesc: TwwDBLookupCombo;
    Label9: TLabel;
    dbUn: TDBEdit;
    dblcUN: TwwDBLookupCombo;
    Label8: TLabel;
    edValUnit: TDBRealEdit;
    edValb: TRealEdit;
    edQtde: TDBRealEdit;
    Label12: TLabel;
    Label11: TLabel;
    cdsItem: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    cdsUnidNegoc: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    Label2: TLabel;
    edValTot: TRealEdit;
    Label13: TLabel;
    TabOBS: TTabSheet;
    DBMemo1: TDBMemo;
    dsArtigo: TwwDataSource;
    cdsUnMedida: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQtdeExit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure RgTipoMovClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dblcUNEnter(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
   ReqMat      : TCtrlReqMat;
   Almox       : TCtrlAlmox;
   UnidNegocio : TCtrlUnidNegocio;
   Artigo      : TCtrlArtigo;
   UnMedida    : TCtrlUnMedida;
   MovEstoque  : TCtrlMovEstoque;
   CtrlAlmoxCompra : TCtrlAlmoxCompra;
   cdsAux : TCMClientDataSet;  //Marilza Colpani - SOL 137176/KTN 834602
   Procedure Sel ( n : Double );
   Procedure SetArtigo;
   Procedure TrocaCaption;
   Procedure CalcValorTot;
   //Marilza Colpani - SOL 137176/KTN 834602
   //Função para verificar se o novo item a ser inserido na grid já existe.
   Function VerificaItem : Boolean;

  public
    bConfirmaItem: Boolean;
    procedure VerificaSitUsuario;
  end;

var
  FrmMTCadReq: TFrmMTCadReq;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro, FHistoricoItens;

procedure TFrmMTCadReq.FormCreate(Sender: TObject);
begin
  inherited;

  ReqMat := TCtrlReqMat.Create;
  ReqMat.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ReqMat.cds     := cds;
  ReqMat.cdsItem := cdsItem;

  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsArtigo.Data    := Artigo.ListArtigo(taVazio,True,'',tbAmbos);
  //VINICIUS MACIEL - SOL 163982 KTN 1404974
  //cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
  cdsUnidNegoc.Data := UnidNegocio.ListaAtividades(Sistema.IdEmpresa);
  ////VINICIUS MACIEL - SOL 163982 KTN 1404974 - FIM

  MontaSelect.Filtro.Add('REQMAT.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));
  MontaSelect.Filtro.Add('REQMAT.CODALMOXADESTINO = '+ IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('RTRIM(REQMAT.CODCENTROCUSTO) = '''+Trim(Modulo.sCodCCusto)+'''');

  CtrlAlmoxCompra:= TCtrlAlmoxCompra.Create;
  CtrlAlmoxCompra.InitializeAs(Padroes);
  Sel(-1);
  //Marilza Colpani - SOL 137176/KTN 834602
  cdsAux := TCMClientDataSet.Create(nil);
end;

procedure TFrmMTCadReq.Sel(n: Double);
begin
   cds.Data     := ReqMat.GetReqMat( n );
   cdsItem.Data := ReqMat.GetItemReqMat( n );
end;

procedure TFrmMTCadReq.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);

  //Thaise Amaral SOL:136124 KTN:812334
  VerificaSitUsuario;

  inherited;
  edValTot.Value := 0;

  cds.FieldByName('CUSTOTRANSF').asString       := 'C';
  cds.FieldByName('DATAEMISSAO').asDateTime     := Date;
  cds.FieldByName('DATANECESSIDADE').asDateTime := Date;
  cds.FieldbyName('CODALMOXADESTINO').asInteger  := Modulo.iCodAlmoxa;
  cds.FieldByName('IDUSUARIOINCLUSAO').asinteger := Sistema.IdUsuario;
  cds.FieldByName('IDPESSOA').asInteger          := Sistema.IdEmpresa;
  cds.FieldByName('IDEMPRESA').asInteger         := Sistema.IdEmpresa;
  cds.FieldByName('REQATENDIDA').asString        := 'F';
  cds.FieldByName('IMPRESSO').asString           := 'F';
  cds.FieldByName('CODCENTROCUSTO').AsString     :=  Modulo.sCodCCusto;
  If Trim(dblcAtiv.Text) = '' Then
     cds.FieldByName('UNIDNEGOC').asInteger      := Modulo.iUnidadeNegocPadrao;

  TrocaCaption;

  edDataEmi.Date := Date;
  edDataNec.Date := Date;
  dblcAlmox.SetFocus;
end;

procedure TFrmMTCadReq.CmeCadastroDelete(Sender: TObject);
begin
   cdsItem.First;
   While Not cdsItem.Eof Do cdsItem.Delete;

   inherited;
   edValTot.Value := 0;
end;

procedure TFrmMTCadReq.CmeDetalheInsert(Sender: TObject);
begin
  cdsAux.Data := cdsItem.Data; //Marilza Colpani - SOL 137176/KTN 834602
  inherited;
  dblcItem.SetFocus;
  edValb.Value  := 0;
  edSaldo.Value := 0;
  dbUn.Clear;
end;

procedure TFrmMTCadReq.CmeDetalheDelete(Sender: TObject);
begin
  If MsgDlg('Confirma a exclusão do item','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
     Begin
        inherited;
        CalcValorTot;
     End;
end;

procedure TFrmMTCadReq.SetArtigo;
begin
   edSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                         dblcItem.LookUpValue,
                                         Modulo.iCodAlmoxa,
                                         edDataEmi.Date);

  cdsItem.FieldByName('CODGRUPOPROD').AsString := cdsArtigo.FieldByName('CODGRUPOPROD').AsString;
end;

procedure TFrmMTCadReq.TrocaCaption;
begin
  Case RgTipoMov.ItemIndex Of
       0 : Begin
              lbAlmox.Caption := 'Almoxarifado Destino';
              edAlmox.Text    := Modulo.sAlmoxaUsuario;
              cdsAlmox.Data   := Almox.ListAlmoxxUsuario(Sistema.IdEmpresa,Sistema.IdUsuario,Modulo.iCodAlmoxa);
           End;
       1 : Begin
              lbAlmox.Caption := 'Centro de Custo Destino';
              edAlmox.Text    :=  Modulo.sDescCCusto;
              cdsAlmox.Data   := Almox.ListAlmoxxUsuario(Sistema.IdEmpresa,Sistema.IdUsuario);
           End;
    End;
end;

procedure TFrmMTCadReq.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItem.Text) <> '' Then
     Begin
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        dblcUN.Clear;   //Renan Cristiano SOL 136121 Kintana 812529.
        SetArtigo;
     End;
end;

procedure TFrmMTCadReq.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItem.Text) <> '' Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        dblcUN.Clear; //Renan Cristiano SOL 136121 Kintana 812529.
        SetArtigo;
     End;
end;

procedure TFrmMTCadReq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ReqMat.Free;
  Almox.Free;
  UnidNegocio.Free;
  Artigo.Free;
  UnMedida.Free;
  MovEstoque.Free;
  cdsAux.Free; //Marilza Colpani - SOL 137176/KTN 834602
  CtrlAlmoxCompra.Free;
end;

procedure TFrmMTCadReq.edQtdeExit(Sender: TObject);
Var
   rQtde : Double;
begin
  inherited;
  rQtde := UnMedida.QtdeToUnCustoMedio(dblcItem.LookupValue,
                                       dblcUn.LookUpValue,
                                       edQtde.Value );

  edValUnit.Value := Artigo.GetCustoMedio(dblcItem.LookupValue,Modulo.iCodCusteio);
  edValb.Value    := rQtde * edValUnit.Value;
  If edQtde.Value > 0 Then
     edValUnit.Value := edValb.Value / edQtde.Value;
end;

procedure TFrmMTCadReq.CmeDetalheConfirma(Sender: TObject);
begin
   If cdsItem.State in dsEditModes Then  //Marilza Colpani - SOL 137176/KTN 834602
      Begin
         If trim(dblcAlmox.Text) = '' Then
            Begin
               MsgDlg('Almoxarifado origem não foi preenchido','Erro',mtError,[mbOk],0);
               dblcAlmox.SetFocus;
            End
         Else
         If cdsItem.IsEmpty Then
             Begin
               MsgDlg('Não há itens cadastrado','Erro',mtError,[mbOK],0);
             End
         Else
         If edDataNec.Date < edDataEmi.Date Then
            Begin
               MsgDlg('Data de necessidade menor que a data de emissão','Erro',mtError,[mbOK],0);
               edDataNec.SetFocus;

             End
         Else 
            Begin     
                 If Cds.FieldByName('CUSTOTRANSF').asString  = 'T' Then
                    Cds.FieldByName('CODCENTROCUSTO').AsString :=  Modulo.sCCustoAlmoxa;

                 cdsItem.FieldByName('CODARTIGO').asString   := dblcItem.LookupValue;
                 cdsItem.FieldByName('QTDEPENDENTE').asFloat := edQtde.Value;
                 cdsItem.FieldByName('VALOR').asFloat        := edValb.Value;
                 cdsItem.FieldByName('DESCRICAO').asString   := dblcDesc.Text;
            end
            //End;
      End;

   inherited;
   CalcValorTot;
end;

procedure TFrmMTCadReq.RgTipoMovClick(Sender: TObject);
begin
  inherited;
  TrocaCaption;
end;

procedure TFrmMTCadReq.CalcValorTot;
Var
   Marca   : TBookmark;
   rValor  : Double;
   cEstado : Char;
begin
   Case cdsItem.State Of
      dsInsert : cEstado := 'I';
      dsEdit   : cEstado := 'E';
   Else
      cEstado := 'N';
   End;
   Marca  := cdsItem.GetBookmark;
   rValor := 0;
   cdsItem.DisableControls;
   Try
     cdsItem.Cancel;
     cdsItem.First;
     While Not cdsItem.Eof Do
        Begin
           rValor := rValor + (cdsItem.fieldByName('QTDEPEDIDA').AsFloat * cdsItem.fieldByName('VALORUN').asFloat);
           cdsItem.Next;
        End;
   Finally
      edValTot.Value := rValor;
      cdsItem.EnableControls;
      cdsItem.GotoBookmark(Marca);
      cdsItem.FreeBookmark(Marca);
      Case cEstado Of
         'I' : cdsItem.Append;
         'E' : cdsItem.Edit;
      End;
   End;
end;

procedure TFrmMTCadReq.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        Sel( StrToInt(MontaSelect.ValoresChave[0]) );
        TrocaCaption;
        CalcValorTot;
//Vinicius Maciel - SOL 163982 KTN 1404974
     if((dbLcAtiv.Text = '') and (dbLcAtiv.LookupValue <> '')) then
     dbLcAtiv.Text := UnidNegocio.recuperaAtividadePerd(dbLcAtiv.LookupValue)
//Vinicius Maciel - SOL 163982 KTN 1404974 - FIM
     End;
end;

procedure TFrmMTCadReq.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ReqMat.Gravar(edValTot.Value, CdsItem.FieldbyName('CODGRUPOPROD').AsString );
  If Accept Then
     MsgDlg(ReqMat.MessageInfo,'Informação',mtInformation,[mbOK],0);

end;

procedure TFrmMTCadReq.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ReqMat.Gravar(edValTot.Value, CdsItem.FieldbyName('CODGRUPOPROD').AsString );
end;

procedure TFrmMTCadReq.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ReqMat.Excluir;
end;

procedure TFrmMTCadReq.dblcUNEnter(Sender: TObject);
begin
  inherited;
  cdsUnMedida.Data := UnMedida.ListUnMedida(cdsArtigo.FieldByName('CODPRODUTO').AsString);
end;

procedure TFrmMTCadReq.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
  If ActiveControl.Tag <> 999 Then
     Begin
        If Trim(dblcAlmox.Text) = '' Then
          Begin
            MsgDlg('Almoxarifado Origem não preenchido','Erro',mtError,[mbOK],0);
            dblcAlmox.SetFocus;
          End;
     End;
end;

procedure TFrmMTCadReq.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If Trim(ReqMat.MessageInfo) <> '' Then
     MsgDlg(ReqMat.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMTCadReq.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := True;
  If RgTipoMov.ItemIndex = 1 then
     Begin
        If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,Modulo.sCodCCusto,Sistema.IdEmpresa)) Then
           Begin
              MsgDlg('Este Centro de Custo não pode requisitar este produto','Erro',mtError,[mbOk],0);
              dblcItem.SetFocus;
              Accept := False;
           End;
     End
  Else
     Begin
       If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,Modulo.sCCustoAlmoxa,Sistema.IdEmpresa )) Then
         Begin
            MsgDlg('Este Almoxarifado não pode requisitar este produto','Erro',mtError,[mbOk],0);
            dblcItem.SetFocus;
            Accept := False;
         End;
     End;
  If (CdsItem.state in dsEditModes) And (Modulo.SFlgReqSemSaldo = 'N') And (edSaldo.Value = 0) Then
       Begin
           MsgDlg('Almoxarifado não possui saldo. Proibído requisitar','Erro',mtError,[mbOK],0);
           dblcItem.SetFocus;
           Accept := False;
       End
  Else
  If trim(dblcItem.text) = '' Then
       Begin
           MsgDlg('Item não foi preenchida','Erro',mtError,[mbOK],0);
           dblcItem.SetFocus;
           Accept := False;
       End
  Else
  If trim(dblcUN.text) = '' Then
       Begin
           MsgDlg('Unidade não foi preenchida','Erro',mtError,[mbOK],0);
           dblcUN.SetFocus;
           Accept := False;
       End
  Else
  If edQtde.Value = 0 Then
       Begin
          MsgDlg('quantidade não foi preenchida','Erro',mtError,[mbOK],0);
          edQtde.SetFocus;
          Accept := False;
       End;
  //Marilza Colpani - SOL 137176/KTN 834602
  If cdsItem.State in dsEditModes Then
  begin
    if VerificaItem then
    begin
      MsgDlg('Item já existente na requisição','Informação', mtInformation,[mbOk],0);
      Accept := False;
      dblcItem.Clear;
      dblcDesc.Clear;
      dblcUN.Clear;
      edQtde.Clear;
      edValUnit.Clear;
      edValb.Clear;
    end;
  end;
end;
{
 -------------------------------------------------------------------------------
  Implementar no montaSelect para filtrar todos os Centro de custo e almoxarifados
  que o usuario logado tem acesso
 -------------------------------------------------------------------------------
 }
procedure TFrmMTCadReq.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Sel(cds.FieldByName('NUMREQUISICAO').AsFloat);
end;

function TFrmMTCadReq.VerificaItem: Boolean;
begin
  Result := False;
  If CmeDetalhe.Operacao = opInserir then
  while not cdsAux.Eof do
  begin
    if not cdsAux.Locate('CODARTIGO', cdsArtigo.fieldbyname('CODARTIGO').Value, []) then
    begin
      cdsAux.Next;
    end
    else
    begin
      Result := True;
      Break;
    end
  end;
end;

procedure TFrmMTCadReq.CmeDetalheEdit(Sender: TObject);
begin
  cdsAux.Data := cdsItem.Data;  //Marilza Colpani - SOL 137176/KTN 834602
  inherited;
end;

procedure TFrmMTCadReq.bbtnOkDetClick(Sender: TObject);
begin
  //Renan Cristiano SOL 136121 Kintana 812529 Inicio.
  if Trim(dblcUn.Text) = '' then
  begin
     MsgDlg('Unid. não informado!','Aviso',mtWarning,[mbOk],0);
     dblcUn.SetFocus;
     dblcUn.Clear;
     Exit;
  end;

  Application.CreateForm(TFrmHistoricoItens, FrmHistoricoItens);
  FrmHistoricoItens.ShowModal;

  if Not(bConfirmaItem) then
  begin
     edQtde.SetFocus;
     Exit;
  end;
  //Renan Cristiano SOL 136121 Kintana 812529 Fim.

  inherited;

end;


//Thaise Amaral SOL:136124 KTN:812334
procedure TFrmMTCadReq.VerificaSitUsuario;
begin
  {
    Antes de inserir, verificar: se o usuário está bloqueado.
    Se estiver, só poderá realizar o pedido até o dia útil estipulado em:
    Movimentação/Requisição de Material/Bloqueio de Usuários
    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
  }

  if Almox.UsuarioTemBloqueio(Sistema.IdUsuario) then
    if Almox.TemDiaUtil then
      if not Almox.VerificaDispRequisicao then
      begin
        Application.MessageBox(Pchar('Geração de requisições bloqueadas para o mês de '    + CtrlAlmoxCompra.MesAtualPorExtenso + #13#10 +
                                     'Novas requisições serão possíveis a partir do dia: ' + DateTimeToStr(Almox.DiaUtilProxMes)),
                                     Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
        bbtnCancelar.OnClick(Self);
        Abort;
      end;
end;

procedure TFrmMTCadReq.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //Thaise Amaral SOL:136124 KTN:812334:
  //Retirada herança, pois ocorreu erro ao cancelar o cadastro 2 vezes.
  
  //inherited;
end;

end.
