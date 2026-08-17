unit FCadDARMMT;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : DBedtVlrJurosExit e InsereAlterador
Data      : 13/03/2008
Autor     : Bruno Bastos
Pendência : 27586
Descrição : Inicializar a variável Result da função e gravar campo DebCre com o valor do parâmetro
            recebido.
----------------------------------------------------------------------------------------------------

  André Pontes - 18/04/2007

  De acordo com Darcy, é preciso manter as datas de disponibilidade e programada originais do
  documento, lançando apenas alteradores.

  Dessa forma, foi retirado todo o código de alteração do documento, que tanta dor-de-cabeça me
  causou...

----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 22/03/2007 a
Autor     : André Pontes
Pendência : 22523 e 22700
Descrição : Criado novo form para alteração de DARM.
            Nova definição não permite mais inserção de DARM manual. Para isso, devem ser inseridos,
            manualmente, registros na LancIRRF, na tela apropriada.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  uCmSQLParams, uCtrlGeraDARM, uCtrlGeraGPS, dBaseDados, uSistema, uCtrlUtil, uCtrlDARF,
  uCtrlParamIntegra, uMensErro, uCMMath, ComCtrls, uCMTypes, DBCtrls;

type
  TfrmCadDARMMT = class(TFrmCadastroMT)
    cdsDocumento: TCMClientDataSet;
    cdsRateioDocum: TCMClientDataSet;
    cdsLanctoDocum: TCMClientDataSet;
    GroupBox1: TGroupBox;
    lblEmissao: TLabel;
    DBedtDataEmissao: TCMDateTimePicker;
    Label8: TLabel;
    DBedtVencimento: TCMDateTimePicker;
    Label9: TLabel;
    Label5: TLabel;
    edtDataProgrOri: TCMDateTimePicker;
    edtDataDispOri: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    DBedtVlrJuros: TDBRealEdit;
    DBedtVlrMulta: TDBRealEdit;
    Label1: TLabel;
    Label6: TLabel;
    DBedtVlrDesconto: TDBRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBedtDataProgramada: TCMDateTimePicker;
    DBedtDataDisp: TCMDateTimePicker;
    Label7: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    Label14: TLabel;
    edtVlrJurosOri: TDBRealEdit;
    edtVlrMultaOri: TDBRealEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtVlrDescontoOri: TDBRealEdit;
    cdsCCBaixaXDocum: TCMClientDataSet;
    DBedtCodDocumento: TDBEdit;
    DBedtNomeFavorecido: TDBEdit;
    DBedtNumDocumento: TDBEdit;
    DBedtVlrISS: TDBRealEdit;
    Label17: TLabel;
    cdsLancAux: TCMClientDataSet;
    Label13: TLabel;
    DBedtVlrDARM: TDBRealEdit;
    edtVlrTotalOri: TDBRealEdit;

    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure DBedtVlrJurosExit(Sender: TObject);


  private // Private declarations

    CtrlGeraDARM        : TCtrlGeraDARM;
    CtrlGeraGPS         : TCtrlGeraGPS;
    CtrlUtil            : TCtrlUtil;
    CtrlDARF            : TCtrlDARF;

    CodDocumento        : Integer;

    // ---------------------------------------------------------------------------------------------

    function  VerificaPreenchimento: Boolean;

    procedure PreencheDadosOriginais;

    // ---------------------------------------------------------------------------------------------

    procedure ProcessaGUIA;
    procedure ExcluiGUIA;

    // ---------------------------------------------------------------------------------------------

    function  AlteradorJuros: Boolean;
    function  AlteradorMulta: Boolean;
    function  AlteradorDesconto: Boolean;

    function  ProcessaAlterador(const psNomeCampoLanc  : String;
                                const psNomeCampoValor : String;
                                const psNomeCampoAlt   : String;
                                const psHistAlterador  : String;
                                const psDebCre         : String
                               ): Boolean;

    function  InsereAlterador(const psNomeCampoLanc  : String;
                              const psNomeCampoValor : String;
                              const fVlrLancto       : Currency;
                              const psNomeCampoAlt   : String;
                              const psHistAlterador  : String;
                              const psDebCre         : String
                             ): Boolean;

    function  ExcluiAlterador(const psNomeCampoLanc   : String;
                              const psNomeCampoValor  : String
                             ): Boolean;

    // ---------------------------------------------------------------------------------------------

  public  // Public declarations


  end;



