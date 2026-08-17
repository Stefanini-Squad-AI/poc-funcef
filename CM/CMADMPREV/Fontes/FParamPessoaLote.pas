unit FParamPessoaLote;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ ------------------------------------------------------------------------------
Nº SIG.....: SIG TIBERO
Data.......: 05/03/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Autor(a)   : Edilaine Ferraresi
Data       : 11/11/2017
SIG        : 33979
Descricao  : Reestruturação da tela do elegível
--------------------------------------------------------------------------------
Nº SIG:........... 21866
Data da Alteração: 28/09/2016
Responsável......: Michelle Suellyn Mota
Descrição........: Mensagens com valores pós processamento de arquivo.
--------------------------------------------------------------------------------
Autor(a)    : Jonas Otavio
Data        : 04/07/2013
Pendência   : SOL 184811 KINTANA 1733497
Descricao   : Criação da Tela de importação de matriculas por lote(.txt).
-------------------------------------------------------------------------------- }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db, DBTables, Wwquery,
  Wwdbigrd, Wwdbgrid, Wwdbgrd2, DBCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppParameter, FPreview, UFuncoesUteis;

type
  TfrmParamPessoaLote = class(TfrmOkCancelar)
    ntbPessLote: TNotebook;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bbtnImprimir: TBitBtn;
    updPessoaLote: TUpdateSQL;
    dsPessoaLote: TDataSource;
    qryPessoaLote: TwwQuery;
    qryPessoaLoteSELECIONA: TFloatField;
    qryPessoaLoteMATRICULA: TStringField;
    qryPessoaLoteNOME: TStringField;
    qryPessoaLotePARAMETRO: TStringField;
    qryPessoaLoteCONTEUDO: TStringField;
    qryPessoaLoteDATAINICIO: TStringField;
    qryPessoaLoteDATAFIM: TStringField;
    qryPessoaLoteCE: TStringField;
    qryPessoaLoteNUP: TStringField;
    dbgPessoaLote: TwwDBGrid2;
    dbgAlteracao: TwwDBGrid2;
    pnlFundo2: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label50: TLabel;
    Label59: TLabel;
    lblNup: TLabel;
    lblCartaEnvio: TLabel;
    dbedValor: TwwDBEdit;
    dtInicio: TCMDateTimePicker;
    DtFim: TCMDateTimePicker;
    mmLegenda: TDBMemo;
    edtNup: TwwDBEdit;
    edtCartaEnvio: TwwDBEdit;
    DbParam: TwwDBLookupCombo;
    edValida: TDBEdit;
    qryAux: TwwQuery;
    qryImportM: TwwQuery;
    qryAux2: TwwQuery;
    qryAlteracao: TwwQuery;
    updAlteracao: TUpdateSQL;
    dsAlteracao: TDataSource;
    qryAlteracaoSELECIONA: TFloatField;
    qryAlteracaoMATRICULA: TStringField;
    qryAlteracaoNOME: TStringField;
    qryAlteracaoPARAMETRO: TStringField;
    qryAlteracaoCONTEUDO: TStringField;
    qryAlteracaoDATAINICIO: TStringField;
    qryAlteracaoDATAFIM: TStringField;
    qryAlteracaoCE: TStringField;
    qryAlteracaoNUP: TStringField;
    qryAlteracaoLEGENDA: TStringField;
    qryPessoaLoteLEGENDA: TStringField;
    qryAlteracaoIDPESSOA: TStringField;
    dsParamPessoaLote: TwwDataSource;
    ppParamPessoaLote: TppBDEPipeline;
    rpParamPessoaLote: TppReport;
    ppHeaderBand19: TppHeaderBand;
    TitRelat: TppLabel;
    rpEncPIDPIADBImage1: TppDBImage;
    ppDetailBand18: TppDetailBand;
    rpEncPIDPIADBText13: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine38: TppLine;
    ppCalc31: TppSystemVariable;
    rpEncPIDPIAGroup1: TppGroup;
    rpEncPIDPIAGroupHeaderBand1: TppGroupHeaderBand;
    rpEncPIDPIALabel5: TppLabel;
    rpEncPIDPIALabel6: TppLabel;
    rpEncPIDPIALabel7: TppLabel;
    rpEncPIDPIALabel8: TppLabel;
    rpEncPIDPIALabel9: TppLabel;
    rpEncPIDPIALabel10: TppLabel;
    ppLine37: TppLine;
    rpEncPIDPIALine1: TppLine;
    rpEncPIDPIAGroupFooterBand1: TppGroupFooterBand;
    ppCalc33: TppSystemVariable;
    ppLabel79: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppParameterList1: TppParameterList;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppParamPessoaLoteAlteracao: TppBDEPipeline;
    rpParamPessoaLoteAlteracao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel9: TppLabel;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppParameterList2: TppParameterList;
    dsParamPessoaLoteAlteracao: TwwDataSource;
    updRelatorio: TUpdateSQL;
    qryRelatorio: TwwQuery;
    qryRelatorioIDPESSOA: TStringField;
    qryRelatorioMATRICULA: TStringField;
    qryRelatorioNOME: TStringField;
    qryRelatorioLEGENDA: TStringField;
    qryRelatorioPARAMETRO: TStringField;
    qryRelatorioCONTEUDO: TStringField;
    qryRelatorioDATAINICIO: TStringField;
    qryRelatorioDATAFIM: TStringField;
    qryRelatorioCE: TStringField;
    qryRelatorioNUP: TStringField;
    dsRelatorio: TDataSource;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbParamChange(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbParamKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPessoaLote: TfrmParamPessoaLote;
  CaminhoArquivo : String;
  f:TextFile;
  linha: string;
  IdPessoa: string;
  Verific : string;
  Verific2 : string;
  NomeMatricula :string;
  NumeroMatricula :string;
  Texto, Texto2:string; // Michelle Mota - SIG 21866
  QtdReg, QtdReg2:Integer;// Michelle Mota - SIG 21866
  NumeroIdParam : string;

implementation
uses DBaseDados, FCadElegivel, FAguarde,UMensErro, FTelaAut,FCadDepenBenef;

{$R *.DFM}

procedure TfrmParamPessoaLote.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;


  CaminhoArquivo := FrmCadElegivel.arq;   // Pega o caminho do arquivo da Fcadelegivel
  QtdReg := 0; // Michelle Mota - SIG 21866
  QtdReg2 := 0; // Michelle Mota - SIG 21866

 //****************************************Tela Inicial******************************************//

If (ntbPessLote.PageIndex = 0) then
begin

   // Verificação de Conteudo
   if Trim(dbedValor.text) = '' then
    begin
        Application.MessageBox(PChar('O campo "Conteudo" não pode ser nulo'),PChar('Campo nulo'),0);
        dtInicio.SetFocus;
        Exit;
     end;
    // Verificação de Parametro
    if Trim(DbParam.Text) = '' then
     begin
        Application.MessageBox(PChar('Parâmetro não pode ser nulo.'),PChar('Campo nulo'),0);
        DbParam.SetFocus;
        Exit;
     end;
    // Verificação de Data inicio
   if Trim(dtInicio.Text) = '' then
     begin
        Application.MessageBox(PChar('Data Inicio não pode ser nula.'),PChar('Data nulo'),0);
        dtInicio.SetFocus;   // Michelle Mota - SIG21866
        Exit;
     end;
     //Verificação de data final não ser maior que inicial
     if Trim(DtFim.Text) <> '' then begin
       if DtFim.Date < DtInicio.Date Then
       begin
         Application.MessageBox(PChar('Data final não pode ser menor que a inicial.'),PChar('Data nulo'),0);
         dtFim.SetFocus;
         Exit;
        end;
     end;

    // Verificação se o campo "Validação" esta de acordo com o banco
      if (qryImportM.FieldByName('TIPO').AsString = 'F') or
        (qryImportM.FieldByName('TIPO').AsString = 'V') Then
     Begin
        if qryImportM.FieldByName('TIPO').AsString  = 'F' Then
        Begin
           if qryImportM.FieldByName('VALIDACAO').AsString <> '' then
           begin
              qryAux.SQL.Text := 'SELECT 1 FROM DUAL WHERE ' + QuotedStr(Trim(dbedValor.Text)) + ' IN '+
                                  qryImportM.FieldByName('VALIDACAO').AsString ;
              qryAux.Open;
              if qryAux.EOF Then
              Begin
                 MsgDlg('Valor não atende a Validação.','Informação',mtInformation,[mbOk,mbHelp],0);
                 dbedValor.SetFocus;
                 Exit;
              end;
           end;
         end;
       end;

     // Busca o numero do Parametro selecionado na tela principal
           qryaux.DatabaseName := 'BaseDados';
           qryaux.close;
           qryaux.sql.Clear;
           qryaux.sql.Add('SELECT IDPARAM FROM paramflagpessoa WHERE descricao = ' + QuotedStr(DbParam.text));
           qryaux.open;
           NumeroIdParam := qryaux.FieldByName('IDPARAM').AsString;

    //Abre o arquivo de texto para leitura;
           AssignFile(f,CaminhoArquivo);
           Reset(f);

        While not eof(f) do
        begin
            Readln(f,linha);

            //le do arquivo e desce uma linha. O conteúdo lido é transferido para a variável linha
            frmAguarde.Mostra('Validando o arquivo de texto...');

            //Verifica se a matricula do arquivo inserido é valida
            qryaux.DatabaseName := 'BaseDados';
            qryaux.close;
            qryaux.sql.Clear;
            qryaux.sql.Add(' select sum(tmp.qtde)from(select count(1) as qtde from depentit  ');
            qryaux.sql.Add('where matricula = ' + QuotedStr(linha));
            qryaux.sql.Add(' union all  ');
            qryaux.sql.Add('select count(1) as qtde from elegpatro   ');
            qryaux.sql.Add('where matricula =' + QuotedStr(linha) + ') tmp ');
            qryaux.open;

            Verific := 'Conteudo';   // Verifica se o Arquivo é Vazio ou Não


        if (qryaux.fieldbyname('sum(tmp.qtde)').value = 0) then
        begin
             Texto := Texto + ' / ' + linha;
             QtdReg := QtdReg + 1; // Michelle Mota - SIG21866
             Verific2 := 'Conteudo';
        end;

            // Realiza a Busca dos nomes das Matriculas inseridas para a GRID
        if (qryaux.fieldbyname('sum(tmp.qtde)').value <> 0) then
           begin

            qryaux2.DatabaseName := 'BaseDados';
            qryaux2.close;
            qryaux2.sql.Clear;
//            qryaux2.sql.Add('SELECT Nome from PESSOA PP,DEPENTIT DP,ELEGPATRO EL');  //Everson TIBERO
            qryaux2.sql.Add('SELECT pp.Nome from PESSOA PP,DEPENTIT DP,ELEGPATRO EL'); //Everson TIBERO
            qryaux2.sql.Add('WHERE  DP.MATRICULA = ' + QuotedStr(linha));
            qryaux2.sql.Add('AND    DP.IDPESSOA = PP.IDPESSOA AND PP.IDPESSOA = EL.IDPESSOA ');
            qryaux2.open;
            NomeMatricula := qryaux2.FieldByName('Nome').AsString;

            // Inserindo as informações dentro da GRID
            qryPessoaLote.Insert;
            qryPessoaLoteSeleciona.AsInteger          := 1;
            qryPessoaLoteMatricula.AsString           := linha;
            qryPessoaLoteNome.AsString                := NomeMatricula;
            qryPessoaLoteParametro.AsString           := NumeroIdParam;
            qryPessoaLoteConteudo.AsString            := dbedValor.text;
            qryPessoaLoteDatainicio.AsString          := Dtinicio.text;
            qryPessoaLoteDatafim.AsString             := DtFim.text;
            qryPessoaLoteCE.AsString                  := edtCartaEnvio.text;
            qryPessoaLoteNUP.AsString                 := edtNup.text;
            qryPessoaLoteLegenda.AsString             := mmLegenda.text ;
            qryPessoaLote.Post;
            Texto2 := Texto2 + ' / ' + linha;
            QtdReg2 := QtdReg2 + 1;
         end;

     end;

     // Validação para arquivo que não possui matriculas divergentes
     if (Verific = 'Conteudo') and (Verific2 = '') then
     begin
          Closefile(f);
          frmAguarde.Apaga;
          ntbPessLote.PageIndex := 1;
          ntbPessLote.Show;
          bbtnImprimir.Visible := true;

      end;

      // Validação para Arquivos que possuem matriculas divergentes
      if (Verific = 'Conteudo') and (Verific2 = 'Conteudo') then
      begin

           Closefile(f);
           frmAguarde.Apaga;
           //ShowMessage('Matriculas não cadastradas: ' + Texto + '.'); // Michelle Mota - SIG 21866
           ntbPessLote.PageIndex := 1;
           ntbPessLote.Show;
           bbtnImprimir.Visible := true;

      end;

      {Início - Michelle Mota - SIG 21866}
      if QtdReg2 <> 0 then
        ShowMessage('Parâmetros cadastrados com sucesso: < Matricula(s) ' + Texto2 + '. Total de Registros: ' + IntToStr(QtdReg2) ); // Michelle Mota - SIG 21866

      if QtdReg <> 0 then
      begin
        ShowMessage('Parâmetros não cadastrados: < Matricula(s) ' + Texto + '. Total de Registros: ' + IntToStr(QtdReg) ); // Michelle Mota - SIG 21866
        //edilaine - SIG33979 - inicio
        CaminhoArquivo := RetornaCaminhoDesktop+'\Arquivo de Críticas Importação de Parâmetros de Pessoas.txt';
        AssignFile(f, CaminhoArquivo);
        Rewrite(f);
        Writeln(f, Texto);
        Closefile(f);
        //edilaine - SIG33979 - fim
      end;
      {Término - Michelle Mota - SIG 21866}

       //Validação para arquivo vazio
      if (Verific = '') and (Verific2 = '') then
      begin
           Application.MessageBox(PChar('Arquivo escolhido encontra-se em branco, corrija e tente novamente'),PChar('Arquivo Vazio!'),0);
           Closefile(f);
           frmAguarde.Apaga;
           Close;
      end;

          Verific  := '';
          Verific2 := '';
          Texto    := '';
  end


//***********************************Segunda Tela***************************************************//

Else If (ntbPessLote.PageIndex = 1) then
begin

    qryPessoaLote.First;

    While not qryPessoaLote.eof do
    begin
         if qryPessoaLoteSeleciona.value = 0 then
            begin
              qryPessoaLote.next;
            end;

         if qryPessoaLoteSeleciona.value = 1 then
            begin
              NumeroMatricula := qryPessoaLote.FieldByName('Matricula').AsString;
           //Verifica se a matricula possui algum cadastro
              qryaux2.DatabaseName := 'BaseDados';
              qryaux2.close;
              qryaux2.sql.Clear;
              qryaux2.sql.Add('SELECT PP.* FROM DEPENTIT DP,PESSOAPARAM PP, PARAMFLAGPESSOA PF  ');
              qryaux2.sql.Add('WHERE  DP.MATRICULA =  '+QuotedStr(NumeroMatricula)+' AND     ');
              qryaux2.sql.Add('DP.IDPESSOA = PP.IDPESSOA  AND  ');
              qryaux2.sql.Add('PP.IDPARAM  = PF.IDPARAM   AND  ');
              qryaux2.sql.Add('PP.IDPARAM = '+qryPessoaLote.FieldByName('Parametro').AsString+' AND   ');
              qryaux2.sql.Add('PP.DATAINICIO = To_Date(''' + Trim(qryPessoaLote.FieldByName('Datainicio').AsString) + ''',''dd/MM/yyyy'')  ');
              qryaux2.open;
            //Faz a busca do Nome referente a Matricula
              qryaux.DatabaseName := 'BaseDados';
              qryaux.close;
              qryaux.sql.Clear;
//              qryaux.sql.Add('SELECT DP.IDPESSOA ,NOME from PESSOA PP,DEPENTIT DP,ELEGPATRO EL');    //Everson TIBERO
              qryaux.sql.Add('SELECT DP.IDPESSOA, pp.NOME from PESSOA PP, DEPENTIT DP, ELEGPATRO EL'); //Everson TIBERO
              qryaux.sql.Add('WHERE  DP.MATRICULA = ' + QuotedStr(NumeroMatricula));
              qryaux.sql.Add('AND    DP.IDPESSOA = PP.IDPESSOA AND rownum = 1 ');
              qryaux.open;
              NomeMatricula := qryaux.FieldByName('NOME').AsString;
              Idpessoa  := qryaux.FieldByName('IDPESSOA').AsString;
           //Caso a Matricula não possua conteudo na tabela é realizado a inserção na mesma
            if qryAux2.IsEmpty then
            begin
              qryaux.close;
              qryaux.sql.Clear;
              qryaux.sql.Add(' INSERT INTO PESSOAPARAM (IDPESSOA,IDPARAM,VALOR,DATAINICIO, DATAFIM,CE,NUP ,OBSERVACAO)');
              qryaux.sql.Add(' VALUES (:IDPESSOA,:IDPARAM,:VALOR,:DATAINICIO, :DATAFIM,:CE, :NUP ,:OBSERVACAO)');
              qryaux.ParamByName('IDPESSOA').AsString   := Idpessoa;
              qryaux.ParamByName('IDPARAM').AsString    := qryPessoaLote.FieldByName('Parametro').AsString;
              qryaux.ParamByName('VALOR').AsString      := qryPessoaLote.FieldByName('Conteudo').AsString;
              qryaux.ParamByName('DATAINICIO').AsString := FormatDateTime('dd/mm/yyyy', qryPessoaLote.FieldByName('Datainicio').AsDateTime);
            if (qryPessoaLote.FieldByName('Datafim').AsString <> '') then
              qryaux.ParamByName('DATAFIM').AsString    := FormatDateTime('dd/mm/yyyy', qryPessoaLote.FieldByName('Datafim').AsDateTime)
            else
              qryaux.ParamByName('DATAFIM').AsString := qryPessoaLote.FieldByName('Datafim').AsString;
              qryaux.ParamByName('CE').AsString         := qryPessoaLote.FieldByName('CE').AsString;
              qryaux.ParamByName('NUP').AsString        := qryPessoaLote.FieldByName('NUP').AsString;
              qryaux.ParamByName('OBSERVACAO').AsString := qryPessoaLote.FieldByName('Legenda').AsString;
              Verific := 'Conteudo';
              qryPessoaLote.next;
            Try
               qryaux.ExecSql;
            Except
                on E:EDBEngineError do
                begin
                     frmAguarde.Apaga;
                     MostrarErro(E);
                     Exit;
                end;
             end;
          end ;

           //Inicia a Transação e Commita
          if not dtmBaseDados.dbBaseDados.InTransaction then
          begin
                dtmBasedados.dbBaseDados.StartTransaction;
          end;


          if dtmBaseDados.dbBaseDados.InTransaction then
          begin
                dtmBasedados.dbBaseDados.Commit;
          end;


          //Preenche a Qry com as matriculas que ja possuem conteudo na tabela
          if not qryAux2.IsEmpty then
          begin
               qryAlteracao.Insert;
               qryAlteracaoSeleciona.AsInteger          := 1;
               qryAlteracaoIdPessoa.AsString            := qryaux2.FieldByName('IDPESSOA').AsString;
               qryAlteracaoMatricula.AsString           := NumeroMatricula;
               qryAlteracaoNome.AsString                := NomeMatricula;
               qryAlteracaoParametro.AsString           := qryaux2.FieldByName('IDPARAM').AsString;
               qryAlteracaoConteudo.AsString            := qryaux2.FieldByName('VALOR').AsString;
               qryAlteracaoDatainicio.AsString          := qryaux2.FieldByName('DATAINICIO').AsString;
               qryAlteracaoDatafim.AsString             := qryaux2.FieldByName('DATAFIM').AsString;
               qryAlteracaoCE.AsString                  := qryaux2.FieldByName('CE').AsString;
               qryAlteracaoNUP.AsString                 := qryaux2.FieldByName('NUP').AsString;
               qryAlteracaoLegenda.AsString             := qryaux2.FieldByName('OBSERVACAO').AsString;
               qryAlteracao.Post;
               qryPessoaLote.next;
               Verific2 := 'Conteudo';
           end;
        end;
    end;

          //Aparece a mensagem de sucesso, caso tenha sido feito algum cadastro novo
         if (Verific = 'Conteudo') and (Verific2 = '') then
         begin
              MsgDlg('Cadastro efetuado com sucesso!','Informação',mtInformation, [mbOk],0);
              bbtnSairClick(Sender);
         end
              else
         begin
              ntbPessLote.PageIndex := 2;
              ntbPessLote.Show;
         end;
end


//**********************************************Terceira Tela*****************************************//


else if (ntbPessLote.PageIndex = 2) then
begin
       Verific := '';

      if MsgDlg('Os dados serão substituidos! Deseja realmente Continuar?','Confirmação', mtConfirmation, [mbyes,mbno],0) = mryes then
      begin
           qryAlteracao.first;

      while not qryAlteracao.EOF do
             begin
                  if qryAlteracaoSeleciona.value = 0 then
                  begin
                      qryAlteracao.next;
                  end;
                  if qryAlteracaoSeleciona.value = 1 then
                  begin
                        NumeroMatricula := qryAlteracao.FieldByName('Matricula').AsString;
                        qryaux.close;
                        qryaux.sql.Clear;
                        qryaux.sql.Add('  UPDATE PESSOAPARAM PP set');
                        //qryaux.sql.Add('  IDPARAM = :IDPARAM, ');
                        qryaux.sql.Add('  VALOR = :VALOR, ');
                        //qryaux.sql.Add('  DATAINICIO = :DATAINICIO,');
                        qryaux.sql.Add('  DATAFIM = :DATAFIM,');
                        qryaux.sql.Add('  CE = :CE,');
                        qryaux.sql.Add('  NUP = :NUP,');
                        qryaux.sql.Add('  OBSERVACAO = :OBSERVACAO');
                        qryaux.sql.Add('  where PP.IDPARAM = :IDPARAM AND');
                        qryaux.sql.Add('  PP.DATAINICIO = :DATAINICIO AND');
                        qryaux.sql.Add('  PP.IDPESSOA in      ');
                        qryaux.sql.Add('  (SELECT pp.idpessoa from DEPENTIT DP,PESSOAPARAM PP, PARAMFLAGPESSOA PF      ');
                        qryaux.sql.Add('  WHERE  DP.MATRICULA = '+ QuotedStr(NumeroMatricula) +' AND                   ');
                        qryaux.sql.Add('  DP.IDPESSOA = PP.IDPESSOA AND                                                ');
                        qryaux.sql.Add('  PP.IDPARAM  = PF.IDPARAM )                                                 ');
                        qryaux.ParamByName('IDPARAM').AsString    := qryPessoaLote.FieldByName('Parametro').AsString;
                        qryaux.ParamByName('VALOR').AsString      := qryPessoaLote.FieldByName('Conteudo').AsString;
                        qryaux.ParamByName('DATAINICIO').AsString := FormatDateTime('dd/mm/yyyy', qryPessoaLote.FieldByName('Datainicio').AsDateTime);

                        if (qryPessoaLote.FieldByName('Datafim').AsString <> '') then
                           qryaux.ParamByName('DATAFIM').AsString := FormatDateTime('dd/mm/yyyy', qryPessoaLote.FieldByName('Datafim').AsDateTime)

                        else
                           qryaux.ParamByName('DATAFIM').AsString := qryPessoaLote.FieldByName('Datafim').AsString;

                        qryaux.ParamByName('CE').AsString         := qryPessoaLote.FieldByName('CE').AsString;
                        qryaux.ParamByName('NUP').AsString        := qryPessoaLote.FieldByName('NUP').AsString;
                        qryaux.ParamByName('OBSERVACAO').AsString := qryPessoaLote.FieldByName('Legenda').AsString;
                        Verific := 'Conteudo';
                        qryAlteracao.next;

                        Try
                           qryaux.ExecSql;

                           Except
                                 on E:EDBEngineError do
                                 begin
                                      MostrarErro(E);
                                      Exit;
                                      end;
                                 end;
                           end;
                        if not dtmBaseDados.dbBaseDados.InTransaction then
                        begin
                             dtmBasedados.dbBaseDados.StartTransaction;
                        end;

                        if dtmBaseDados.dbBaseDados.InTransaction then
                        begin
                             dtmBasedados.dbBaseDados.Commit;
                        end;
                    end;
                  if Verific = 'Conteudo' then
                  begin
                       if MsgDlg('Cadastro efetuado com sucesso!','Informação',mtInformation, [mbOk],0) = mrok then
                       begin
                            Close;
                       end;
                  end
                     else
                  begin
                            Close;
                  end;

                 Verific  := '';
                 Verific2 := '';
                 qryaux.close;
                 qryaux2.close;
                 NumeroIdParam := '';

            end;

      end;

 end;


procedure TfrmParamPessoaLote.FormCreate(Sender: TObject);
begin
  inherited;

     //Abrindo as Qrys da tela principal...
            qryAlteracao.close;
            qryAlteracao.open;
            qryPessoaLote.close;
            qryPessoaLote.open;
            qryImportM.close;
            qryImportM.open;
            qryRelatorio.close;
            qryRelatorio.open;
            dtinicio.text := '';
            dtfim.text := '';
            ntbPessLote.PageIndex := 0;
        //Oculta o botão imprimir na tela inicial
            if ntbPessLote.PageIndex = 0 then
            begin

                 bbtnImprimir.Visible := false;

            end;


end;

procedure TfrmParamPessoaLote.DbParamChange(Sender: TObject);
begin
  inherited;

  //  Preenchimento automatico de informações "Validação" e "Legenda" a partir do preechimento do "Parametro"
  mmLegenda.Text := qryImportM.FieldByName('LEGENDA').AsString;

  if (qryImportM.FieldByName('TIPO').AsString = 'F') or (qryImportM.FieldByName('TIPO').AsString = 'V') Then
     edValida.Text := qryImportM.FieldByName('VALIDACAO').AsString

  else

    edValida.Text := 'Não existe validação';


end;

procedure TfrmParamPessoaLote.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
       if (ntbPessLote.PageIndex = 1) then
       begin
        qryPessoaLote.First;
        qryRelatorio.Close;
        qryRelatorio.Open;
            while not qryPessoaLote.EOF do
            begin
                 if qryPessoaLoteSeleciona.value = 1 then
                 begin

                 qryRelatorio.Insert;
            //qryRelatorioIdPessoa.AsString            := qryPessoaLote.FieldByName('IDPESSOA').AsString;
                qryRelatorioMatricula.AsString           := qryPessoaLote.FieldByName('MATRICULA').AsString;
                qryRelatorioNome.AsString                := qryPessoaLote.FieldByName('NOME').AsString;
            // Busca a descrição do Parametro para o relatorio
                qryaux.DatabaseName := 'BaseDados';
                qryaux.close;
                qryaux.sql.Clear;
                qryaux.sql.Add('SELECT descricao FROM paramflagpessoa WHERE idparam = ' + QuotedStr(qryPessoaLote.FieldByName('PARAMETRO').AsString));
                qryaux.open;
                NumeroIdParam := qryaux.FieldByName('descricao').AsString;
                qryRelatorioParametro.AsString           := NumeroIdParam;
                qryRelatorioConteudo.AsString            := qryPessoaLote.FieldByName('CONTEUDO').AsString;
                qryRelatorioDatainicio.AsString          := qryPessoaLote.FieldByName('DATAINICIO').AsString;
                qryRelatorioDatafim.AsString             := qryPessoaLote.FieldByName('DATAFIM').AsString;
                qryRelatorioCE.AsString                  := qryPessoaLote.FieldByName('CE').AsString;
                qryRelatorioNUP.AsString                 := qryPessoaLote.FieldByName('NUP').AsString;
                qryRelatorioLegenda.AsString             := qryPessoaLote.FieldByName('LEGENDA').AsString;
                qryRelatorio.Post;
                qryPessoaLote.next;
                end
                else
            begin
                qryPessoaLote.next;
            end
       end;
        TFrmPreview.CreateModalPreview(self, rpParamPessoaLote, self.Caption);
  end;

  if (ntbPessLote.PageIndex = 2) then
  begin
        qryAlteracao.First;
        qryRelatorio.Close;
        qryRelatorio.Open;
        NumeroIdParam := '';
        while not qryAlteracao.EOF do
        begin
             if qryAlteracaoSeleciona.value = 1 then
             begin
                qryRelatorio.Insert;
                qryRelatorioIdPessoa.AsString            := qryAlteracao.FieldByName('IDPESSOA').AsString;
                qryRelatorioMatricula.AsString           := qryAlteracao.FieldByName('MATRICULA').AsString;
                qryRelatorioNome.AsString                := qryAlteracao.FieldByName('NOME').AsString;
                // Busca a descrição do Parametro para o relatorio
                qryaux.DatabaseName := 'BaseDados';
                qryaux.close;
                qryaux.sql.Clear;
                qryaux.sql.Add('SELECT descricao FROM paramflagpessoa WHERE idparam = ' + QuotedStr(qryAlteracao.FieldByName('PARAMETRO').AsString));
                qryaux.open;
                NumeroIdParam := qryaux.FieldByName('descricao').AsString;
                qryRelatorioParametro.AsString           := NumeroIdParam;
                qryRelatorioConteudo.AsString            := qryAlteracao.FieldByName('CONTEUDO').AsString;
                qryRelatorioDatainicio.AsString          := qryAlteracao.FieldByName('DATAINICIO').AsString;
                qryRelatorioDatafim.AsString             := qryAlteracao.FieldByName('DATAFIM').AsString;
                qryRelatorioCE.AsString                  := qryAlteracao.FieldByName('CE').AsString;
                qryRelatorioNUP.AsString                 := qryAlteracao.FieldByName('NUP').AsString;
                qryRelatorioLegenda.AsString             := qryAlteracao.FieldByName('LEGENDA').AsString;
                qryRelatorio.Post;
                qryAlteracao.next;
             end
                 else
             begin
                qryAlteracao.next;
             end
       end;
        TFrmPreview.CreateModalPreview(self, rpParamPessoaLoteAlteracao, self.Caption);
  end;

end;

procedure TfrmParamPessoaLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmParamPessoaLote.FormShow(Sender: TObject);
begin
  inherited;
  DbParam.SetFocus;
end;

procedure TfrmParamPessoaLote.DbParamKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //Key := #0;
end;

end.
