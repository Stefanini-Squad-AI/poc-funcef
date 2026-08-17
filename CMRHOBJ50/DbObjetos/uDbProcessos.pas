unit uDbProcessos;

{**********************************ALTERAÇÔES**********************************}
{******************************************************************************}
{******************************************************************************}

{*******************************************************************************
  N. SIG..........   : 70569
  Data da Alteração: : 14/08/2019
  Responsável:       : Everson Cunha
  Descrição.......   : Melhorias no cadastro de processos
********************************************************************************
  Rotina             : Create
  N. SIG..........   : 38475.59780
  Data da Alteração: : 11/12/2017
  Alteração Form:    : uDbProcessos
  Responsável:       : Cássio Florêncio Rovaroto
  Descrição.......   : Adaptações no tratamento da tabela PROCESSOS.
********************************************************************************
  Nº SOL: 250384.17324
  Nº PPM 1070235
  Data da Alteração: 12/02/2016
  Alteração Form: Leiaute e campos novos
  Responsável: Michelle Suellyn Mota
  Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
********************************************************************************
  Nº SOL:            256944/17800
  Nº PPM             1082911
  Data da Alteração: 27/10/2015
  Responsável:       Marcelo Cardoso
  Descrição:         Criação da aba ACT
********************************************************************************
  Rotina:            ListProcessos, ProcessaOutros
  Nº SOL:            250383.17344
  Nº PPM             839025
  Data da Alteração: 25/06/2015
  Alteração Form:    eSocial, Criação e alteração dos metodos para aba processo.
  Responsável:       Higor Nayde
  Descrição:         deve ser adequada a folha de pagamento ao eSocial para
                     atendimento ao S1070 e S1299
********************************************************************************
  Rotina:            -
  Nº SOL:            229871/16137
  Nº PPM             407073
  Data da Alteração: 20/08/2014
  Alteração Form:    Criação da Db.
  Responsável:       Felipe A. Santos
  Descrição:         deve ser adequada a folha de pagamento ao eSocial para
                     atendimento ao Ato Declaratório Executivo SUFIS nº 5, de
                     17 de Julho de 2013 que aprovae divulga os leiautes do
                     eSocial.
*******************************************************************************}

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
    TDbProcessos = class(TCmDbObject)

    private
      FExtenDecisao: TCmDbField;
      FIdFilialPessoa: TCmDbField;
      FIndicatDeposito: TCmDbField;
      FTipo: TCmDbField;
      FCodIdentVara: TCmDbField;
      FDataDecisao: TCmDbField;
      FContriAbranDecisao: TCmDbField;
      FNumero: TCmDbField;
      //FIndicatDecisao: TCmDbField; //Everson Cunha - SIG70569
      FIdProcesso: TCmDbField;
      FIdCidades: TCmDbField;
       FProcAdmJud: TCmDbField; // Felipe A. Santos - SOL229871.16624 PPM 557813
      //Higor Nayde SOL 250383.17344 Nº PPM             839025
      FAUTORACAO: TCmDbField;
      //FINDSUSP: TCmDbField;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      FIDINDICATIVOSUSP: TCmDbField;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      //FAPURFAP: TCmDbField; //Everson Cunha - SIG70569
      //Higor Nayde SOL 250383.17344 Nº PPM             839025
      FDataInicio: TCmDbField;  //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
      FDataFim: TCmDbField ;    //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
      FIdFuncionario: TCmDbField;
    	FCodMatProc: TCmDbField;
    protected
      function Insert : boolean; override;

    public
      constructor Create(AOwner: TCmCustomCdbObject); override;

      property IdProcesso : TCmDbField  read FIdProcesso write FIdProcesso;
      property IdFilialPessoa : TCmDbField  read FIdFilialPessoa write FIdFilialPessoa;
      property Tipo : TCmDbField  read FTipo write FTipo;
      property Numero : TCmDbField  read FNumero write FNumero;
      //property IndicatDecisao : TCmDbField  read FIndicatDecisao write FIndicatDecisao; //Everson Cunha - SIG70569
      property DataDecisao : TCmDbField  read FDataDecisao write FDataDecisao;
      property IndicatDeposito : TCmDbField  read FIndicatDeposito write FIndicatDeposito;
      property CodIdentVara : TCmDbField  read FCodIdentVara write FCodIdentVara;
      property ContriAbranDecisao : TCmDbField  read FContriAbranDecisao write FContriAbranDecisao;
      property ExtenDecisao : TCmDbField  read FExtenDecisao write FExtenDecisao;
      property IdCidades : TCmDbField  read FIdCidades write FIdCidades;

      property ProcAdmJud : TCmDbField  read FProcAdmJud write FProcAdmJud; // Felipe A. Santos - SOL229871.16624 PPM 557813
      //Higor Nayde SOL 250383.17344 Nº PPM             839025
      property AUTORACAO : TCmDbField  read FAUTORACAO write FAUTORACAO;
      //property INDSUSP : TCmDbField  read FINDSUSP write FINDSUSP;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      property IDINDICATIVOSUSP : TCmDbField  read FIDINDICATIVOSUSP write FIDINDICATIVOSUSP;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      //property APURFAP : TCmDbField  read FAPURFAP write FAPURFAP; //Everson Cunha - SIG70569
      //Higor Nayde SOL 250383.17344 Nº PPM             839025
      property DataInicio : TCmDbField  read FDataInicio write FDataInicio; ////Marcelo Cardoso - SOL:256944/17800 PPM:1082911
      property DataFim : TCmDbField  read FDataFim write FDataFim;          ////Marcelo Cardoso - SOL:256944/17800 PPM:1082911
      property IdFuncionario : TCmDbField  read FIdFuncionario write FIdFuncionario;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
      property CodMatProc : TCmDbField read FCodMatProc write FCodMatProc; //Cássio Rovaroto - SIG nº 38475.59780
    end;