var
  frmCadDARMMT: TfrmCadDARMMT;



implementation
{$R *.DFM}
uses
  dLookIRRF, uVerificaPreenchimento;




procedure TfrmCadDARMMT.CmeCadastroFind(Sender: TObject);
var
  CodDocumento  : Integer;
  IDDocISS      : Integer;
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    Repaint;

    CodDocumento  := StrToInt(MontaSelect.ValoresChave[1]);
    IDDocISS      := StrToInt(MontaSelect.ValoresChave[0]);

    cds.Data      := CtrlGeraDARM.BuscaGuia(CodDocumento, IDDocISS);

    // preenche os controles que precisam manter os valores originais mas não podem ser alterados
    PreencheDadosOriginais;

    // preenche dados do documento buscado
    cdsDocumento.Data       := CtrlUtil.DadosDocumento(CodDocumento);
    cdsLanctoDocum.Data     := CtrlUtil.DadosLanctoDocum(CodDocumento);
    cdsRateioDocum.Data     := CtrlUtil.DadosRateioDocum(CodDocumento);
    cdsCCBaixaXDocum.Data   := CtrlUtil.DadosCCBaixaXDocum(CodDocumento);
  end;
end;



procedure TfrmCadDARMMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlGeraDARM  := TCtrlGeraDARM.Create;
  CtrlGeraGPS   := TCtrlGeraGPS.Create;
  CtrlDARF      := TCtrlDARF.Create;
  CtrlUtil      := TCtrlUtil.Create;

  CtrlGeraDARM.Initialize(DtmBaseDados.dbBaseDados,
                         True,
                         Sistema.ConnectionType,
                         Sistema.ConnectionSide,
                         Sistema.AppRemoteServer,
                         True,
                         nil,
                         nil,
                         False
                        );

  CtrlDARF.InitializeAs(CtrlGeraDARM);
  CtrlUtil.InitializeAs(CtrlGeraDARM);
  CtrlGeraGPS.InitializeAs(CtrlGeraDARM);

  // -----------------------------------------------------------------------------------------------

  CtrlGeraDARM.cdsDocISS            := cds;
  cds.Data                          := CtrlGeraDARM.BuscaGuia(-1, -1);

  dtmLookIRRF.cdsParamIRRF.Data     := CtrlDARF.ListParametrosIRRF(Sistema.IDEmpresa);

  // preenche dados do documento buscado
  cdsDocumento.Data       := CtrlUtil.DadosDocumento(-1);
  cdsLanctoDocum.Data     := CtrlUtil.DadosLanctoDocum(-1);
  cdsRateioDocum.Data     := CtrlUtil.DadosRateioDocum(-1);
  cdsCCBaixaXDocum.Data   := CtrlUtil.DadosCCBaixaXDocum(-1);

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmCadDARMMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CtrlGeraDARM.Free;
  CtrlGeraGPS.Free;
  CtrlUtil.Free;
  CtrlDARF.Free;
end;



procedure TfrmCadDARMMT.ProcessaGuia;
var
  bErro : Boolean;
