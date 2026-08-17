unit UConsAvancPrev;

interface

uses SysUtils;

const
    // Constantes com os nomes das tabelas
    Pessoa             = ' PESSOA';           // P
    PessoaFis          = ' PESSOAFISICA';     // PF
    Patro              = ' PESSOA';           // Patro
    ElegPatro          = ' ELEGPATRO';        // E
    //GrInstr            = ' GRINSTR';          // G
    PartPrevPlan       = ' PARTPREVPLAN';     // PP
    Depen              = ' DEPEN';            // TD
    Depentit           = ' DEPENTIT';         // D
    //BfciarioTitPlan    = ' BFCIARIOTITPLAN';  // B
    //ContPrev           = ' CONTPREV';         // C
    //HstContribPrev     = ' HSTCONTRIBPREV';   // HSTC
    //BenefPlanPrev      = ' BENEFPLANPREV';    // BF
    //BenefBfciario      = ' BENEFBFCIARIO';    // BB
    //HstBenefBfciario   = ' HSTBENEFBFCIARIO'; // HSTB
    //SitPart            = ' SITPLANOPREV ';
    //Cobranca           = ' COBRANCA';

    codString    = 'S';    // String
    codData      = 'D';    // Data
    codSexo      = 'Sexo'; // Sexo
    codIdade     = 'IC';   // Idade Calculada
    codTempoServ = 'TS';   // Tempo de Servico
    codEstCivil  = 'EC';   // Estado Civil
    codFlag      = 'F';    // Flag
    codMes       = 'M';    // Ano-Mes
    codNumero    = 'N';    // Numero

    // Constantes com o tamanho dos vetores de campos das tabelas
    tamParticipante = 10;
    tamDependente = 11;
    tamBeneficiario = 6;
    //tamContribuicao = 4;
    //tamBeneficio = 4;

    // Vetores com os nomes dos campos a disponibilizar e vetores com nomes
    //  fisicos correspondentes destes campos na base de dados
    aParticipante : array[0..tamParticipante,0..2] of string =
     (('Nome do Participante'       ,PESSOA+'.NOME '                  ,codString ),
      ('Matric. na Patroc.'         ,ELEGPATRO+'.Matricula '          ,codString ),
      ('CPF do Participante'        ,PESSOA+'.NUMDOCUMENTO '          ,codString ),
      ('Data Nasc. do Participante' ,PESSOAFis+'.DataNasc '           ,codData ),
      ('Sexo do Participante'       ,PESSOAFis+'.Sexo '               ,codSexo),
      ('Idade do Participante'      ,'CALC_IDADE'                     ,CodIdade),
      ('Tempo de Serviço '          ,ELEGPATRO+'.DataAdmissao'        ,codTempoServ),
      ('Estado Civil'               ,PESSOAFis+'.EstCivil '           ,codEstCivil ),
      ('Data de Assistido'          ,PARTPREVPLAN+'.DataInicio '      ,codData ),
      ('Data de Requer. de Insc.'   ,PARTPREVPLAN+'.RequerimentoData ',codData),
      ('Data de Insc.'              ,PARTPREVPLAN+'.InscricaoData '   ,codData));
    aDependente   : array[0..tamDependente,0..2] of string =
      (('Nome do Dependente'           ,PESSOA+'.NOME '               ,codString),
       ('CPF do Dependente'            ,PESSOA+'.NUMDOCUMENTO'        ,codString),
       ('Data Nasc. do Dependente'     ,PESSOAFis+'.DataNasc '        ,codData),
       ('Sexo do Dependente'           ,PESSOAFis+'.Sexo '            ,codSexo),
       ('Idade do Dependente'          ,'CALC_IDADE'                  ,CodIdade),
       ('Estado Civil'                 ,PESSOAFis+'.EstCivil '        ,codEstCivil),
       ('Nome do Titular'              ,PESSOA+'.NOME '               ,codString),
       ('Matric. do Titular'           ,ELEGPATRO+'.Matricula '       ,codString),
       ('Tipo de Dependência'          ,DEPEN+'.Descricao '           ,codString),
       ('Num. Sequência'               ,DEPENTIT+'.NumSequencia '     ,codNumero),
       ('Conta para IR ?'              ,DEPENTIT+'.FLGCONTAIMPOSTOR ' ,codFlag ),
       ('Conta para Sal. Família ?'    ,DEPENTIT+'.FLGCONTASALARIOF ' ,codFlag));
    aBeneficiario : array[0..tamBeneficiario,0..2] of string =
      (('Nome do Beneficiário'       ,PESSOA+'.Nome '        ,codString),
       ('CPF do Beneficiário'        ,PESSOA+'.NUMDOCUMENTO ',codString),
       ('Data Nasc. do Beneficiário' ,PESSOAFis+'.DataNasc ' ,codData),
       ('Sexo do Beneficiário'       ,PESSOAFis+'.Sexo '     ,codSexo),
       ('Idade do Beneficiário'      ,'CALC_IDADE'           ,CodIdade),
       ('Estado Civil'               ,PESSOAFis+'.EstCivil ' ,codEstCivil),
       ('Tipo de Dependência'        ,DEPEN+'.Descricao '    ,codString));
    {aContribuicao : array[0..tamContribuicao,0..2] of string =
                    (('Nome da Contribuição'         ,CONTPREV+'.NOME '                    , codString),
                     ('Tipo de Cobrança'             ,COBRANCA+'.DESCRICAO '             , codString),
                     ('Mês de Referência'            ,HSTCONTRIBPREV+'.MESREFERENCIA '        , CodMes),
                     ('Mês de Cobrança'              ,HSTCONTRIBPREV+'.MESCOBRANCA '          , CodMes),
                     ('Data de Recebimento'          ,HSTCONTRIBPREV+'.DATARECEBIMENTO '      ,codData));
    aBeneficio    : array[0..tamBeneficio,0..2] of string =
                    (('Nome do Benefício'            ,BENEFPLANPREV+'.DESCRICAO '              ,codString),
                     ('Data de Requerimento'         ,BENEFBFCIARIO+'.DATAREQUERIMENTO '       ,codData),
                     ('Data de Início'               ,BENEFBFCIARIO+'.DATAINICIO '             ,codData),
                     ('Mês de Pagamento'             ,HSTBENEFBFCIARIO+'.MES '                  ,CodMes),
                     ('Data de Pagamento'            ,HSTBENEFBFCIARIO+'.DATAPAGAMENTO '        ,codData));}
    function IdadeIgual(nomeCampo,sIdade : string): string;
    function SQLIdade(var bSair : boolean; nomeCampo, sIdade : string; indSinal : integer) : string;
    function SQLTempoServ(nomeCampo, sTempoServ : string; indSinal : integer) : string;

