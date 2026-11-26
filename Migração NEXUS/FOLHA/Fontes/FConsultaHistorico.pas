// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//--------------------------------------------------------------------------------------------------
// Data       : 22/03/2023
// SIG        : 133922
// Autor      : Andre Imakawa
// Descrição  : Ajuste na Consulta de Histórico de Pagamento para retornar recebedores Pessoa Jurídica.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Andre Imakawa
// Data      : 01/06/2022
// Pendencia : 84516
// Alteração : Ajuste no DFM para buscar pelo CPF do Titular
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Ewerton Beltramini
// Data      : 02/10/2019
// Pendencia : 92331
// Alteração : Alteração nos componentes:  QryObtemBasePagamento; CdsBasePagamento;
//             Para carregar os dados consolidados;
//--------------------------------------------------------------------------------------------------
//Pendência  : SIG42986
//Data       : 16/01/2018
//Autor(a)   : Andre Imakawa
//Alteração  : Removido a chamada do evento qryPreviaAfterScroll
//--------------------------------------------------------------------------------------------------
//Pendência  : SOL 207789/16616 PPM 554285
//Data       : 05/07/2015
//Autor(a)   : Fernando Xavier
//Alteração  : Criação de Nova Funcionalidade para Batimento de Retorno das Informações da
//              Fita de Crédito
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Rotina    : ExecutaMontaSelect
// Data      : 13/10/2010
// Pendencia : SOL 145036 Kintana 970354
// Alteração : Alteração no montaselect dessa tela.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : ExecutaMontaSelect
// Data      : 28/05/2008
// Pendencia : 27844
// Alteração : Alteração no montaselect dessa tela.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Bruno Bastos
// Rotina    : btnprocuraClick
// Data      : 02/08/2007
// Pendencia : 23758
// Alteração : Buscar a situação da pessoa na fundação.
//--------------------------------------------------------------------------------------------------

unit FConsultaHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, DBCtrls, Mask, wwdbedit,
  Spin, Wwdbigrd, Grids, Wwdbgrid, Db, MontaSelect, Wwdatsrc, DBTables,
  UMensErro, Wwquery, UDatabase, fFrameConsultaHistorico, uSistema, dBaseDados,
  uCmSqlParams, DBClient, uCMClientDataSet, shellapi;

type
  TfrmConsultaHistorico = class(TfrmSairAjuda)
    qryInscricao: TwwQuery;
    qryMatric: TwwQuery;
    MontaSelect1: TMontaSelect;
    qryMatricIDPESSOA: TFloatField;
    qryMatricIDPESSJUR: TFloatField;
    PnlMatricOuInscricao: TPanel;
    LblInscricao: TLabel;
    LblMatric: TLabel;
    BtnProcura: TBitBtn;
    dbedtitular: TwwDBEdit;
    LblTitular: TLabel;
    dbedPatrocinadora: TwwDBEdit;
    LblPatrocinadora: TLabel;
    LblPlano: TLabel;
    dbedPlano: TwwDBEdit;
    EdtMatricula: TEdit;
    EdtNumInscr: TEdit;
    qryMatricINSCRICAONUMERO: TFloatField;
    FrameConsulta: TfrmFrameConsultaHistorico;
    Label2: TLabel;
    EdtSituacao: TEdit;
    dbChkIRTotal: TDBCheckBox; //SOL 207789/16616 PPM 554285 
    CdsBasePagamento: TCMClientDataSet; //SOL 207789/16616 PPM 554285 
    SqlCampos: TCMSqlParams;  //SOL 207789/16616 PPM 554285 
    dsBasePagamento: TwwDataSource;  //SOL 207789/16616 PPM 554285
    procedure btnprocuraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNumInscrKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EdtMatriculaEnter(Sender: TObject);
    procedure EdtNumInscrEnter(Sender: TObject);
    procedure FrameConsultaqrySelecaoAfterScroll(DataSet: TDataSet);
    procedure FrameConsultadbgConcCreditoDblClick(Sender: TObject);
    procedure FrameConsultaqryPreviaAfterScroll(DataSet: TDataSet);
    procedure FrameConsultadbgConcCreditoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
  private
    { Private declarations }
    idTitular, idPessoa, // SOL 207789/16616 PPM 554285 
    idResponsavel: integer;  // add a variavel idresponsavel SOL 145036 Kintana 970354
    sInscricao, sMatricula: string;
    procedure ExecutaMontaSelect;
    procedure MostraBasePagamento; //SOL 207789/16616 PPM 554285 
    procedure MostraConcCreditoEfetuado; //SOL 207789/16616 PPM 554285 
  public
    { Public declarations }
  end;

