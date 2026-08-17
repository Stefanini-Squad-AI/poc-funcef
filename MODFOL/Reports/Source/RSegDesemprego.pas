unit RSegDesemprego;
                     
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppVar, ppReport, ppStrtch, ppSubRpt, ppClass, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, uCmRptManager, TXComp, CmParamReport, uCtrlParamSegDes, TXRB;

type
  TRptSegDesemprego = class(TFrmCmReport)
    rpSegDesemprego: TppReport;
    rpCompSaldoDtlBnd: TppDetailBand;
    ppSegDesemprego: TppBDEPipeline;
    dsSegDesemprego: TwwDataSource;
    sqlSegDesemprego: TCMSqlParams;
    CdsSegDesemprego: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    CdsSegDes: TCMClientDataSet;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    CtrlParamSegDes: TCtrlParamSegDes;

    ListaIdEstab, ListaIdFunc, AnoMes, ListaIdRubricaMesRescisao,
    ListaIdRubricaOutrosMeses, NumAgenciaBanc, NomeAgenciaBanc: string;
    TipoImpressaoAgenciaBanc: byte;
    DataRef: TDateTime;
  end;

var
  RptSegDesemprego: TRptSegDesemprego;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uCtrlCustomRH;

{$R *.DFM}

procedure TRptSegDesemprego.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamSegDes := TCtrlParamSegDes.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlParamSegDes.InitializeAs(Padroes);
end;

procedure TRptSegDesemprego.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamSegDes);
  inherited;
end;

procedure TRptSegDesemprego.CrmRptCMBeforePrint(Sender: TObject);
{-->}function GetCodigoCBO(CBO: string): string;
     var
       c: byte;
     begin
       Result := '';
       if CBO = '' then
         exit;
       for c:=0 to 5 do
         Result := Result + CBO[c];

       Result := CtrlParamSegDes.TrataDados(Result,'A',5);
{-->}end;

{-->}function GetDigitoCBO(CBO: string): string;
     begin
       Result := '';
       if CBO = '' then
         exit;
       Result := CtrlParamSegDes.TrataDados(CBO[Length(CBO)],'A',1);
{-->}end;