implementation

function IdadeIgual(nomeCampo, sIdade : string) : string;
var sDataNasc : string;
    idiaNasc, iMesNasc, iAnoNasc  : word;
    iIdade : integer;
begin
    // Idade = X - (AnoAtual - Idade - 1) + 1 dia
    Result := '';
    iIdade := StrToInt(sIdade);
    DecodeDate(Date,iAnoNasc,iMesNasc,iDiaNasc);
    iAnoNasc := iAnoNasc-iIdade-1;
    iDiaNasc := iDiaNasc + 1;
    sDataNasc := IntToStr(iDiaNasc);

    if Length(IntToStr(iMesNasc)) < 2 then
      sDataNasc := sDataNasc+'/0'+IntToStr(iMesNasc)
    else
      sDataNasc := sDataNasc+'/'+IntToStr(iMesNasc);
    sDataNasc := sDataNasc+'/'+IntToStr(iAnoNasc);

    result := '('+nomeCampo+'>= To_Date('''+sDataNasc+''',''dd/MM/yyyy'') AND '+
              nomeCampo+'<= To_Date('''+DateToStr(Date)+''',''dd/MM/yyyy'') )';
end;

function SQLIdade(var bSair : boolean; nomeCampo, sIdade : string; indSinal : integer) : string;
var sSQL : string;
begin
     // Colocar sinal do campo no Resultado
     case indSinal of
        0 : begin // =
              bSair := true;
              sSQL := IdadeIgual(nomeCampo,sIdade);
            end;
        1 : begin // >
              bSair := false;
              sSQL := nomeCampo;
              sSQL := sSQL + ' <  ';
            end;
        2 : begin // <
              bSair := false;
              sSQL := nomeCampo;
              sSQL := sSQL + ' >  ';
            end;
        3 : begin // >=
              bSair := false;
              sSQL := nomeCampo;
              sSQL := sSQL + ' <= ';
            end;
        4 : begin // <=
              bSair := false;
              sSQL := nomeCampo;
              sSQL := sSQL + ' >= ';
            end;
     end;
     result := sSQL;
end;

function SQLTempoServ(nomeCampo, sTempoServ : string; indSinal : integer) : string;
var sSQL, sDataIni, sDataFim : string;
    iTempoServ : integer;
    iDia, iMes, iAno, idiaServ, iMesServ, iAnoServ  : word;
begin
    // TempoServ = (AnoAtual - X(sTempoServ)
    Result := '';
    iTempoServ := StrToInt(sTempoServ);

    DecodeDate(Date, iAnoServ, iMesServ, iDiaServ);
    // Exemplo : Hoje = 14/10/97
    case indSinal of
        0 : begin // =     DataIni = 15/10/93 e DataFim = 14/10/94
              // limite inicial
              iDia := iDiaServ + 1;
              iMes := iMesServ;
              iAno := iAnoServ - iTempoServ - 1;
              sDataIni := IntToStr(iDia);

              if Length(IntToStr(iMes)) < 2 then
                sDataIni := sDataIni+'/0'+IntToStr(iMes)
              else
                sDataIni := sDataIni+'/'+IntToStr(iMes);
              sDataIni := sDataIni+'/'+IntToStr(iAno);

              // limite final
              iDia := iDiaServ;
              iMes := iMesServ;
              iAno := iAnoServ - iTempoServ;
              sDataFim := IntToStr(iDia);

              if Length(IntToStr(iMes)) < 2 then
                sDataFim := sDataFim+'/0'+IntToStr(iMes)
              else
                sDataFim := sDataFim+'/'+IntToStr(iMes);
              sDataFim := sDataFim+'/'+IntToStr(iAno);

              sSQL := '('+nomeCampo +' >= To_Date('''+sDataIni+''',''dd/MM/yyyy'') AND '+
                      nomeCampo +' <= To_Date('''+sDataFim+''',''dd/MM/yyyy'') ) ';
            end;
        1 : begin // >    DataFim < 15/10/93
              // limite final
              iDia := iDiaServ + 1;
              iMes := iMesServ;
              iAno := iAnoServ - iTempoServ - 1;
              sDataFim := IntToStr(iDia);

              if Length(IntToStr(iMes)) < 2 then
                sDataFim := sDataFim+'/0'+IntToStr(iMes)
              else
                sDataFim := sDataFim+'/'+IntToStr(iMes);
              sDataFim := sDataFim+'/'+IntToStr(iAno);

              sSQL := nomeCampo +' < To_Date('''+sDataFim+''',''dd/MM/yyyy'')  ';
            end;
        2 : begin // <    DataIni > 14/10/94
              // limite inicial
              iDia := iDiaServ;
              iMes := iMesServ;
              iAno := iAnoServ - iTempoServ;
              sDataFim := IntToStr(iDia);

              if Length(IntToStr(iMes)) < 2 then
                sDataFim := sDataFim+'/0'+IntToStr(iMes)
              else
                sDataFim := sDataFim+'/'+IntToStr(iMes);
              sDataFim := sDataFim+'/'+IntToStr(iAno);

              sSQL := nomeCampo +' > To_Date('''+sDataFim+''',''dd/MM/yyyy'')  ';
            end;
        3 : begin // >=    DataFim <= 14/10/94
              // limite final
              iDia := iDiaServ;
              iMes := iMesServ;
              iAno := iAnoServ - iTempoServ;
              sDataFim := IntToStr(iDia);

              if Length(IntToStr(iMes)) < 2 then
                sDataFim := sDataFim+'/0'+IntToStr(iMes)
              else
                sDataFim := sDataFim+'/'+IntToStr(iMes);
              sDataFim := sDataFim+'/'+IntToStr(iAno);

              sSQL := nomeCampo +' <= To_Date('''+sDataFim+''',''dd/MM/yyyy'')  ';
            end;
        4 : begin // <=   DataFim >= 15/10/93
              // limite final
              iDia := iDiaServ + 1;
              iMes := iMesServ;
              iAno := iAnoServ - iTempoServ - 1;
              sDataFim := IntToStr(iDia);

              if Length(IntToStr(iMes)) < 2 then
                sDataFim := sDataFim+'/0'+IntToStr(iMes)
              else
                sDataFim := sDataFim+'/'+IntToStr(iMes);
              sDataFim := sDataFim+'/'+IntToStr(iAno);

              sSQL := nomeCampo +' >= To_Date('''+sDataFim+''',''dd/MM/yyyy'') ';
            end;
    end;
    result := sSQL;
end;

end.