var
  frmConsultaHistorico: TfrmConsultaHistorico;

implementation

{$R *.DFM}

uses uAdmPrevFB, UFuncoesUteisFB;

procedure TfrmConsultaHistorico.ExecutaMontaSelect;
begin
  MontaSelect1.Filtro.Clear;

  //CPrev - 27844 - Inicio
  //  MontaSelect1.Filtro.Add('P.IDPESSOA   = H.IDTITULAR');
  //  MontaSelect1.Filtro.Add('E.IDPESSOA   = H.IDTITULAR');
  //  MontaSelect1.Filtro.Add('TIT.IDPESSOA = H.IDTITULAR');
  //  MontaSelect1.Filtro.Add('REC.IDPESSOA = H.IDPESSOA');
  //  MontaSelect1.Filtro.Add('PA.IDPESSOA  = H.IDPATRO');
  //  MontaSelect1.Filtro.Add('DP.IDPESSOA(+) = H.IDPESSOA');

  MontaSelect1.Filtro.Add('E.IDPESSOA   = P.IDPESSOA');
  MontaSelect1.Filtro.Add('E.IDPESSJUR  = P.IDPESSJUR');
  MontaSelect1.Filtro.Add('TIT.IDPESSOA = E.IDPESSOA');
  MontaSelect1.Filtro.Add('TIT.IDPESSOA = P.IDPESSOA');
  MontaSelect1.Filtro.Add('DP.IDTITULAR = E.IDPESSOA');
  MontaSelect1.Filtro.Add('DP.IDTITULAR = P.IDPESSOA');
  MontaSelect1.Filtro.Add('DP.IDPESSOA  = REC.IDPESSOA');
  MontaSelect1.Filtro.Add('P.IDPESSOA   = H.IDTITULAR');
  MontaSelect1.Filtro.Add('E.IDPESSOA   = H.IDTITULAR');
  MontaSelect1.Filtro.Add('TIT.IDPESSOA = H.IDTITULAR');
  MontaSelect1.Filtro.Add('REC.IDPESSOA = H.IDPESSOA');
  MontaSelect1.Filtro.Add('PA.IDPESSOA  = H.IDPATRO');
  MontaSelect1.Filtro.Add('DP.IDTITULAR = H.IDTITULAR');
  MontaSelect1.Filtro.Add('DP.IDPESSOA  = H.IDPESSOA');

  MontaSelect1.Filtro.Add('H.IDPESSJUR  = '+IntToStr(iIdFundacao));
  //CPrev - 27844 - Fim

  If MontaSelect1.Executar = mrOk Then
  Begin
    FrameConsulta.ResetaFrame;
    idTitular:=strtoint(MontaSelect1.ValoresChave[0]);
    idPessoa:=strtoint(MontaSelect1.ValoresChave[4]); // SOL 207789/16616 PPM 554285 
    idResponsavel := strtoint(MontaSelect1.ValoresChave[5]);  // SOL 145036 Kintana 970354
    EdtMatricula.Text:=MontaSelect1.ValoresChave[2];
    EdtNumInscr.Text:=MontaSelect1.ValoresChave[1];
  End
  Else
    If idTitular = 0 then
      idTitular:=qryMatric.fieldbyname('IDPESSOA').asinteger;
end;