implementation

{ TDbProcessos }

constructor TDbProcessos.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'PROCESSOS';

  FIdProcesso := CreateCmDbField('IDPROCESSO', ftFloat, True, True, False, False, '');
  FIdFilialPessoa := CreateCmDbField('IDFILIALPESSOA', ftFloat, False, False, False, True, '');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  FTipo := CreateCmDbField('TIPO', ftString, False, False, False, True, '');
  FNumero := CreateCmDbField('NUMERO', ftString, False, False, False, True, '');
  //FIndicatDecisao := CreateCmDbField('INDICATDECISAO', ftString, False, False, False, True, ''); //Everson Cunha - SIG70569
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  //FDataDecisao := CreateCmDbField('DATADECISAO', ftDatetime, False, False, False, True, '');
  //FIndicatDeposito := CreateCmDbField('INDICATDEPOSITO', ftFloat, False, False, False, False, '');
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
  FCodIdentVara := CreateCmDbField('CODIDENTVARA', ftFloat, False, False, False, True, '');
  FContriAbranDecisao := CreateCmDbField('CONTRIABRANDECISAO', ftString, False, False, False, True, '');
  FExtenDecisao := CreateCmDbField('EXTENDECISAO', ftString, False, False, False, True, '');
  FIdCidades := CreateCmDbField('IDCIDADES', ftFloat, False, False, False, True, '');

  FProcAdmJud := CreateCmDbField('PROCADMJUD', ftFloat, False, False, False, True, ''); // Felipe A. Santos - SOL229871.16624 PPM 557813

  //Higor Nayde SOL 250383.17344 Nº PPM             839025
  FAUTORACAO := CreateCmDbField('AUTORACAO', ftString, False, False, False, True, '');
  //FINDSUSP := CreateCmDbField('INDSUSP', ftFloat, False, False, False, True, '');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  //FIDINDICATIVOSUSP := CreateCmDbField('IDINDICATIVOSUSP', ftFloat, False, False, False, True, '');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
  //FAPURFAP := CreateCmDbField('APURFAP', ftFloat, False, False, False, True, ''); //Everson Cunha - SIG70569
  //Higor Nayde SOL 250383.17344 Nº PPM             839025
  FDataInicio := CreateCmDbField('DATAINICIO', ftDateTime, False, False, False, True, ''); //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  FDataFim := CreateCmDbField('DATAFIM', ftDateTime, False, False, False, True, '');       //Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  FIdFuncionario := CreateCmDbField('IDFUNCIONARIO', ftFloat, False, False, False, True, '');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  FCodMatProc := CreateCmDbField('CODMATPROC', ftFloat, false, false, false, true, '');//Cássio Rovaroto - SIG nº 38475.59780
end;


function TDbProcessos.Insert: boolean;
begin
 Result := inherited Insert;
end;

end.