begin
  bErro := False;

  try
    try
      // -------------------------------------------------------------------------------------------

      // Alterador de Juros
      bErro := not(AlteradorJuros);

      // Alterador de Multa
      bErro := not(AlteradorMulta);

      // Alterador de Desconto
      bErro := not(AlteradorDesconto);

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      if not(bErro) then
      begin
        if not(CtrlGeraDARM.AlteraGuia) then
        begin
          dtmBaseDados.dbBaseDados.Rollback;

          MsgDlg('Alteração não Efetuada: ' + CtrlGeraDARM.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
          Repaint;
        end
        else
        begin
          dtmBaseDados.dbBaseDados.Commit;

          MsgDlg('Alteração Efetuada', Sistema.NomeModulo, mtInformation, [mbOk], 0);
          Repaint;
        end;
      end;

      // -------------------------------------------------------------------------------------------

    except

      dtmBaseDados.dbBaseDados.Rollback;

      MsgDlg('Alteração não Efetuada', Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;

      raise;
    end;  // try..except

  finally
    // tratamento de Rollback em caso de bErro
  end;
end;



procedure TfrmCadDARMMT.ExcluiGuia;
var
  bErro         : Boolean;
  IDDocISS      : Integer;
  CodDocumento  : Integer;
begin
  bErro         := False;
  IDDocISS      := cds.FieldByName('IDDOCISS').AsInteger;
  CodDocumento  := cds.FieldByName('CODDOCUMENTO').AsInteger;

  try
    try
      dtmBaseDados.dbBaseDados.StartTransaction;

      // ---------------------------------------------------------------------------------------------
      // Limpa o CodCodumento da DocISS
      // ---------------------------------------------------------------------------------------------
      if not(CtrlGeraDARM.AtualizaDocISS(IDDocISS)) then
      begin
        bErro := True;

        MsgDlg(CtrlGeraDARM.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        Exit;
      end;
      // ---------------------------------------------------------------------------------------------

      // ---------------------------------------------------------------------------------------------
      // Exclui o Documento
      // ---------------------------------------------------------------------------------------------
      if not(CtrlDARF.ExcluiDocumento(CodDocumento,
                                      Sistema.IDEspAcesso,
                                      Sistema.IDUsuario
                                     )) then
      begin
        bErro := True;

        MsgDlg(CtrlGeraDARM.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        Exit;
      end;
      // ---------------------------------------------------------------------------------------------

      // ---------------------------------------------------------------------------------------------
      // Limpa o IDDOCISS da LancIRRF
      // ---------------------------------------------------------------------------------------------
      if not(CtrlGeraDARM.AtualizaLanc(IDDocISS, 0, 'E')) then
      begin
        bErro := True;

        MsgDlg(CtrlDARF.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        Exit;
      end;
      // ---------------------------------------------------------------------------------------------

      // ---------------------------------------------------------------------------------------------
      // Exclui a DocISS
      // ---------------------------------------------------------------------------------------------
      if not(CtrlGeraDARM.ExcluiGuia(IDDocISS)) then
      begin
        bErro := True;

        MsgDlg(CtrlGeraDARM.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        Exit;
      end;
      // ---------------------------------------------------------------------------------------------

    except
      dtmBaseDados.dbBaseDados.Rollback;

      bErro := True;

      MsgDlg('ERRO ao excluir DARM', Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;

      raise;
    end;  // try..except

  finally
    if bErro then
    begin
      dtmBaseDados.dbBaseDados.Rollback;

      MsgDlg('Exclusão NÃO efetuada.', 'Information', mtError, [mbOk], 0);
      Repaint;
    end
    else  // if bErro
    begin
      dtmBaseDados.dbBaseDados.Commit;

      MsgDlg('DARM excluída.', 'Information', mtInformation, [mbOk], 0);
      Repaint;
    end;  // if bErro
  end;  // if bErro
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



function  TfrmCadDARMMT.AlteradorJuros: Boolean;
begin
  Result := ProcessaAlterador('NUMLANCJUROS', 'VLRJUROS', 'CODALTJUROS', 'Juros', 'C');
end;


function  TfrmCadDARMMT.AlteradorMulta: Boolean;
begin
  Result := ProcessaAlterador('NUMLANCMULTA', 'VLRMULTA', 'CODALTMULTA', 'Multa', 'C');
end;


function  TfrmCadDARMMT.AlteradorDesconto: Boolean;
begin
  Result := ProcessaAlterador('NUMLANCDESCONTO', 'VLRDESCONTO', 'CODALTDESCONTO', 'Juros', 'D');
end;



function TfrmCadDARMMT.ProcessaAlterador(const psNomeCampoLanc  : String;
                                         const psNomeCampoValor : String;
                                         const psNomeCampoAlt   : String;
                                         const psHistAlterador  : String;
                                         const psDebCre         : String
                                        ): Boolean;
var
  fVlrLancto  : Currency;
begin
  Result := True;

  // Se (a) NÃO houver lançamento de juros no documento
  //  e (b) houver valor de juros a lançar,
  // deve-se INSERIR o alterador

  // Se (a) houver lançamento de juros no documento
  //  e (b) houver valor de juros a lançar,
  // deve-se ALTERAR o registo do alterador (Excluir + Inserir)

  // Se (a) houver lançamento de juros no documento
  //  e (b) NÃO houver valor de juros a lançar,
  // deve-se excluir o alterador

  // -----------------------------------------------------------------------------------------------

  fVlrLancto  := cds.FieldByName(psNomeCampoValor).AsCurrency;

  // -----------------------------------------------------------------------------------------------

  if (cds.FieldByName(psNomeCampoLanc).IsNull) and (cds.FieldByName(psNomeCampoValor).AsCurrency <> 0) then
  begin
    Result := InsereAlterador(psNomeCampoLanc, psNomeCampoValor, fVlrLancto, psNomeCampoAlt, psHistAlterador, psDebCre);
  end
  else
  begin
    if not(cds.FieldByName(psNomeCampoLanc).IsNull) and (cds.FieldByName(psNomeCampoValor).AsCurrency <> 0) then
    begin
      Result := (ExcluiAlterador(psNomeCampoLanc, psNomeCampoValor)) and
                (InsereAlterador(psNomeCampoLanc, psNomeCampoValor, fVlrLancto, psNomeCampoAlt, psHistAlterador, psDebCre));
    end
    else
    begin
      if not(cds.FieldByName(psNomeCampoLanc).IsNull) and (cds.FieldByName(psNomeCampoValor).AsCurrency = 0) then
      begin
        Result := ExcluiAlterador(psNomeCampoLanc, psNomeCampoValor);
      end;
    end;
  end;

  // -----------------------------------------------------------------------------------------------
end;




function TfrmCadDARMMT.InsereAlterador(const psNomeCampoLanc  : String;
                                       const psNomeCampoValor : String;
                                       const fVlrLancto       : Currency;
                                       const psNomeCampoAlt   : String;
                                       const psHistAlterador  : String;
                                       const psDebCre         : String
                                      ): Boolean;
var
  IDLancto : Integer;
begin

  Result          := True; //CPREV - Pend. 27586
  cdsLancAux.Data := CtrlUtil.DadosLanctoDocum(-1);

  cdsLancAux.Insert;
  cdsLancAux.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
  cdsLancAux.FieldByName('NUMLANCTO').AsInteger         := 0;
  cdsLancAux.FieldByName('PLNCODIGO').AsInteger         := 0;
  cdsLancAux.FieldByName('IDPESSOA').AsInteger          := Sistema.IDEmpresa;
  cdsLancAux.FieldByName('DATALANCTO').AsDateTime       := cds.FieldByName('DATAEMISSAO').AsDateTime;
  cdsLancAux.FieldByName('VALOR').AsCurrency            := fVlrLancto;
  cdsLancAux.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName(psNomeCampoAlt).AsInteger;

  //CPRV - Pend. 27586 - cdsLancAux.FieldByName('DEBCRE').AsString             := 'C';
  cdsLancAux.FieldByName('DEBCRE').AsString             := psDebCre; //CPRV - Pend. 27586
  cdsLancAux.FieldByName('OPERACAO').AsString           := '4';
  cdsLancAux.FieldByName('HISTORICOCOMPL').AsString     := psHistAlterador;
  cdsLancAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IDUsuario;
  cdsLancAux.Post;

  CtrlGeraGPS.cdsAlteradores := cdsLancAux;

  IDLancto := CtrlGeraGPS.LancaAlterador(Sistema.IDUsuario,
                                         Sistema.IDEmpresa,
                                         Sistema.IDModulo,
                                         cdsDocumento.FieldByName('PLANO').AsInteger,
                                         Sistema.IDEspAcesso,
                                         Sistema.UsaPlanoPatro,
                                         ParamIntegra.PartidaDobrada
                                        );

  if IDLancto = -1 then
  begin
    Result := False;
    Exit;
  end;

  cds.Edit;
  cds.FieldByName(psNomeCampoLanc).AsInteger    := IDLancto;
  cds.FieldByName(psNomeCampoValor).AsCurrency  := fVlrLancto;
  cds.Post;
end;



function TfrmCadDARMMT.ExcluiAlterador(const psNomeCampoLanc   : String;
                                       const psNomeCampoValor  : String
                                      ): Boolean;
var
  IDLancto : Integer;
begin
  IDLancto := cds.FieldByName(psNomeCampoLanc).AsInteger;

  // -----------------------------------------------------------------------------------------------

  cds.Edit;
  cds.FieldByName(psNomeCampoLanc).Clear;
  cds.FieldByName(psNomeCampoValor).Clear;
  cds.Post;

  CtrlGeraDARM.AlteraGuia;

  // -----------------------------------------------------------------------------------------------

  Result := CtrlGeraGPS.ExcluiAlterador(cds.FieldByName('CODDOCUMENTO').AsInteger,
                                        IDLancto,
                                        Sistema.IDModulo,
                                        Sistema.IDEspAcesso,
                                        Sistema.IDUsuario,
                                        Sistema.UsaPlanoPatro,
                                        ParamIntegra.PartidaDobrada
                                       );

  // -----------------------------------------------------------------------------------------------
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmCadDARMMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not(VerificaPreenchimento) then Exit;

  inherited;

  cdsLanctoDocum.Data   := CtrlDARF.ProcurarLancamentos(-1);
  cdsRateioDocum.Data   := CtrlDARF.ProcurarRateio(-1);
  cdsDocumento.Data     := CtrlDARF.ProcurarRateio(-1);
  cdsCCBaixaXDocum.Data := CtrlDARF.ProcurarRateio(-1);
  cds.Data              := CtrlGeraDARM.BuscaGuia(-1, -1);

  PreencheDadosOriginais;

  CmeCadastro.AtualizaBotoes(Self)
end;



function TfrmCadDARMMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    // Se houver valor de juros preenchido na tela, precisa haver alterador de juros parametrizado
    if cds.FieldByName('VLRJUROS').AsCurrency > 0 then
      if dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTJUROS').AsInteger <= 0 then
        raise EValidacao.CreateVal('Não há Tipo de Alterador parametrizado para Juros!', DBedtVlrJuros);

    // Se houver valor de multa preenchido na tela, precisa haver alterador de multa parametrizado
    if cds.FieldByName('VLRMULTA').AsCurrency > 0 then
      if dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTMULTA').AsInteger <= 0 then
        raise EValidacao.CreateVal('Não há Tipo de Alterador parametrizado para Multa!', DBedtVlrMulta);

    // Se houver valor de desconto preenchido na tela, precisa haver alterador de desconto parametrizado
    if cds.FieldByName('VLRDESCONTO').AsCurrency > 0 then
      if dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTDESCONTO').AsInteger <= 0 then
        raise EValidacao.CreateVal('Não há Tipo de Alterador parametrizado para Desconto!', DBedtVlrDesconto);

    // ---------------------------------------------------------------------------------------------

  except
    on ev : EValidacao do
    begin
      Screen.Cursor := crDefault;
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



procedure TfrmCadDARMMT.PreencheDadosOriginais;
begin
  if (cds.Active) and not(cds.IsEmpty) then
  begin
    edtDataProgrOri.Date    := cds.FieldByName('DATAPROGRAMADA').AsDateTime;
    edtDataDispOri.Date     := cds.FieldByName('DATADISPONIB').AsDateTime;
    edtVlrJurosOri.Value    := cds.FieldByName('VLRJUROS').AsCurrency;
    edtVlrMultaOri.Value    := cds.FieldByName('VLRMULTA').AsCurrency;
    edtVlrDescontoOri.Value := cds.FieldByName('VLRDESCONTO').AsCurrency;
    edtVlrTotalOri.Value    := cds.FieldByName('VLRTOTAL').AsCurrency;
  end
  else
  begin
    edtDataProgrOri.Clear;
    edtDataDispOri.Clear;
    edtVlrJurosOri.Clear;
    edtVlrMultaOri.Clear;
    edtVlrDescontoOri.Clear;
  end;
end;



procedure TfrmCadDARMMT.CmeCadastroDelete(Sender: TObject);
begin
  ExcluiGuia;
  inherited;
  PreencheDadosOriginais;
end;



procedure TfrmCadDARMMT.CmeCadastroConfirma(Sender: TObject);
begin
  if CmeCadastro.Operacao = opAlterar then
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;

    inherited;
    ProcessaGuia;
  end;
end;



procedure TfrmCadDARMMT.DBedtVlrJurosExit(Sender: TObject);
begin
  inherited;

  if CmeCadastro.Operacao = opAlterar then
  begin
    cds.FieldByName('VLRTOTAL').AsCurrency := //CPrev - Pend. 27586 - cds.FieldByName('VLRINSS').AsCurrency +
                                              cds.FieldByName('VLRISS').AsCurrency + //CPrev - Pend. 27586
                                              cds.FieldByName('VLRJUROS').AsCurrency +
                                              cds.FieldByName('VLRMULTA').AsCurrency -
                                              cds.FieldByName('VLRDESCONTO').AsCurrency;
  end;
end;



end.