procedure TfrmConsultaHistorico.btnprocuraClick(Sender: TObject);
begin
  inherited;
  {AO PRESSIONAR O BOTÃO PROCURAR NÃO CONSIDERAR O VALOR DA MATRÍCULA
   OU INSCRIÇÃO CORRENTE}
  if activecontrol <> BtnProcura then
  begin
    sMatricula:=trim(EdtMatricula.Text);
    sInscricao:=trim(EdtNumInscr.Text);
  end
  else
  begin
    sMatricula:='';
    sInscricao:='';
  end;
  idTitular:=0;

  If (sMatricula = '') And (sInscricao = '') Then // MATRICULA E INSCRICAO NÃO PREENCHIDOS
    ExecutaMontaSelect
  Else
  Begin // MATRICULA OU INSCRICAO PREENCHIDOS
    FrameConsulta.ResetaFrame;
    application.processmessages;
    idTitular:=0;
    If sMatricula <> '' Then // MATRICULA PREENCHIDA
    Begin
      qryMatric.Close;
      qryMatric.ParamByName('NUMMATRICULA').asstring:=sMatricula+'%';
      qryMatric.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
      qryMatric.Open;
      If qryMatric.IsEmpty Then
      Begin
        EdtMatricula.SetFocus;
        MsgDlg('Não existe o Participante escolhido (Matrícula:'+sMatricula+').', 'ERRO', mtError, [mbOk,mbHelp],0);
        FrameConsulta.ResetaFrame;
        Exit;
      End
      Else
        If qrymatric.recordcount > 1 Then
        Begin
          MsgDlg('Foi identificado mais de um participante para a Matricula digitada.'+
                 #13#13+'Deve-se selecionar o participante desejado na tela de busca a seguir.',
                 'Informação', mtWarning, [mbOk,mbHelp], 0);
          ExecutaMontaSelect;
          FrameConsulta.ResetaFrame;
          //Exit; // Andre Imakawa - SIG 133922 - Ajuste para retornar PJ
        End;
      if idTitular = 0 then
      begin
        idTitular:=qryMatric.fieldbyname('IDPESSOA').asinteger;
        idPessoa := qryMatric.fieldbyname('IDPESSOA').asinteger; //SOL 207789/16616 PPM 554285 
      end;
      EdtMatricula.SetFocus;
      EdtNumInscr.Text:=qryMatric.FieldByName('INSCRICAONUMERO').AsString;
    end;
    If sInscricao <> '' Then // INSCRICAO PREENCHIDA
    Begin
      qryInscricao.Close;
      qryInscricao.ParamByName('INSCRICAO').asstring:=sInscricao;
      qryInscricao.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
      qryInscricao.Open;
      If qryInscricao.IsEmpty Then
      Begin
        EdtMatricula.SetFocus;
        MsgDlg('Não existe o Participante escolhido (Inscrição:'+sInscricao+').', 'ERRO', mtError, [mbOk,mbHelp],0);
        FrameConsulta.ResetaFrame;
        Exit;
      end
      else
        If qryInscricao.recordcount > 1 then
        begin
          MsgDlg('Foi identificado mais de um participante para a Inscrição digitada.'+
                 #13#13+'Deve-se selecionar o participante desejado na tela de busca a seguir.',
                 'Informação', mtWarning, [mbOk,mbHelp], 0);
          ExecutaMontaSelect;
          Exit;
        end;
      If idTitular = 0 then
        idTitular:=qryInscricao.fieldbyname('IDPESSOA').asinteger;
      EdtNumInscr.SetFocus;
      EdtMatricula.Text:=qryInscricao.FieldByName('MATRICULA').AsString;
    End;
  End;

  (* Busca situação na Fundação *)
  With FrameConsulta.qryAux do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT ST.DESCRICAO '+
            ' FROM PARTPREVPLAN PV, SITPART ST '+
            ' WHERE PV.IDPESSOA = '+IntToStr(IdTitular)+
            ' AND PV.FLGDESATIVADO = 0 '+
            ' AND PV.IDSITPART = ST.IDSITPART');
    Open;
    EdtSituacao.Text := Fields[0].AsString;
    Close;
  end; {With}

  if idTitular = 0 then
    exit;
  if not FrameConsulta.ExecutaConsulta(idTitular) then
  begin
    MsgDlg('Não existe pagamento para o Participante escolhido (Matrícula:'+
      EdtMatricula.Text+').', 'ERRO', mtError, [mbOk,mbHelp],0);
    FrameConsulta.ResetaFrame;
    EdtMatricula.Text:='';
    EdtNumInscr.Text:='';
  end;
end;

procedure TfrmConsultaHistorico.EdtMatriculaEnter(Sender: TObject);
begin
  inherited;
  EdtNumInscr.Clear;
end;

procedure TfrmConsultaHistorico.EdtNumInscrEnter(Sender: TObject);
begin
  inherited;
  EdtMatricula.Clear;
end;

procedure TfrmConsultaHistorico.EdtMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  EdtNumInscr.Clear;
end;

