{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Lançamento de Alteradores                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}
{-----------------------------------------------------------------------------------------
Pendência : 26058
Data      : 23.08.2007
Analista  : Marcus Oliveira
Descrição : Criado uma rotina para verificar se o usuário tem permissão de estornar um alterador.
{-----------------------------------------------------------------------------------------
Pendência : 18886
Data      : 27.01.2006
Analista  : Antonio Marcos Fernandes de Souza (amf)
Descrição : Adicionada a observação do Alterador Selecionado.
------------------------------------------------------------------------------------------
Pendência: 15369    -- retirado por FDias 19.07.2004
Data     : 24/05/2004
Analista : André Tavares
Descrição: Adaptar a query SqlContabilizacao para utilizar o filtro idplancentcust (DE-PARA)
------------------------------------------------------------------------------------------
Pendência: 15792
Data     : 30/12/2003
Analista : Alex Pereira
Descrição: Retirar a possibilidade de lançar Atividade/Projeto para o Alterador.
           O lookup foi mantido, mas invisível, para o caso de precisar
           habilitá-lo novamente no futuro.
-----------------------------------------------------------------------------------------}


unit fLancAlteradoresMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, wwdblook, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, uCtrlLancAlteradores, uCmTypes,
  uCtrlDocumento, uCtrlFinanc,
  //amf 18886 27.01.2006
  uCtrlTipoAlterador;

type
  TFrmLancAlteradores = class(TFrmCadastroMT)
    Sql: TCMSqlParams;
    GpDocumento: TGroupBox;
    Label3: TLabel;
    LblForne: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    BtnSeleciona: TBitBtn;
    MsDoc: TMontaSelect;
    SqlCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    SqlUnidNegocio: TCMSqlParams;
    CdsUnidNegocio: TCMClientDataSet;
    SqlAlteradores: TCMSqlParams;
    CdsAlteradores: TCMClientDataSet;
    sbtnEstornar: TToolbarButton97;
    SqlContabilizacao: TCMSqlParams;
    CdsContabillizacao: TCMClientDataSet;
    DsContabilizacao: TwwDataSource;
    PnlContab: TPanel;
    LblContabilizacao: TLabel;
    GrdContabilizacao: TwwDBGrid;
    CdsDel: TCMClientDataSet;
    PnlDadosAlterador: TPanel;
    lblAlterador: TLabel;
    lblValOut: TLabel;
    lblValor: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    lblUnidNegoc: TLabel;
    EdtHist: TDBEdit;
    DtLancto: TCMDateTimePicker;
    DbROutraMoeda: TDBRealEdit;
    DbrValor: TDBRealEdit;
    dblkAlterador: TwwDBLookupCombo;
    DbrValLiquido: TDBRealEdit;
    dblcUnidNegoc: TwwDBLookupCombo;
    CkbContabiliza: TCheckBox;
    SqlAuxDocs: TCMSqlParams;
    CdsAuxDocs: TCMClientDataSet;
    Label6: TLabel;
    mmObsAlt: TMemo;
    sqlPodeEstornar: TCMSqlParams;
    cdsPodeEstornar: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dblkAlteradorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure DbrValorExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblkAlteradorChange(Sender: TObject);
  private
    _LancAlteradores: TCtrlLancAlteradores;
    _Documento: TCtrlDocumento;

    //David - Pendência 25536
    CtrlFinanc: TCtrlFinanc;

    //Marcus Oliveira P.26058 controlar a permissão ao Estorno pelo SAD
    bPodeEstornar : boolean;

    bReopenCds: Boolean;
    bEstorno: Boolean;
    _iCodDocumento: Integer;
    //amf 18886 27.01.2006
    CtrlTipoAlterador: TCtrlTipoAlterador;
    procedure SelAlterador(iCodDocumento, iNumLancto: Integer);
    procedure BuscaCentroDeCusto(sPlaconta: String);
    function VerificaDocBaixado(iCodDocumento: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancAlteradores: TFrmLancAlteradores;

implementation

{$R *.DFM}

Uses uSistema, uCtrlParamIntegra, uMensErro, uCtrlPadroes, uModulo, JclMath;


procedure TFrmLancAlteradores.FormCreate(Sender: TObject);
begin
  inherited;


  //O Tag da aplicação é alterado quando a tela é utilizada para alteração de saldo.
  //Nesse caso o tag da ser alterado aplicação tem o valor do CODDOCUMENTO a
  bEstorno := False;

  //Marcus Oliveira P.26058 23/08/2007 Se o usuario tiver acesso ao botão estornar tras 1 registro
  sqlPodeEstornar.Prepare;
  sqlPodeEstornar.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  sqlPodeEstornar.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
  sqlPodeEstornar.Open;

  bPodeEstornar := ( cdsPodeEstornar.RecordCount > 0 );

  //Marcus Oliveira P.26058 23/08/2007 Fim  

  //Cria a Classe de Controle
  _LancAlteradores := TCtrlLancAlteradores.Create;
  _LancAlteradores.InitializeAs(Padroes);
  _LancAlteradores.CdsLancAlteradores := Cds;

  _Documento := TCtrlDocumento.Create;;
  _Documento.InitializeAs(Padroes);


  //David - Pendência 25536
  CtrlFinanc := TCtrlFinanc.Create( Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.UsaPlanoPatro );
  CtrlFinanc.InitializeAs(Padroes);

  //amf 18886 27.01.2006
  CtrlTipoAlterador := TCtrlTipoAlterador.Create;
  CtrlTipoAlterador.InitializeAs(Padroes);

  //Seta parâmetros e configurações da tela de acordo com a integração contábil
  //e o sistema de origem do lançamento
  CkbContabiliza.enabled := ParamIntegra.IntegraContab;
  CkbContabiliza.checked := not CkbContabiliza.enabled;

  PnlContab.Visible := ParamIntegra.IntegraContab;

  If Not ParamIntegra.IntegraContab Then  Height := 360;

  If ParamIntegra.RecPag = 'R' Then
     LblForne.Caption := 'Cliente'
  Else
     LblForne.Caption := 'Fornecedor';

  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''');

  MsDoc.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MsDoc.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''');

  //Abre os ClientDataSet´s da tela
  SelAlterador(0,0);

  SqlUnidNegocio.Prepare;
  SqlUnidNegocio.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlUnidNegocio.Open;

  SqlAlteradores.Prepare;
  SqlAlteradores.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlAlteradores.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlAlteradores.Open;

  If (Application.Tag <> 0) Then
  Begin
     Height := 360;
     _iCodDocumento := Application.Tag;
     Application.Tag := 0;
     Dock972.Visible := False;
     BtnSeleciona.Enabled := False;
     PnlContab.Visible := False;
     sbtnInserir.Click;
     CmeCadastro.RepetirInsert := False;

     SqlAuxDocs.Prepare;
     SqlAuxDocs.ParamByName('CODDOCUMENTO').AsInteger := _iCodDocumento;
     SqlAuxDocs.Open;

     if CkbContabiliza.enabled And
        ((Trim(CdsAuxDocs.FieldByName('OPERACAO').AsString) = '3' ) or (Trim(CdsAuxDocs.FieldByName('OPERACAO').AsString) = '13')) then
        CkbContabiliza.checked := false;

     Cds.FieldByName('CODDOCUMENTO').AsInteger := CdsAuxDocs.FieldByName('CODDOCUMENTO').AsInteger;
     Cds.FieldByName('DATAPROGRAMADA').AsDateTime :=  CdsAuxDocs.FieldByName('DATAPROGRAMADA').AsDateTime;
     Cds.FieldByName('DOCCOMPL').AsString :=  CdsAuxDocs.FieldByName('NODOCUMENTO').AsString + '  ' + CdsAuxDocs.FieldByName('COMPLDOCUMENTO').AsString;
     Cds.FieldByName('RAZAOSOCIAL').AsString :=  CdsAuxDocs.FieldByName('RAZAOSOCIAL').AsString;
     Cds.FieldByName('PLACONTA').AsString :=  CdsAuxDocs.FieldByName('PLACONTA').AsString;

     If (Trim(CdsAuxDocs.FieldByName('CODCENTROCUSTO').AsString) = '') Then
        BuscaCentroDeCusto(Cds.FieldByName('PLACONTA').AsString)
     Else
     begin
        Cds.FieldByName('CODCENTROCUSTO').AsString := CdsAuxDocs.FieldByName('CODCENTROCUSTO').AsString;
        Cds.FieldByName('CODEXTERNO').AsString := CdsAuxDocs.FieldByName('CODEXTERNO').AsString;
     end;

     If (Trim(CdsAuxDocs.FieldByName('CODSUBCONTA').AsString) = '') Then
        Cds.FieldByName('CODSUBCONTA').AsInteger := 0
     Else
        Cds.FieldByName('CODSUBCONTA').AsString := CdsAuxDocs.FieldByName('CODSUBCONTA').AsString;

     CdsAuxDocs.Close;
  End
  Else
     _iCodDocumento := 0;


// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30011;
    bbtnAjuda.HelpContext := 30011;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TFrmLancAlteradores.SelAlterador(iCodDocumento, iNumLancto: Integer);
begin
  //Abre a query principal e caso o sistema estaja itegrado com a contabilidade
  //busca os lançamentos contábeis do alterador
  With Sql Do
  Begin
    Cds.Close;

    Prepare;
    ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
    ParamByName('NUMLANCTO').AsInteger := iNumLancto;
    ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
    Open;

    If ParamIntegra.integraContab Then
    Begin
      SqlContabilizacao.Prepare;
      SqlContabilizacao.ParamByName('PLNCODIGO').AsInteger := Cds.FieldByName('PLNCODIGO').AsInteger;
      SqlContabilizacao.Open;
    End;

    CkbContabiliza.checked := (Not Cds.IsEmpty) And (Cds.FieldByName('PLNCODIGO').AsInteger = 0);
  End;
end;


procedure TFrmLancAlteradores.BtnSelecionaClick(Sender: TObject);
begin
  inherited;
  //Seleciona o documento para lançamento do alterador
  If (MsDoc.Executar = MrOk) And MsDoc.RetornouValor And
     VerificaDocBaixado( StrToInt(MsDoc.ValoresChave[0]) ) Then
  Begin
    Cds.FieldByName('CODDOCUMENTO').AsInteger := StrToInt(MsDoc.ValoresChave[0]);
    Cds.FieldByName('DATAPROGRAMADA').AsDateTime :=  StrToDate(MsDoc.ValoresChave[1]);
    Cds.FieldByName('DOCCOMPL').AsString :=  MsDoc.ValoresChave[2] + '  ' + MsDoc.ValoresChave[3];
    Cds.FieldByName('RAZAOSOCIAL').AsString :=  MsDoc.ValoresChave[4];
    Cds.FieldByName('PLACONTA').AsString :=  MsDoc.ValoresChave[5];

    if CkbContabiliza.enabled And
       ((Trim(MsDoc.ValoresChave[9]) = '3' ) or (Trim(MsDoc.ValoresChave[9]) = '13' )) then
       CkbContabiliza.checked := false;

    If (Trim(MsDoc.ValoresChave[6]) = '') Then
       BuscaCentroDeCusto(Cds.FieldByName('PLACONTA').AsString)
    Else
    begin
       Cds.FieldByName('CODCENTROCUSTO').AsString := MsDoc.ValoresChave[6];
       Cds.FieldByName('CODEXTERNO').AsString := MsDoc.ValoresChave[11];
    end;

    If (Trim(MsDoc.ValoresChave[7]) = '') Then
       Cds.FieldByName('CODSUBCONTA').AsInteger := 0
    Else
       Cds.FieldByName('CODSUBCONTA').AsString := MsDoc.ValoresChave[7];
  End;
end;

Procedure TFrmLancAlteradores.BuscaCentroDeCusto(sPlaconta:String);
Begin
  Inherited;
  //Busca o centro de custo associado a contacontábil do alterador
  SqlCentroCusto.Prepare;
  SqlCentroCusto.ParamByName('PLACONTA').AsString  := sPlaconta;
  SqlCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.idEmpresa;
  SqlCentroCusto.ParamByName('PLANO').AsInteger := ParamIntegra.Plano;
  SqlCentroCusto.Open;

  If CdsCentroCusto.IsEmpty Then
  begin
     Cds.FieldByName('CODCENTROCUSTO').AsInteger :=  -1;
     Cds.FieldByName('CODEXTERNO').AsInteger :=  -1;
  end
  Else
  begin
     Cds.FieldByName('CODCENTROCUSTO').AsInteger := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsInteger;
     Cds.FieldByName('CODEXTERNO').AsString      := CdsCentroCusto.FieldByName('CODEXTERNO').AsString;
  end;

  CdsCentroCusto.Close;
End;


procedure TFrmLancAlteradores.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  BuscaCentroDeCusto(Cds.FieldByName('PLACONTA').AsString);
end;

procedure TFrmLancAlteradores.CmeCadastroInsert(Sender: TObject);
begin
  bReopenCds := False;

  SelAlterador(0,0);

  inherited;

  DtLancto.Date := Date;
  GpDocumento.Enabled := True;

  If _iCodDocumento = 0 Then BtnSeleciona.Click;
end;

procedure TFrmLancAlteradores.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  GpDocumento.Enabled := False;
end;

procedure TFrmLancAlteradores.dblkAlteradorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  DbROutraMoeda.Enabled := ((dblkAlterador.Text <> '') And (CdsAlteradores.FieldByName('CONVERTE').AsString = 'S'));

  Cds.FieldByName('DEBCRE').AsString := CdsAlteradores.FieldByName('ACRESDECRES').AsString;
end;

procedure TFrmLancAlteradores.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

    If CmeCadastro.Operacao = opAlterar Then
    begin
      sbtnEstornar.enabled := false;
      sbtnApagar.enabled := false;
    end
    else
    begin
      sbtnEstornar.enabled:= (sbtnAlterar.enabled and ParamIntegra.IntegraContab) ;
      sbtnApagar.enabled:= ((not ((ParamIntegra.IntegraContab) and (ParamIntegra.EstornaContab))) and (sbtnAlterar.enabled));
    end;

    //David - Pendência 25536
    if sbtnAlterar.Enabled then
    begin
      // Rodolpho da Silva - P: 25536 - 09/08/2007
      if _LancAlteradores.ValidaTesteDispFinanc(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
         sbtnAlterar.Enabled  := CtrlFinanc.TestaDispFinanc( Sistema.IdEmpresa, Sistema.IdUsuario, trunc( Cds.FieldByName('DATADOC').AsDateTime ) )
      else
         sbtnAlterar.Enabled := true;

      sbtnApagar.Enabled   := sbtnAlterar.Enabled;
      sbtnEstornar.Enabled := sbtnAlterar.Enabled;
    end;

    //Marcus Oliveira P.26058 23/08/2007 Se não tem permissão desabilita botão estornar. 
    if not bPodeEstornar then
       sbtnEstornar.Enabled := False;    

end;

procedure TFrmLancAlteradores.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  bReopenCds := False;

  If MontaSelect.RetornouValor Then
  Begin
     SelAlterador(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));

     CdsDel.Data := Cds.Data;

     bEstorno := (Trim(MontaSelect.ValoresChave[2]) <> '');
  End;
end;

procedure TFrmLancAlteradores.DbrValorExit(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao in [OpInserir,OpAlterar]) Then
     Cds.FieldByName('VLRLIQUIDO').AsFloat := Cds.FieldByName('VALOR').AsFloat;
end;

procedure TFrmLancAlteradores.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  try
    if (_iCodDocumento <= 0) And
       sbtninserir.Enabled And
       (StrToDate(msdoc.ValoresChave[10]) > DtLancto.Date) then
    begin
      MsgDlg('Data do Alterador não pode ser menor que a data do lançamento do documento', 'Atenção',  mtWarning, [mbOk], 0);
      If DtLancto.Canfocus Then DtLancto.SetFocus;
      Accept := False;
    end;
  except
     MsgDlg('Favor selecionar o Documento', 'Atenção', mtWarning, [mbOk], 0);
     BtnSeleciona.SetFocus;
     Accept := False;
  end;

  if Accept And
     (Trim(dblkAlterador.Text) = '') then
  begin
     MsgDlg('Obrigatório preencher o Alterador', 'Atenção', mtWarning, [mbOk], 0);
     If dblkAlterador.CanFocus Then dblkAlterador.SetFocus;
     Accept := False;
  end;
end;

procedure TFrmLancAlteradores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //amf 18886 27.01.2006
  FreeAndNil(CtrlTipoAlterador);

  //David - Pendência 25536
  FreeAndNil(CtrlFinanc);

  inherited;
  _LancAlteradores.Free;
  _Documento.Free;
end;

procedure TFrmLancAlteradores.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
Var
  iFator: Integer;
begin
  inherited;

  Try
     If CmeCadastro.Operacao = opApagar Then
        _LancAlteradores.CdsLancAlteradores := CdsDel
     Else
        _LancAlteradores.CdsLancAlteradores := Cds;


     // Rodolpho da Silva - P: 22670 - 21/06/2006
     if CtrlTipoAlterador.ExisteLancIRRF(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
     begin
       _LancAlteradores.MessageInfo := 'Este documento não pode ser alterado ou excluído, pois há um documento de imposto do INSS lançado relacionado a este.';
       Accept := False;
       Exit;
     end;


     Accept := _LancAlteradores.ProcessaLancAlteradores(CmeCadastro.Operacao, Sistema.IdUsuario,
               Sistema.IdEmpresa, Sistema.IdModulo, ParamIntegra.Plano, Sistema.UsaPlanoPatro,
               Not CkbContabiliza.Checked, ParamIntegra.PartidaDobrada);

     bReopenCds := (Accept And (CmeCadastro.Operacao <> opInserir));

     If Accept And (_iCodDocumento > 0) Then
     Begin
        _iCodDocumento := -1;

        If (CdsAlteradores.FieldByName('ACRESDECRES').AsString = 'D') Then
        Begin
           If ParamIntegra.RecPag = 'P' Then
              iFator := -1
           Else
              iFator := 1;
        End
        Else
        Begin
           If ParamIntegra.RecPag = 'P' Then
              iFator := 1
           Else
              iFator := -1;
        End;

        Application.Tag := Trunc(Cds.FieldByName('VALOR').AsFloat * 100) * iFator;
     End;
  finally
     _LancAlteradores.CdsLancAlteradores := Cds;
  End;
  
end;

procedure TFrmLancAlteradores.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If OrigemAbortConfirma in [OaApplyInsert, OaApplyDelete, OaApplyEdit] Then
     MsgDlg(_LancAlteradores.MessageInfo,'Atenção',mtWarning,[mbOk],0);
end;

procedure TFrmLancAlteradores.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If bReopenCds Then
     SelAlterador(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
end;

procedure TFrmLancAlteradores.sbtnEstornarClick(Sender: TObject);
begin
  If VerificaDocBaixado(Cds.FieldByName('CODDOCUMENTO').AsInteger) Then
  Begin
     inherited;

     If Not Cds.IsEmpty Then
        If _Documento.Estornar(Cds.FieldByName('DATALANCTO').AsDateTime,
                                   Sistema.IdModulo,
                                   Sistema.IdEmpresa,
                                   Sistema.IdUsuario,
                                   Cds.FieldByName('CODDOCUMENTO').AsInteger,
                                   Cds.FieldByName('NUMLANCTO').AsInteger,
                                   ParamIntegra.Plano,
                                   Sistema.UsaPlanoPatro,
                                   oeDialogProcessa) Then
        Begin
           MsgDlg('Alterador estornado com sucesso', 'Atenção',  mtInformation, [mbOk], 0);
           bEstorno := True;
        End
        Else
        Begin
           MsgDlg(_Documento.MessageInfo,'Atenção',mtWarning,[mbOk],0);
           bEstorno := True;
        End;

     SelAlterador(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
  End;
end;

procedure TFrmLancAlteradores.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  If _iCodDocumento = -1 Then ModalResult := MrOk;
end;

procedure TFrmLancAlteradores.sbtnApagarClick(Sender: TObject);
begin
  If VerificaDocBaixado(Cds.FieldByName('CODDOCUMENTO').AsInteger) Then inherited;
end;

procedure TFrmLancAlteradores.sbtnAlterarClick(Sender: TObject);
begin
  If VerificaDocBaixado(Cds.FieldByName('CODDOCUMENTO').AsInteger) Then inherited;
end;

function TFrmLancAlteradores.VerificaDocBaixado(iCodDocumento: Integer): Boolean;
begin
  If Not Modulo.ModificaAlteradoresDocBaixados Then
  Begin
     _Documento.Saldo.CalculaSaldo( iCodDocumento );
     Result := ( Not IsFloatZero( _Documento.Saldo.Valor ) );

     If Not Result Then
        MsgDlg('Não é possivel lançar, alterar, excluir ou estornar alteradores para Documentos já baixados.', 'Atenção', mtError, [ mbOk ], 0 );
  End
  Else
    Result := True;
end;

procedure TFrmLancAlteradores.dblkAlteradorChange(Sender: TObject);
var
   cdsAux: TClientDataSet;
begin
  inherited;
  //amf 18886 27.01.2006
  mmObsAlt.Lines.Text := '';
  cdsAux := TClientDataSet.Create(nil);
  if Trim(dblkAlterador.LookUpValue) <> '' then
  begin
     cdsAux.Data := CtrlTipoalterador.listTipoalterador(0,'',StrToFloat(dblkAlterador.LookUpValue));
     mmObsAlt.Lines.Text := cdsAux.FieldByName('OBSERVACAO').AsString;
  end;
  FreeAndNil(cdsAux);
end;

end.