begin
  inherited;
  CdsSegDes.Data := CtrlParamSegDes.ListSegDes(ListaIdEstab, ListaIdFunc, AnoMes,
    ListaIdRubricaMesRescisao, ListaIdRubricaOutrosMeses, TipoImpressaoAgenciaBanc,
    NumAgenciaBanc, NomeAgenciaBanc);

  sqlSegDesemprego.Open;
  // ------------------------------------------------------------------
  // Geração do Relatório para a Pessoa atualmente posicionada na Query
  // ------------------------------------------------------------------
  while not(CdsSegDes.EOF) do
  begin
    CdsSegDesemprego.Append;
    // Nome
    CdsSegDesemprego.FieldByName('EMPREGADO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('EMPREGADO').asString,'A',40);

    // Nome da Mãe
    CdsSegDesemprego.FieldByName('MAE').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('MAE').asString,'A',40);

    // Endereço
    CdsSegDesemprego.FieldByName('ENDERECO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('ENDERECO').asString,'A',40);

    // Complemento
    CdsSegDesemprego.FieldByName('COMPLEMENTO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('COMPLEMENTO').asString,'A',19);

    // CEP
    CdsSegDesemprego.FieldByName('CEP1').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('CEP1').asString,'A',6);
    CdsSegDesemprego.FieldByName('CEP2').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('CEP2').asString,'A',3);

    // UF
    CdsSegDesemprego.FieldByName('UF').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('UF').asString,'A',3);

    // Telefone
    CdsSegDesemprego.FieldByName('TELEFONE').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('TELEFONE').asString,'A',10);

    // PIS/PASEP/NIT
    CdsSegDesemprego.FieldByName('PIS').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('PIS').asString,'A',13);

    // CTPS
    CdsSegDesemprego.FieldByName('CTPS1').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('CTPS').asString,'N',7);
    CdsSegDesemprego.FieldByName('CTPS2').asString :=
      CtrlParamSegDes.TrataDados(FU.UltimosCaracteres(CdsSegDes.FieldByName('CTPS').asString,3),'N',3);
    CdsSegDesemprego.FieldByName('CTPS_UF').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('CTPS_UF').asString,'A',2);

    // CPF
    CdsSegDesemprego.FieldByName('CPF').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('CPF').asString,'A',11);

    // Tipo da Inscrição da Empresa
    CdsSegDesemprego.FieldByName('TIPO_INSC_EMPRESA').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('TIPINSCEMP').asString,'A',1);

    // Inscrição da Empresa
    CdsSegDesemprego.FieldByName('INSC_EMPRESA').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('INSCEMP').asString,'A',16);

    // Atividade Econômica
    CdsSegDesemprego.FieldByName('CNAE').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('CNAE').asString,'A',5);

    // CBO
    CdsSegDesemprego.FieldByName('CBO1').asString :=
      GetCodigoCBO(CdsSegDes.FieldByName('CBO').asString);
    CdsSegDesemprego.FieldByName('CBO2').asString :=
      GetDigitoCBO(CdsSegDes.FieldByName('CBO').asString);

    // Ocupação
    CdsSegDesemprego.FieldByName('OCUPACAO').asString :=
      FU.Alinha(Copy(CdsSegDes.FieldByName('OCUPACAO').asString,1,35),35,'E',' ');

    // Data de Admissão
    CdsSegDesemprego.FieldByName('ADMISSAO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('ADMISSAO').asString,'A',6);

    // Data de Demissão
    CdsSegDesemprego.FieldByName('DEMISSAO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('DEMISSAO').asString,'A',6);

    // Sexo
    CdsSegDesemprego.FieldByName('SEXO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('SEXO').asString,'A',1);

    // Grau de Instrução
    CdsSegDesemprego.FieldByName('GRAU_INSTRUCAO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('GRAUINSTRU').asString,'A',1);

    // Data de Nascimento
    CdsSegDesemprego.FieldByName('NASCIMENTO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('NASCIMENTO').asString,'A',6);

    // Horas Trabalhadas Semanais
    CdsSegDesemprego.FieldByName('HORA_TRAB_SEMANA').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('HORASEMANA').asString,'A',2);

    // Mês + Antepenúltimo Sal.
    CdsSegDesemprego.FieldByName('MES_ANTEPENULT_SALARIO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('MES_ANTEPENULT_SALARIO').asString,'A',2);
    CdsSegDesemprego.FieldByName('ANTEPENULT_SALARIO').asString :=
      CtrlParamSegDes.TrataDados(FormatFloat('#########0.00',
                 CdsSegDes.FieldByName('ANTEPENULT_SALARIO').asFloat),'N',10);

    // Mês + Penúltimo Sal.
    CdsSegDesemprego.FieldByName('MES_PENULT_SALARIO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('MES_PENULT_SALARIO').asString,'A',02);
    CdsSegDesemprego.FieldByName('PENULT_SALARIO').asString :=
      CtrlParamSegDes.TrataDados(FormatFloat('#########0.00',
                 CdsSegDes.FieldByName('PENULT_SALARIO').asFloat),'N',10);

    // Mês + Último Sal.
    CdsSegDesemprego.FieldByName('MES_ULT_SALARIO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('MES_ULT_SALARIO').asString,'A',02);
    CdsSegDesemprego.FieldByName('ULT_SALARIO').asString :=
      CtrlParamSegDes.TrataDados(FormatFloat('#########0.00',
                 CdsSegDes.FieldByName('ULT_SALARIO').asFloat),'N',10);

    // Soma dos 3 Últimos Salários
    CdsSegDesemprego.FieldByName('SOMA_3_ULT_SAL').asString :=
      CtrlParamSegDes.TrataDados(FormatFloat('#########0.00',
        CdsSegDes.FieldByName('ULT_SALARIO').asFloat+
        CdsSegDes.FieldByName('PENULT_SALARIO').asFloat+
        CdsSegDes.FieldByName('ANTEPENULT_SALARIO').asFloat),'N',10);

    // Nº Banco
    CdsSegDesemprego.FieldByName('N_BANCO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('N_BANCO').asString,'A',3);

    // Nº Agência
    CdsSegDesemprego.FieldByName('N_AGENCIA1').asString :=
      CtrlParamSegDes.TrataDados(Trim(CdsSegDes.FieldByName('N_AGENCIA').asString),'A',4);
    CdsSegDesemprego.FieldByName('N_AGENCIA2').asString :=
      CtrlParamSegDes.TrataDados(FU.UltimosCaracteres(CdsSegDes.FieldByName('N_AGENCIA').asString,1),'A',1);

    // Qtd Meses trabalhados nos Últimos 36 meses
    CdsSegDesemprego.FieldByName('QUANT_TRAB_36MESES').asString :=
      CtrlParamSegDes.TrataDados(
        FU.IFF((CdsSegDes.FieldByName('AVISOPREVIO').asString='1') and
           (CdsSegDes.FieldByName('QUANT_TRAB_36MESES').asInteger < 36),
           IntToStr(CdsSegDes.FieldByName('QUANT_TRAB_36MESES').asInteger+1),
               FU.PoeZero(CdsSegDes.FieldByName('QUANT_TRAB_36MESES').asInteger)),'A',2);

    // Recebeu Salário nos Últimos 6 meses?
    CdsSegDesemprego.FieldByName('RECEB_SAL_6_MESES').asString :=
      '1';
      //CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('RECEB_SAL_6_MESES').asString ,'A',1);

    // Aviso Prévio Indenizado?
    CdsSegDesemprego.FieldByName('AVISO_PREVIO').asString :=
      CtrlParamSegDes.TrataDados(CdsSegDes.FieldByName('AVISOPREVIO').asString,'A',1);

    // Estabelecimento
    CdsSegDesemprego.FieldByName('ESTABELECIMENTO').asString :=
      CdsSegDes.FieldByName('ESTAB').asString;

    // Local e Data da impressão
    CdsSegDesemprego.FieldByName('LOCAL_DATA').asString :=
      FU.Alinha(CdsSegDes.FieldByName('CIDADE').asString,17,'E',' ')+
      FU.Replicate(' ',1)+
      FU.PoeZero(FU.ExtraiDia(DataRef))+
      FU.Replicate(' ',3)+
      FU.PoeZero(FU.ExtraiMes(DataRef))+
      FU.Replicate(' ',3)+
      IntToStr(FU.ExtraiAno(DataRef));

    CdsSegDesemprego.Post;
    CdsSegDes.Next;
  end;
  CdsSegDesemprego.First;
end;

end.