procedure TfrmConsultaHistorico.EdtNumInscrKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  EdtMatricula.Clear;
end;

procedure TfrmConsultaHistorico.FormCreate(Sender: TObject);
begin
  inherited;
  FrameConsulta.MontaQry;
end;

procedure TfrmConsultaHistorico.FormShow(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Consulta do Histórico de Pagamento.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  btnprocura.Enabled:=true;
  WindowState:=wsMaximized;
  Refresh;
end;

procedure TfrmConsultaHistorico.MostraBasePagamento; // SOL 207789/16616 PPM 554285  criação do metodo
var
   bTemBasePagamento : boolean;
begin


    bTemBasePagamento := FrameConsulta.QryObtemBasePagamento.eof;

    CdsBasePagamento.ReadOnly := false;

    SqlCampos.Prepare;
    SqlCampos.Open;
    CdsBasePagamento.delete;

    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Matricula';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('MATRICULA').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Pagamento';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('DATAPAGAMENTO').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Mês Pagamento';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('MESCOBRANCA').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'PMP';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('PRAZOMEDIOPONDERADO').AsFloat));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Base Cálculo IR Regressivo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('BASECALCIRREGRESSIVO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Percentual IR Regressivo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('PERCENTUALIRREGRESSIVO').AsFloat));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Valor IR Regressivo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('VLRIRREGRESSIVO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Bruto';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('VLRBRUTO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Desconto';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('VLRDESCONTO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Liquido';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('VLRLIQUIDO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Tipo Pagamento';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', iff(FrameConsulta.QryObtemBasePagamento.FieldByName('TIPOFOLHA').AsInteger = 0, 'Normal', 'Resgate'));
    CdsBasePagamento.Insert;
    //CdsBasePagamento.FieldByName('Campo').AsString                := 'Beneficío de Risco'; //Ewerton Beltramini - SIG92331
    //CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', iff(FrameConsulta.QryObtemBasePagamento.FieldByName('FLGRISCO').AsInteger = 0, 'Não é de risco', 'De risco')); // Ewerton Beltramini - SIG92331
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Pagamento Efetivado';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', iff(FrameConsulta.QryObtemBasePagamento.FieldByName('FLGEFETIVADO').AsInteger = 0, 'Não efetivado', 'Efetivado'));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Versão da Folha';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('IDHSTFOLHABENEF').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Isento IRRF';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', iff(FrameConsulta.QryObtemBasePagamento.FieldByName('FLGISENTOIRRF').AsInteger = 0, 'Não', 'Sim'));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Moléstia Grave';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', iff(FrameConsulta.QryObtemBasePagamento.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 0, 'Não', 'Sim'));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Início Moléstia';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('DATAINICIOMOLESTIA').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data Fim Moléstia';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('DATAFIMMOLESTIA').AsString;
    CdsBasePagamento.Insert;    
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Número Processo INSS';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('NUMPROCINSS').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Total';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', iff(FrameConsulta.QryObtemBasePagamento.FieldByName('FLGSOMAIRSUPINSS').AsInteger = 0, 'Não', 'Sim'));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'N. Dependentes';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('NUMDEPIRRF').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Banco';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FrameConsulta.QryObtemBasePagamento.FieldByName('NUMBANCO').AsString+ ' - '+FrameConsulta.QryObtemBasePagamento.FieldByName('NOMEBANCO').AsString);
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Agência';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FrameConsulta.QryObtemBasePagamento.FieldByName('NUMAGENCIA').AsString +' - '+FrameConsulta.QryObtemBasePagamento.FieldByName('NOMEAGENCIA').AsString);
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Conta';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('CONTACORRENTE').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Data de Nascimento';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('DATANASC').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Portador Forma';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('PORTADORFORMA').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'CPF';
    CdsBasePagamento.FieldByName('Valor').AsString                := FrameConsulta.QryObtemBasePagamento.FieldByName('CPF_MASCARA').AsString;
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Informativo';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('IRINFORMATIVO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Informativo 13';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('IRINFORMATIVO13').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Compensado';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('IRCOMPENSADO').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'IR Compensado 13';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('IRCOMPENSADO13').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Margem Consignável';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('MARGEMCONSIGNAVEL').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Renda Base';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('RENDABASE').AsCurrency));
    CdsBasePagamento.Insert;
    CdsBasePagamento.FieldByName('Campo').AsString                := 'Margem Real';
    CdsBasePagamento.FieldByName('Valor').AsString                := iff(bTemBasePagamento, '', FormatFloat('#,##0.00', FrameConsulta.QryObtemBasePagamento.FieldByName('MARGEMREAL').AsCurrency));


    CdsBasePagamento.Post;
    CdsBasePagamento.First;
    CdsBasePagamento.ReadOnly := true;
