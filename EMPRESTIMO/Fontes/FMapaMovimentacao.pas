{
//***************************************************************************************
//Nº Atender........: WO18338
//Data da Alteração.: 14/02/2025
//Responsável.......: Luis Ferrari
//Descrição.........: Ajuste na consulta para trazer todos Contratos

//***************************************************************************************
//Nº SIG............: WO4233           //Nº Atender........: WO13212
//Data da Alteração.: 06/09/2024
//Responsável.......: Luis Ferrari
//Descrição.........: Ajuste na consulta para trazer os Contratos Quitados e Cancelados do periodo

//***************************************************************************************

//Data da Alteração.: 23/11/2023
//Responsável.......: Leandro Pocebon
//Descrição.........: Inclusão dos campos no relatorio e query de consulta Ajustado  Mapa Query

//***************************************************************************************
//Nº SIG............: 127553
//Data da Alteração.: 11/08/2022
//Responsável.......: Luis Ferrari
//Descrição.........: Inclusão dos campos no relatorio e query de consulta Ajustado  Mapa Query
//***************************************************************************************
//Nº SIG............: 123193
//Data da Alteração.: 23/06/2022
//Responsável.......: Luis Ferrari
//Descrição.........: Inclusão opção de cosiderar ou não Contratos do arquivo CONTRATOAD  (.dfm e .pas)
//***************************************************************************************
//Nº SIG............: 114151
//Data da Alteração.: 05/04/2022
//Responsável.......: Ewerton Beltramini
//Descrição.........: Inclusão dos campos: ORIGEMCONCESSAO, SEXOPARTIC, IDADEPARTIC, UF, DATANASC  (.dfm)
//***************************************************************************************
//Nº SIG............: 121433
//Data da Alteração.: 21/01/2022
//Responsável.......: Ewerton Beltramini
//Descrição.........: Inclusão do campo CPF (.dfm)
//***************************************************************************************
//Nº SIG............: 64846/69634
//Data da Alteração.: 14/06/2018
//Responsável.......: Taffarel Sevaybriker
//Descrição.........: Inclusão do campo INPCCONTRATO (.dfm)
//***************************************************************************************
//Nº SIG............: 66626
//Data da Alteração.: 24/04/2018
//Responsável.......: Taffarel Sevaybriker
//Descrição.........: Inclusão dos campos Perfilinvest, PerfilAnterior, PerfilAtual, SaldoDevedor, SaldoVencido
//e ProvisaoPerda (.dfm)
//***************************************************************************************
//Nº SOL............: 264899
//Nº PPM............: 1177362
//Data da Alteração.: 25/11/2015
//Alteração Form....: Correção na geração do Mapa de Movimentações
//Responsável.......: William Santana
//Descrição.........: Correção na geração do Mapa de Movimentações
//***************************************************************************************
//Nº SOL............: 264778
//Nº PPM............: 1155728
//Data da Alteração.: 09/11/2015
//Alteração Form....: Remoção dos campos qryConsulta / campo trazendo mes anterior como padrão
//Responsável.......: William Santana
//Descrição.........: Remoção dos campos qryConsulta / campo trazendo mes anterior como padrão
//**************************************************************************************
------------------------------------------------------------------------------------------------------------
Nº SOL            : 260816
Nº PPM            : 1051407
Data da Alteração : 02/09/2015
Responsável       : William Moreira da Silva
Descrição         : Ajustes apos Reestruturação da HistMovEmptmo
--------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 29/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : SOL 154509 Kintana 1184761 
Responsável : Fernando Xavier
Data        : 16/03/2011
Descrição   : O relatório só é gerado se houver algum relatório gerado anteriormente.
--------------------------------------------------------------------------------
Pendência   : SOL 138227 Kintana 843724
Responsável : Ádler Souza
Data        : 20/09/2010
Descrição   : Criação da funcionalidade.
--------------------------------------------------------------------------------
}
unit FMapaMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc,
  QExport3, QExport3XLS, DBClient, uCMClientDataSet, shellApi, Mask, wwdbedit,
  Wwdbspin, BfDialogs, BrowseFolder, uProcuraDir, USistema, fcButton, fcImgBtn,dAutorizacao,uAutorizacao,
  ADODB, QExport3ASCII, mContratoEmptmo,
  fcShapeBtn, QExport3Dialog;