end;

procedure TfrmConsultaHistorico.FrameConsultaqrySelecaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  FrameConsulta.qrySelecaoAfterScroll(DataSet);
  MostraBasePagamento();//SOL 207789/16616 PPM 554285 
  MostraConcCreditoEfetuado();//SOL 207789/16616 PPM 554285 
end;

procedure TfrmConsultaHistorico.MostraConcCreditoEfetuado;  //SOL 207789/16616 PPM 554285 
begin
    //qryConcCreditoEfetuado.close;
    //qryConcCreditoEfetuado.ParamByName('IDHSTFOLHABENEF').AsString    := FrameConsulta.qrySelecao.FieldByName('IDHSTFOLHABENEF').AsString;
    //qryConcCreditoEfetuado.ParamByName('IDTITULAR').AsString := IntToStr(idTitular);
    //qryConcCreditoEfetuado.ParamByName('IDPESSOA').AsString  := IntToStr(idPessoa);
    //qryConcCreditoEfetuado.Open;
end;

procedure TfrmConsultaHistorico.FrameConsultadbgConcCreditoDblClick(
  Sender: TObject);
begin
   inherited;
   IF FrameConsulta.dbgConcCredito.Columns[FrameConsulta.dbgConcCredito.SelectedIndex].FieldName = 'NOMEARQUIVO' Then
   begin
      if FrameConsulta.qryConcCreditoEfetuado.FieldByName('CODIGORETORNO').Asstring <> '' then
      begin
         if FrameConsulta.qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring <> '' then
         begin
            If FileExists(Sistema.TempDir + 'ARQUIVO'+FrameConsulta.qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring) Then
              deletefile(Sistema.TempDir + 'ARQUIVO'+FrameConsulta.qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring);

            TBlobField(FrameConsulta.qryConcCreditoEfetuado.FieldByName('ARQUIVOREGULARIZACAO')).SaveToFile(sistema.TempDir + 'ARQUIVO'+FrameConsulta.qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring);

            If FileExists(Sistema.TempDir + 'ARQUIVO'+FrameConsulta.qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring) Then
               ShellExecute(Handle, nil, Pchar(sistema.TempDir + 'ARQUIVO'+FrameConsulta.qryConcCreditoEfetuado.FieldByName('EXTENSAOARQUIVO').Asstring), nil, nil, SW_SHOWNORMAL);
         end;
      end;
   end;

   IF FrameConsulta.dbgConcCredito.Columns[FrameConsulta.dbgConcCredito.SelectedIndex].FieldName = 'OBSERVACAO' Then
   begin
      if FrameConsulta.qryConcCreditoEfetuado.FieldByName('OBSERVACAO').Asstring <> '' then
      begin
         If FileExists(Sistema.TempDir + 'OBSERVACAO'+'.txt') Then
           deletefile(Sistema.TempDir +  'OBSERVACAO'+'.txt');

         TMemoField(FrameConsulta.qryConcCreditoEfetuado.FieldByName('OBSERVACAO')).SaveToFile(sistema.TempDir + 'OBSERVACAO'+'.txt');

         If FileExists(Sistema.TempDir +  'OBSERVACAO'+'.txt') Then
            ShellExecute(Handle, nil, Pchar(sistema.TempDir +  'OBSERVACAO'+'.txt'), nil, nil, SW_SHOWNORMAL);
      end;

   end;

end;

procedure TfrmConsultaHistorico.FrameConsultaqryPreviaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  //FrameConsulta.qryPreviaAfterScroll(DataSet); // Andre Imakawa - SIG42986
  MostraBasePagamento;
end;

procedure TfrmConsultaHistorico.FrameConsultadbgConcCreditoDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
Var R : TRect;
Begin
   inherited;
   R := Rect;
   Dec(R.Bottom,2);
   If Field = FrameConsulta.qryConcCreditoEfetuadoOBSERVACAO Then
   Begin
      If Not (gdSelected  in State) Then
         FrameConsulta.dbgConcCredito.Canvas.FillRect(Rect);
      DrawText(FrameConsulta.dbgConcCredito.Canvas.Handle,PChar(FrameConsulta.qryConcCreditoEfetuadoOBSERVACAO.AsString),Length(FrameConsulta.qryConcCreditoEfetuadoOBSERVACAO.AsString),R,DT_WORDBREAK);
   End;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FCONSULTAHISTORICO                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA PARA CONSULTA DOS PAGAMENTOS DE UM RECEBEDOR.                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/02/2002 A 01/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12C                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: ALTEREI AS QUERIES QUE MONTAM O DETALHE DA       |
| CONSULTA PARA VERIFICAR SE A FUNDACAO USA CODIGO/DESCRICAO INTERNO OU EXTERNO|
| DE RUBRICA                                                                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/06/2002 A 10/06/2002                         |
| PENDÊNCIA: 5911                                                              |
| VERSÃO PARA LIBERAÇÃO: 3.02.13                                               |
| CLIENTE: (CM)                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - REMODELAGEM DA TELA PARA TORNAR A DISPOSIÇÃO DAS INFORMAÇÕES MAIS CLARA    |
| E COMPATÍVEL COM A CONSULTA AO PARTICIPANTE.                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2002 A 27/06/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO: 3.02.13c                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIR VISUALIZAÇÃO DO VALOR DO SRB, VALOR DO INSS E FATORES DO BENEFICIO |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/08/2002 A 02/08/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocado o campo FlgSalFam da HistRubSal no Grid.                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/08/2002 A 14/08/2002                         |
| PENDÊNCIA: 8306                                                              |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - O Fernando pediu para trocar o parâmetro prmFlgCalcJunto, pelo novo     |
|    parâmetro criado FlgAgrupaRubrica.                                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| PENDÊNCIA: 8648                                                              |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi retirado a função TO_CHAR das queries qryRubricasDetalhe.            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| PENDÊNCIA: 8482                                                              |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado na qrySelecao e no Grid do Mestre o dbgHistorico o campo    |
|   DATAPAGAMENTO.                                                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/09/2002 A 17/09/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado um dbedit para mostrar a versão em que foi paga em caso de  |
|   pagamento indevido estornado.                                              |
|                                                                              |
|   - Foi retirado do MontaSelect o campo chave idpessjur.                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/10/2002 A 25/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Acerto no retorno dos valores de SRB, INSS e suplementação. Colocar másca- |
| ra nos fatores.                                                              |
| - Acerto duplcidade de chamada da rotina que executa a query de detalhe de   |
| rubricas.                                                                    |
| - Retirar parte das rubricas e montar um frame para colocar na Central de    |
| Atendimento.                                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/02/2003 A 20/02/2003                         |
| PENDÊNCIA: 11871                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03H                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| AO PRESSIONAR O BOTÃO PROCURAR NÃO CONSIDERAR O VALOR DA MATRÍCULA           |
| OU INSCRIÇÃO CORRENTE. USAR ESTAS INFORMAÇÕES APENAS SE EVENTO DISPARADO PELO|                                                                              |
| CÓDIGO A PARTIR DOS EDITS.                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/02/2003 A 20/02/2003                         |
| PENDÊNCIA: 11872                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03H                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| MOSTRAR A PASTA DE RUBRICAS QUANDO SE SELECIONA NOVO TITULAR PELA BOTÃO DE   |
| PROCURAR.                                                                    |                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/02/2003 A 20/02/2003                         |
| PENDÊNCIA: 12280                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03H                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Alterar a consulta do Consulta Histórico de Pagamento que busca as           |
| informações do titular, para que se trate casos em que existe mais de um     |
| plano previdenciário. Nestas situações aparecia uma mensagem como se tivessem|
| vários titulares com matrículas similares. (qryMatric e qryInscricao)        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 14514                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/07/2003 A 28/07/2003                         |
| PENDÊNCIA: 14727                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Apresenta erro na consulta por inscrição.                                  |
|   Colocou-se coluna matricula na qryInscricao.                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/09/2004 A 20/09/2004                         |
| PENDÊNCIA: 17718                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13h                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Ajuste na qryMatric para não exibir duas linhas para casos de migração de  |
| plano.                                                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