type
  TfrmMapaMovimentacao = class(TfrmParamReports_Padrao)
    dsConsulta: TwwDataSource;
    qryConsulta: TwwQuery;
    dlgCaminho: TProcuraDirDlg;
    cboMes: TComboBox;
    Label3: TLabel;
    DBspnAno: TwwDBSpinEdit;
    edtDiretorio: TEdit;
    Label1: TLabel;
    btnEscolheDir: TBitBtn;
    expArquivo: TQExport3ASCII;
    SpeedButton1: TSpeedButton;
    molContratoEmptmo: TmolContratoEmptmo;
    qryConsultaOri: TwwQuery;
    chkInArquivo: TCheckBox;
    chkNotInArquivo: TCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    edtDataInicio: TwwDBDateTimePicker;
    edtDataFim: TwwDBDateTimePicker;
    qryConsultaNova: TADOQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEscolheDirClick(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure chkInArquivoClick(Sender: TObject);
    procedure chkNotInArquivoClick(Sender: TObject);
    procedure abreConsulta(sDataInicio, sDataFim,sDataRefer,sMesAno: string);
  private
    Autorizacao: TAutorizacao; // WO18338
    procedure AbrirArquivo(pUrl: string);
  public
  end;

var
  frmMapaMovimentacao: TfrmMapaMovimentacao;

const
  NOME_ARQUIVO = '\Mapa_Movimentacao.csv';

implementation

uses
  UMensErro, UFuncoesEmptmo, fAguarde, UDiasUteis;

{$R *.DFM}

procedure TfrmMapaMovimentacao.bbtnConfirmarClick(Sender: TObject);
var
  xSPPrenncheRelatorio: TStoredProc;
  xList: TStringList;
  i: Integer;
  bNovo: Boolean;
  iAno: integer;
  iMes: integer;
  sDataRefer: string;
  sDataInicio: string;
  sDataFim: string;
  DiasUteis: TDiasUteis;
  sMesAno: string;        // SIG 127553
  sSql: string;     // SIG 127553
  sLstDatas : string;
begin
  inherited;

  iAno := StrToInt(floatToStr(DBspnAno.Value));
  iMes := cboMes.ItemIndex + 1;

  if ((cboMes.Text = '') or (DBspnAno.Text = '')) then
  begin
    MessageDlg('É obrigatório selecionar o Mês e Ano de Referência para geração do arquivo! ', mtWarning, [mbOK], 0);
    Exit;
  end;

  //leandro wo4233 inicio
  sDataInicio:= '';
  sDataFim:= '';

  if ((edtDataInicio.Text <> '') or ( edtDataFim.Text <> '')) then
  begin
    if ((edtDataInicio.Text = '') or ( edtDataFim.Text = '')) then
    begin
      MessageDlg('Data Inicial e Data Final devem ser preenchidasl! ', mtWarning, [mbOK], 0);
      Exit;
    end;

    if ((StrToInt(FormatDateTime('mm',edtDataInicio.Date)) <> iMes) or (StrToInt(FormatDateTime('mm',edtDataFim.Date)) <> iMes)) then
    begin
      MessageDlg('Mês do periodo diferente do Mês de Referencia! ', mtWarning, [mbOK], 0);
      Exit;
    end;

    if ((StrToFloat(FormatDateTime('yyyy',edtDataInicio.Date)) <> iAno) or (StrToFloat(FormatDateTime('yyyy',edtDataFim.Date)) <> iAno)) then
    begin
      MessageDlg('Ano do periodo diferente do Ano de Referencia! ', mtWarning, [mbOK], 0);
      Exit;
    end;

    if (edtDataInicio.Date > edtDataFim.Date) then
    begin
      MessageDlg('Data Inicial maior que Data Final!', mtWarning, [mbOK], 0);
      Exit;
    end;

    sDataInicio := edtDataInicio.Text;
    sDataFim    := edtDataFim.Text;
  end;
  //leandro wo4233 fim

  if edtDiretorio.Text = '' then
  begin
    MessageDlg('É necessário indicar o local para gravação do arquivo!', mtWarning, [mbOK], 0);
    Exit;
  end;

  DiasUteis := TDiasUteis.Create();
  if ((edtDataInicio.Text <> '') or ( edtDataFim.Text <> '')) then               //leandro wo4233
    sDataRefer := sDataFim                                                       //leandro wo4233
  else
  begin                                                                        //leandro wo4233
    sDataRefer := FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes(iAno, iMes));
    sDataInicio := '01/' + FormatFloat('00',iMes) + '/' + FormatFloat('0000',iAno);                                  //leandro wo4233
    sDataFim    := sDataRefer;                                                //leandro wo4233
  end;
  sMesAno := FormatDateTime('yyyy/mm', DiasUteis.UltDiaMes(iAno, iMes)); // SIG 127553
{
  //WO13212 Ferrari : inicio [ Ajuste para so entrar aqui se o periodo for escolhido ]
  if edtDataInicio.Text <> '' then
  Begin
  //leandro wo4233 inicio   aqui
      sSql :=  ' select DISTINCT ' +
               ' DTPERIODOINICIAL, ' +
               ' DTPERIODOFINAL    ' +
               ' from MAPAMOVEMPTMO ' +
               ' where ((DTPERIODOINICIAL >= :DATAINICIO AND DTPERIODOINICIAL <= :DATAFIM) ' +
               ' or    (DTPERIODOFINAL >= :DATAINICIO AND DTPERIODOFINAL <= :DATAFIM)) ' +
               ' AND  (DTPERIODOINICIAL <> :DATAINICIO OR DTPERIODOFINAL <> :DATAFIM) ';
      qryConsulta.Close;
      qryConsulta.SQL.text := sSQL;
      qryConsulta.ParamByName('DATAINICIO').Value := sDataInicio;
      qryConsulta.ParamByName('DATAFIM').Value := sDataFim;
      qryConsulta.Open;
  end;
  //WO13212 Ferrari : fim [ Ajuste para so entrar aqui se o periodo for escolhido ]

  if not (qryConsulta.IsEmpty) then
  begin
    bNovo := true;
    sLstDatas := '';
    qryConsulta.First;
    While not qryConsulta.eof do
    begin
      sLstDatas := sLstDatas + qryConsulta.fieldbyname('DTPERIODOINICIAL').asString + ' à ' + qryConsulta.fieldbyname('DTPERIODOFINAL').asString + #13;
      qryConsulta.Next;
    end;

    if MsgDlg('Existe um relatório gerado com periodo sobreposto.' + #13 + 'Periodo:' + #13 + sLstDatas + #13 + 'Deseja somente exportar as informações do periodo existente? Caso escolha não, as informações serão reprocessadas. ', 'Informação', mtInformation, [mbYes, mbNo], 0) = mrNo then
    begin
      bNovo := False;
      sLstDatas := '';
      qryConsulta.First;
      While not qryConsulta.eof do
      begin
        if Length(sLstDatas) > 0 then
          sLstDatas := sLstDatas + ',' ;

        sLstDatas := QuotedStr(qryConsulta.fieldbyname('DTPERIODOFINAL').AsString);

        qryConsulta.Next;
      end;

      sSql := 'DELETE FROM MAPAMOVEMPTMO M WHERE M.DATAREF IN (' + sLstDatas + ')';
      qryConsulta.Close;
      qryConsulta.SQL.text := sSql;
      qryConsulta.ExecSQL;

      sSql := 'DELETE FROM CM.CONTRATOS_MAPAMOVEMPTMO';
      qryConsulta.Close;
      qryConsulta.SQL.text := sSql;
      qryConsulta.ExecSQL;
    end
    else
    begin
      bNovo := True;
      sDataInicio := qryConsulta.fieldbyname('DTPERIODOINICIAL').asString;
      sDataFim    := qryConsulta.fieldbyname('DTPERIODOFINAL').asString;
      sDataRefer := sDataFim ;
    end;
  end
  else
  begin
    // Inicio WO18338 Ferrari

    qryConsulta.Close;
    //leandro wo4233 inicio   aqui
    qryConsulta.SQL.text := qryConsultaOri.SQL.text;
    sSql :=  qryConsulta.SQL.text;
    qryConsulta.ParamByName('DATAINICIO').Value := sDataInicio;
    qryConsulta.ParamByName('DATAFIM').Value := sDataFim;
    //leandro wo4233 fim
    qryConsulta.ParamByName('DATAREF').Value := sDataRefer;
    qryConsulta.ParamByName('MESANO').Value := sMesAno;     // SIG 127553
    qryConsulta.SQL.SaveToFile(Sistema.TempDir + 'mapamovimentacao.txt');
    qryConsulta.Open;

    with qryConsultaNova do
      begin
        Close;
        ConnectionString := Autorizacao.getStringConexaoADO;
        SQL.clear;
        SQL.add(qryConsultaOri.SQL.text);
        Parameters.ParamByName('MESANO').Value     := sMesAno;
        Parameters.ParamByName('DATAREF').Value    := sDataRefer;
        Parameters.ParamByName('DATAINICIO').Value := sDataInicio;
        Parameters.ParamByName('DATAFIM').Value    := sDataFim;
        sql.add('select * from pessoa where idpessoa = 1');
        Open;
      end;
    dsConsulta.DataSet:= qryConsultaNova;

    bNovo := True;
    if not (qryConsulta.IsEmpty) then
    begin
      bNovo := (MsgDlg('Existe um relatório gerado com a referência informada.' + #13 + 'Deseja somente exportar as informações? Caso escolha não, as informações serão reprocessadas. ', 'Informação', mtInformation, [mbYes, mbNo], 0) = mrYes);
    end;
  end;
  //leandro wo4233 fim

  if not (bNovo) then
  begin
    frmAguarde.Mostra('Gerando Arquivo...');
    try
      xSPPrenncheRelatorio := TStoredProc.Create(Application);
      xSPPrenncheRelatorio.DatabaseName := 'BaseDados';
      xSPPrenncheRelatorio.StoredProcName := 'PR_MAPAMOVEMPTMO';

      xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataRefer', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pContratos', ptinput); //William Moreira da Silva - SOL 260816 PPM 1051407
// Inicio SIG 123193 Ferrari
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PINARQUIVO', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PNOTINARQUIVO', ptinput);
      if chkInArquivo.Checked then              xSPPrenncheRelatorio.parambyName('PINARQUIVO').AsInteger          := 1;
      if chkNotInArquivo.Checked then           xSPPrenncheRelatorio.parambyName('PNOTINARQUIVO').AsInteger       := 1;
// Fim SIG 123193
      xSPPrenncheRelatorio.parambyName('pDataRefer').AsString := sDataRefer;

      //Leandro wo4233 - inicio
      if ((sDataInicio <> '') or ( sDataFim <> '')) then
      begin
        xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataInicio', ptinput);
        xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataFim', ptinput);
        xSPPrenncheRelatorio.parambyName('pDataInicio').AsString := sDataInicio;
        xSPPrenncheRelatorio.parambyName('pDataFim').AsString := sDataFim;
      end;
      //Leandro wo4233 - fim

      //William Moreira da Silva - SOL 260816 PPM 1051407
      if molContratoEmptmo.IDContrato > 0 then
      begin
        xSPPrenncheRelatorio.parambyName('pContratos').AsString := floattostr(molContratoEmptmo.IDContrato);
      end
      else
      begin
        xSPPrenncheRelatorio.parambyName('pContratos').AsString := '';
      end;
      //William Moreira da Silva - SOL 260816 PPM 1051407
      xSPPrenncheRelatorio.Prepare;

      xSPPrenncheRelatorio.ExecProc;
    finally
      xSPPrenncheRelatorio.Close;
      FreeAndNil(xSPPrenncheRelatorio);
    end;
  end;

  qryConsulta.Close;
  //Início - William Santana - SOL 264899 PPM 1177362
  qryConsulta.SQL.text := qryConsultaOri.SQL.text;
  sSql :=  qryConsulta.SQL.text;        // SIG 127553
  if molContratoEmptmo.IDContrato > 0 then
  begin
    sSql := StringReplace(sSQL, 'WHERE M.DATAREF = :DATAREF', ' WHERE M.DATAREF = :DATAREF AND M.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO ', [rfReplaceAll]);    // SIG 127553
//    qryConsulta.SQL.Add(' WHERE M.DATAREF = :DATAREF AND IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO ');
    qryConsulta.SQL.text := sSql;   // SIG 127553
    qryConsulta.ParamByName('IDCONTRATOEMPTMO').AsString := floattostr(molContratoEmptmo.IDContrato);
  end;
  //Término - William Santana - SOL 264899 PPM 1177362
  //leandro wo4233 inicio   aqui
  qryConsulta.ParamByName('DATAINICIO').Value := sDataInicio;
  qryConsulta.ParamByName('DATAFIM').Value := sDataFim;
  //leandro wo4233 fim
  qryConsulta.ParamByName('DATAREF').Value := sDataRefer;
  qryConsulta.ParamByName('MESANO').Value := sMesAno;     // SIG 127553
  qryConsulta.SQL.SaveToFile(Sistema.TempDir + 'mapa.txt');
  qryConsulta.Open;

  frmAguarde.Apaga;

  if (qryConsulta.IsEmpty) then
  begin
   // comentado para atender o SOL154509
   { MsgDlg('Não existem relatórios referentes ao período selecionado! ','Erro',mtError,[mbOk],0);

    Self.ModalResult := mrNone;
    Exit;

    // trecho abaixo criação e execução da procedure para atender o SOL154509
    frmAguarde.Mostra('Gerando Arquivo...');
    try
      xSPPrenncheRelatorio := TStoredProc.Create(Application);
      xSPPrenncheRelatorio.DatabaseName := 'BaseDados';
      xSPPrenncheRelatorio.StoredProcName := 'PR_MAPAMOVEMPTMO';

      xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataRefer', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pContratos', ptinput); //William Moreira da Silva - SOL 260816 PPM 1051407
// Inicio SIG 123193 Frrari
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PINARQUIVO', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PNOTINARQUIVO', ptinput);
      if chkInArquivo.Checked then              xSPPrenncheRelatorio.parambyName('PINARQUIVO').AsInteger          := 1;
      if chkNotInArquivo.Checked then           xSPPrenncheRelatorio.parambyName('PNOTINARQUIVO').AsInteger       := 1;
// Fim SIG 123193
      xSPPrenncheRelatorio.parambyName('pDataRefer').AsString := sDataRefer;

      //Leandro wo4233 - inicio
      if ((sDataInicio <> '') or ( sDataFim <> '')) then
      begin
        xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataInicio', ptinput);
        xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataFim', ptinput);
        xSPPrenncheRelatorio.parambyName('pDataInicio').AsString := sDataInicio;
        xSPPrenncheRelatorio.parambyName('pDataFim').AsString := sDataFim;
      end;
      //Leandro wo4233 - fim

      //William Moreira da Silva - SOL 260816 PPM 1051407
      if molContratoEmptmo.IDContrato > 0 then
      begin
        xSPPrenncheRelatorio.parambyName('pContratos').AsString := floattostr(molContratoEmptmo.IDContrato);
      end
      else
      begin
        xSPPrenncheRelatorio.parambyName('pContratos').AsString := '';
      end;
      //William Moreira da Silva - SOL 260816 PPM 1051407
      xSPPrenncheRelatorio.Prepare;

      xSPPrenncheRelatorio.ExecProc;
    finally
      xSPPrenncheRelatorio.Close;
      FreeAndNil(xSPPrenncheRelatorio);
    end;
  end;
}
  abreConsulta(sDataInicio, sDataFim,sDataRefer,sMesAno);
  bNovo := True;
  if not (qryConsulta.IsEmpty) then
  begin
    bNovo := not (MsgDlg('Existe um relatório gerado com a referência informada.' + #13 + 'Deseja somente exportar as informações? Caso escolha não, as informações serão reprocessadas. ', 'Informação', mtInformation, [mbYes, mbNo], 0) = mrYes);
  end;

  if (bNovo) then
  begin
    frmAguarde.Mostra('Gerando Arquivo...');
    try
      xSPPrenncheRelatorio := TStoredProc.Create(Application);
      xSPPrenncheRelatorio.DatabaseName := 'BaseDados';
      xSPPrenncheRelatorio.StoredProcName := 'PR_MAPAMOVEMPTMO';

      xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataRefer', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pContratos', ptinput); //William Moreira da Silva - SOL 260816 PPM 1051407
// Inicio SIG 123193 Ferrari
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PINARQUIVO', ptinput);
      xSPPrenncheRelatorio.Params.CreateParam(ftInteger, 'PNOTINARQUIVO', ptinput);
      if chkInArquivo.Checked then              xSPPrenncheRelatorio.parambyName('PINARQUIVO').AsInteger          := 1;
      if chkNotInArquivo.Checked then           xSPPrenncheRelatorio.parambyName('PNOTINARQUIVO').AsInteger       := 1;
// Fim SIG 123193
      xSPPrenncheRelatorio.parambyName('pDataRefer').AsString := sDataRefer;

      //Leandro wo4233 - inicio
      if ((sDataInicio <> '') or ( sDataFim <> '')) then
      begin
        xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataInicio', ptinput);
        xSPPrenncheRelatorio.Params.CreateParam(ftString, 'pDataFim', ptinput);
        xSPPrenncheRelatorio.parambyName('pDataInicio').AsString := sDataInicio;
        xSPPrenncheRelatorio.parambyName('pDataFim').AsString := sDataFim;
      end;
      //Leandro wo4233 - fim

      //William Moreira da Silva - SOL 260816 PPM 1051407
      if molContratoEmptmo.IDContrato > 0 then
      begin
        xSPPrenncheRelatorio.parambyName('pContratos').AsString := floattostr(molContratoEmptmo.IDContrato);
      end
      else
      begin
        xSPPrenncheRelatorio.parambyName('pContratos').AsString := '';
      end;
      //William Moreira da Silva - SOL 260816 PPM 1051407
      xSPPrenncheRelatorio.Prepare;

      xSPPrenncheRelatorio.ExecProc;
      abreConsulta(sDataInicio, sDataFim,sDataRefer,sMesAno);
    finally
      xSPPrenncheRelatorio.Close;
      FreeAndNil(xSPPrenncheRelatorio);
    end;
  end;




  //GERAÇÃO DE ARQUIVO
  frmAguarde.Mostra('Gerando Arquivo...');
  Application.ProcessMessages;

  expArquivo.FileName := edtDiretorio.Text + NOME_ARQUIVO;
  //Início - William Santana - SOL 264899 PPM 1177362
  //expArquivo.Execute;
   try
     expArquivo.Execute;
   Except
     ShowMessage('Não foi possível criar ' + expArquivo.FileName +'. Verifique se o arquivo já não está aberto!' );
     frmAguarde.Apaga;
     exit;
   end;
  //Término - William Santana - SOL 264899 PPM 1177362
  frmAguarde.Apaga;
  MessageDlg('Arquivo gerado com sucesso.', mtInformation, [mbOK], 0);

  AbrirArquivo(edtDiretorio.Text + NOME_ARQUIVO);
end;

procedure TfrmMapaMovimentacao.AbrirArquivo(pUrl: string);
var
  vBuffer: string;
begin
  //Início - William Santana - SOL 264899 PPM 1177362
//  vBuffer := 'Notepad.exe ' + pUrl;
//
//  if (Trim(vBuffer) <> '') then begin
//    winExec(PChar(vBuffer), sw_shownormal);
//  end;
  if (Trim(pUrl) <> '') then
  begin
     ShellExecute(Self.Handle, nil, PChar(pUrl), nil, nil, SW_NORMAL);
  end;
 //Término - William Santana - SOL 264899 PPM 1177362
end;

procedure TfrmMapaMovimentacao.FormCreate(Sender: TObject);
var
  DiasUteis: TDiasUteis;
begin
  inherited;
  DiasUteis := TDiasUteis.Create();
  //Início - William Santana - SOL 264778 PPM 1155728
//  cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
  cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 2;
  //Término - William Santana - SOL 264778 PPM 1155728
  DBspnAno.Value := DiasUteis.ExtraiAno(Date);
  edtDiretorio.Text := fTempRegra;
end;

procedure TfrmMapaMovimentacao.btnEscolheDirClick(Sender: TObject);
begin
  inherited;
  dlgCaminho.Directory := edtDiretorio.Text;
  if dlgCaminho.Execute then
    edtDiretorio.Text := dlgCaminho.Directory;
end;

//William Moreira da Silva - SOL 260816 - PPM 1051407
procedure TfrmMapaMovimentacao.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
  inherited;

  molContratoEmptmo.btnBuscaContratoClick(Sender);

end;

procedure TfrmMapaMovimentacao.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
  inherited;

  molContratoEmptmo.btnLimpaContratoClick(Sender);
end;
//William Moreira da Silva - SOL 260816 - PPM 1051407

// Inicio SIG 123193 Ferrari

procedure TfrmMapaMovimentacao.chkInArquivoClick(Sender: TObject);
begin
  inherited;
  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then begin
    chkNotInArquivo.Checked := false;
  end;

end;

procedure TfrmMapaMovimentacao.chkNotInArquivoClick(Sender: TObject);
begin
  inherited;
  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then begin
    chkInArquivo.Checked := false;
  end;

end;
// Fim SIG 123193


procedure TfrmMapaMovimentacao.abreConsulta(sDataInicio, sDataFim,sDataRefer,sMesAno: string);
var
  sSql: string;     // SIG 127553
begin
  qryConsulta.Close;
  //Início - William Santana - SOL 264899 PPM 1177362
  qryConsulta.SQL.text := qryConsultaOri.SQL.text;
  if molContratoEmptmo.IDContrato > 0 then
  begin
    sSql :=  qryConsulta.SQL.text;        // SIG 127553
    sSql :=  StringReplace(sSQL, 'WHERE 1=1', ' WHERE M.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO ', [rfReplaceAll]);    // SIG 127553
//    qryConsulta.SQL.Add(' AND IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO ');
    qryConsulta.SQL.text := sSql;   // SIG 127553
    qryConsulta.ParamByName('IDCONTRATOEMPTMO').AsString := floattostr(molContratoEmptmo.IDContrato);
  end
  //Término - William Santana - SOL 264899 PPM 1177362
  // Inicio SIG 123193 Ferrari
  Else if ((chkInArquivo.Checked) or (chkNotInArquivo.Checked)) then
    Begin
      sSql :=  qryConsulta.SQL.text;        // SIG 127553
      sSql :=  StringReplace(sSQL, 'WHERE 1=1', ' WHERE ( (:PINARQUIVO IS NULL) OR (:PINARQUIVO IS NOT' +
        ' NULL AND M.IDCONTRATOEMPTMO IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD)) )' +
        '   AND ( (:PNOTINARQUIVO         IS NULL) OR (:PNOTINARQUIVO IS ' +
        'NOT NULL AND M.IDCONTRATOEMPTMO NOT IN (SELECT IDCONTRATOEMPTMO ' +
        'FROM CM.CONTRATOAD)) ) ', [rfReplaceAll]);    // SIG 127553
      qryConsulta.SQL.text := sSql;   // SIG 127553
      if chkInArquivo.Checked then
        qryConsulta.parambyName('PINARQUIVO').AsString          := '1'
      else
        qryConsulta.parambyName('PINARQUIVO').AsString          := '';
      if chkNotInArquivo.Checked then
        qryConsulta.parambyName('PNOTINARQUIVO').AsString       := '1'
      else
        qryConsulta.parambyName('PNOTINARQUIVO').AsString       := '';
    end ;

  // Fim SIG 123193
  //leandro wo4233 inicio   aqui
  qryConsulta.ParamByName('DATAINICIO').Value := sDataInicio;
  qryConsulta.ParamByName('DATAFIM').Value := sDataFim;
  //leandro wo4233 fim
  qryConsulta.ParamByName('DATAREF').Value := sDataRefer;
  qryConsulta.ParamByName('MESANO').Value := sMesAno;     // SIG 127553
  qryConsulta.SQL.SaveToFile(Sistema.TempDir + 'mapa.txt');
  qryConsulta.Open;
{
  with qryConsultaNova do
    begin
      Close;
      ConnectionString := Autorizacao.getStringConexaoADO;
      SQL.clear;
      SQL.add(qryConsultaOri.SQL.text);
      Parameters.ParamByName('MESANO').Value     := sMesAno;
      Parameters.ParamByName('DATAREF').Value    := sDataRefer;
      Parameters.ParamByName('DATAINICIO').Value := sDataInicio;
      Parameters.ParamByName('DATAFIM').Value    := sDataFim;
      sql.add('select * from pessoa where idpessoa = 1');
      Open;
    end;
  dsConsulta.DataSet:= qryConsultaNova;
}

end;

end.

