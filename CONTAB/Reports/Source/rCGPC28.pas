{ --------------------------------------------------------------------------------------------------
Rotina......: PreparaReport rCGPC28
Nº SOL......: 160035/5321
Nº KINTANA..: 1331744
Data........: 29/07/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Adequação relatórios para CNPC 01/2011
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: PreparaReport rCGPC28
Nº SOL......: 160035/5322
Nº KINTANA..: 1331675
Data........: 29/07/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Adequação relatórios para CNPC 01/2011
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: PreparaReport rCGPC28
Nº SOL......: 160035/5324
Nº KINTANA..: 1331674
Data........: 29/07/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Adequação relatórios para CNPC 01/2011
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: PreparaReport rCGPC28
Nº SOL......: 160035/5325
Nº KINTANA..: 1331751
Data........: 29/07/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Adequação relatórios para CNPC 01/2011
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CarregaDados
Nº SOL......: 147101
Nº KINTANA..: 1018514
Data........: 09/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração na forma de inclusão da tabela temporária.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CarregaDados
Nº SOL......: 143522
Nº KINTANA..: 934189
Data........: 10/09/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração da regra de arredondamento para os relatórios da CGPC28
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: SqlAssinatura
Nº SOL......: 142197
Nº KINTANA..: 906825
Data........: 23/08/2010
Responsável.: Renan Cristiano
Descrição...: Implementação nos relatórios "Demonstrativos CGPC28", inclusão do simbolo "(a)"
              na assinatura dos cargos de Diretor e Coordenador.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint
Nº SOL......: 132992, 132743
Nº KINTANA..: 770843, 767392
Data........: 10/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração dos IdReports de 20404->20406 e 20405->20407
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CarregaDados
Nº SOL......: 140612
Nº KINTANA..: 881389
Data........: 28/07/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para não exibir as casas decimais quando selecionada a opção "R$ Mil";
              Mostrar os valores negativos entre parenteses;
              Colocar o simbolo "%" após o valor da variação;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 132742, 132741, 132744, 132758, 132992, 132743
Nº KINTANA..: 767273, 767272, 767396, 767599, 770843, 767392
Data........: 21/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Relatórios para atender a CGPC28 (PreparaReportXXXXX)
              20400: (132742) Demonstração da Mutação do Ativo Líquido por Plano de Benefício
              20401: (132741) Demonstração da Mutação do Ativo Líquido
              20402: (132744) Demonstração do Plano de Gestão Administrativa (Consolidada)
              20403: (132758) Balanço Patrimonial
              20406: (132992) Demonstração das Obrigações Atuariais do Plano de Benefícios
              20407: (132743) Demonstração do Ativo Líquido por Plano de Benefícios
---------------------------------------------------------------------------------------------------}
unit rCGPC28;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, DBClient,
  uCtrlContab, uCtrlRptCGPC28, ppCtrls, ppTypes,
  ppReport, ppModule, raCodMod, ppBands, ppStrtch, ppSubRpt, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, uCmSqlParams, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppParameter;

type
  TRptCGPC28 = class(TFrmCmReport)
    CdsCGPC28: TClientDataSet;
    dtsCGPC28: TDataSource;
    ppCGPC28: TppDBPipeline;
    CdsAux: TClientDataSet;
    sqlAssinatura: TCMSqlParams;
    CdsAssinatura: TClientDataSet;
    ppAssinatura: TppDBPipeline;
    dtsAssinatura: TDataSource;
    CdsCGPC28Sinal1: TStringField;
    CdsCGPC28Descricao1: TStringField;
    CdsCGPC28DescricaoFmt1: TStringField;
    CdsCGPC28Atual1: TStringField;
    CdsCGPC28Anterior1: TStringField;
    CdsCGPC28Variacao1: TStringField;
    CdsCGPC28Sinal2: TStringField;
    CdsCGPC28Descricao2: TStringField;
    CdsCGPC28DescricaoFmt2: TStringField;
    CdsCGPC28Atual2: TStringField;
    CdsCGPC28Anterior2: TStringField;
    CdsCGPC28Variacao2: TStringField;
    rptCGPC28: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLblTitulo: TppLabel;
    ppLineCabT: TppLine;
    ppLblEmpresa: TppLabel;
    ppLineCabB: TppLine;
    ppLblTitulo2: TppLabel;
    ppLineCabL: TppLine;
    ppLineCabR: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLineDetL: TppLine;
    ppLineDetR: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine48: TppLine;
    ppLblSistema: TppLabel;
    ppLblDataHora: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    raCodeModule1: TraCodeModule;
    ppLabelOpcoes: TppLabel;
    ppDBText4: TppDBText;
    ppParameterList1: TppParameterList;
    ppLblPagina: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    //ERALDO LUIS DA SILVA SOL 160035/5321 KINTANA 1331744
    bUltNegrito: Boolean;

    iPlano: Integer;
    CtrlContab: TCtrlContab;
    CtrlRptCGPC28: TCtrlRptCGPC28;

    FDataRef1: TDateTime;
    FDataRef2: TDateTime;

    FPaginaNum: Integer;

    FContas: array of String;

    aColRpt: array of array[1..8] of String;
    aValuesRpt: array of Variant;

    function GetFmtDescricaoStyle(sValue: String): TFontStyles;

    procedure AddValues(Value: array of Variant);
    procedure CarregaDados;

    function SomaSe(sCampo: String; sContas: Variant): Double;

    procedure _ppDBTextPrint(Sender: TObject);
    procedure _ppLineLastPrint(Sender: TObject);

    procedure AddColRpt(iLinL: Integer; sCab, sCabPos, sField, sFieldPos: String; sLinBottom: String = ''; sLinTop: String = ''; iFontSize: Integer = 8);
    procedure CarregaDadosLayout;

    procedure PreparaReport20403; //132758: Balanço Patrimonial
    procedure PreparaReport20401; //132741: Demonstração da Mutação do Ativo Líquido
    procedure PreparaReport20400; //132742: Demonstração da Mutação do Ativo Líquido por Plano de Benefício
    procedure PreparaReport20406; //132992: Demonstração das Obrigações Atuariais do Plano de Benefícios
    procedure PreparaReport20402; //132744: Demonstração do Plano de Gestão Administrativa (Consolidada)
    procedure PreparaReport20407; //132743: Demonstração do Ativo Líquido por Plano de Benefícios

    procedure CarregaDadosAssinatura;

  public
    { Public declarations }
  end;

var
  RptCGPC28: TRptCGPC28;

implementation

uses DBaseDados, UData, uSistema;

{$R *.DFM}

procedure TRptCGPC28.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptCGPC28 := TCtrlRptCGPC28.Create;
  CtrlRptCGPC28.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CdsCGPC28.CreateDataSet;

  aColRpt := nil;
  FContas := nil;
  FPaginaNum := 0;
end;

procedure TRptCGPC28.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlRptCGPC28.Free;
end;

procedure TRptCGPC28.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Escolhendo um mês/ano (30/04/2010), o exercício anterior será o mês/ano anterior (31/03/2010).
  // Escolhendo um ano (2011), o exercício anterior será o ano anterior (2010)
  FDataRef1 := UltimoDiaMes(EncodeDate(StrToIntDef(CmpRptCM.ParamByName('Exercicio').AsString,0),
                                       StrToIntDef(CmpRptCM.ParamByName('Mes').AsString,12),
                                       1));

  FDataRef2 := UltimoDiaMes(EncodeDate(StrToIntDef(CmpRptCM.ParamByName('Exercicio').AsString,0),
                                       StrToIntDef(CmpRptCM.ParamByName('Mes').AsString,1),
                                       1)-1);

  // Definindo Número Inicial da Página
  FPaginaNum := StrToIntDef(CmpRptCM.ParamByName('PaginaInicial').AsString,0);

  // Definindo Plano
  iPlano := 0;
  CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa);
  if CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(FDataRef1)) Then
    iPlano := CtrlContab.PlanoData;
  if iPlano = 0 then
    iPlano := CtrlContab.PlanoParam;


  if CmpRptCM.ParamByName('Movimentacao').AsBoolean and CmpRptCM.ParamByName('RMil').AsBoolean then
    ppLabelOpcoes.Caption := 'R$ Mil'+#13+#10+'Movimentação'
  else
  if CmpRptCM.ParamByName('Movimentacao').AsBoolean then
    ppLabelOpcoes.Caption := #13+#10+'Movimentação'
  else
  if CmpRptCM.ParamByName('RMil').AsBoolean then
    ppLabelOpcoes.Caption := #13+#10+'R$ Mil'
  else
    ppLabelOpcoes.Caption := '';

  if ppLabelOpcoes.Caption = '' then
    ppLblTitulo2.Width := ppLabelOpcoes.Left + ppLabelOpcoes.Width;

  if StrToIntDef(CmpRptCM.ParamByName('Mes').AsString,0) = 0 then
    ppLblTitulo2.Caption := 'Ano do Exercício: ' + FormatDateTime('yyyy', FDataRef1) + ' ' +
                            'Ano do Exercício anterior: ' + FormatDateTime('yyyy', FDataRef2) + ' ' +
                            CmpRptCM.ParamByName('Filtro').AsString
  else
    ppLblTitulo2.Caption := 'Mês/Ano: ' + FormatDateTime('mm/yyyy', FDataRef1) + ' ' +
                            'Mês/Ano anterior: ' + FormatDateTime('mm/yyyy', FDataRef2) + ' ' +
                            CmpRptCM.ParamByName('Filtro').AsString;

  if ppLblTitulo2.Height < 15 then
    ppLblTitulo2.Caption := #13+#10+ppLblTitulo2.Caption;

  case CrmRptCM.IdReports of
    20403: begin
             ppLblTitulo.Caption := 'Balanço Patrimonial';     
             AddColRpt( -1, 'ATIVO',                        'C', 'Descricao1', 'L', 'L', 'L', 7);
             AddColRpt(158, 'Exercício'+#13+#10+'Atual',    'C', 'Atual1',     'R', 'L', 'L', 7);
             AddColRpt(258, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior1',  'R', 'L', 'L', 7);
             AddColRpt(348, 'PASSIVO',                      'C', 'Descricao2', 'L', 'L', 'L', 7);
             AddColRpt(546, 'Exercício'+#13+#10+'Atual',    'C', 'Atual2',     'R', 'L', 'L', 7);
             AddColRpt(646, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior2',  'R', 'L', 'L', 7);
             PreparaReport20403;
           end;

    20401: begin
             ppLblTitulo.Caption := 'Demonstração da Mutação do Ativo Líquido';
             AddColRpt( -1, '',                             'C', 'Sinal1',     'C', 'L');
             AddColRpt( 40, 'DESCRIÇÃO',                    'C', 'Descricao1', 'L', 'L');
             AddColRpt(429, 'Exercício'+#13+#10+'Atual',    'C', 'Atual1',     'R', 'L');
             AddColRpt(544, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior1',  'R', 'L');
             AddColRpt(659, 'Variação'+#13+#10+'(%)',       'C', 'Variacao1',  'C', 'L');
             PreparaReport20401;
           end;

    20400: begin
             ppLblTitulo.Caption := 'Demonstração da Mutação do Ativo Líquido por Plano de Benefício';
             AddColRpt( -1, '',                             'C', 'Sinal1',     'C', 'L');
             AddColRpt( 40, 'DESCRIÇÃO',                    'C', 'Descricao1', 'L', 'L');
             AddColRpt(429, 'Exercício'+#13+#10+'Atual',    'C', 'Atual1',     'R', 'L');
             AddColRpt(544, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior1',  'R', 'L');
             AddColRpt(659, 'Variação'+#13+#10+'(%)',       'C', 'Variacao1',  'C', 'L');
             PreparaReport20400;
           end;

    20406: begin
             ppLblTitulo.Caption := 'Demonstração das Obrigações Atuariais do Plano de Benefícios';
             AddColRpt( -1, 'DESCRIÇÃO',                    'C', 'Descricao1', 'L', 'L');
             AddColRpt(429, 'Exercício'+#13+#10+'Atual',    'C', 'Atual1',     'R', 'L');
             AddColRpt(544, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior1',  'R', 'L');
             AddColRpt(659, 'Variação'+#13+#10+'(%)',       'C', 'Variacao1',  'C', 'L');
             PreparaReport20406;
           end;

    20402: begin
             ppLblTitulo.Caption := 'Demonstração do Plano de Gestão Administrativa (Consolidada)';
             AddColRpt( -1, 'DESCRIÇÃO',                    'C', 'Descricao1', 'L', 'L');
             AddColRpt(429, 'Exercício'+#13+#10+'Atual',    'C', 'Atual1',     'R', 'L');
             AddColRpt(544, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior1',  'R', 'L');
             AddColRpt(659, 'Variação'+#13+#10+'(%)',       'C', 'Variacao1',  'C', 'L');
             PreparaReport20402;
           end;

    20407: begin
             ppLblTitulo.Caption := 'Demonstração do Ativo Líquido por Plano de Benefícios';
             AddColRpt( -1, 'DESCRIÇÃO',                    'C', 'Descricao1', 'L', 'L');
             AddColRpt(429, 'Exercício'+#13+#10+'Atual',    'C', 'Atual1',     'R', 'L');
             AddColRpt(544, 'Exercício'+#13+#10+'Anterior', 'C', 'Anterior1',  'R', 'L');
             AddColRpt(659, 'Variação'+#13+#10+'(%)',       'C', 'Variacao1',  'C', 'L');
             PreparaReport20407;
           end;
  end;

  // Filtrando dados referente as contas filtradas
  CdsAux.Data := CtrlRptCGPC28.FazQuery(FDataRef1,
                                        FDataRef2,
                                        IntToStr(Sistema.IdEmpresa),
                                        IntToStr(iPlano),
                                        CmpRptCM.ParamByName('PlanoPrev').AsString,
                                        CmpRptCM.ParamByName('Patro').AsString,
                                        CmpRptCM.ParamByName('Movimentacao').AsBoolean,
                                        CmpRptCM.ParamByName('RMil').AsBoolean,
                                        FContas);

  // Criando colunas do relatório
  CarregaDadosLayout;

  // Adicionado Dados ao relatório.
  CdsCGPC28.EmptyDataSet;
  CarregaDados;

  // Adicionado Assinaturas
  CarregaDadosAssinatura;
end;

procedure TRptCGPC28.AddValues(Value: array of Variant);
var
  x, y, i: Integer;
  sConta: String;
  bAddConta: Boolean;
begin
  // Adicionando valores;
  i := Length(aValuesRpt);
  SetLength(aValuesRpt, i+1);
  aValuesRpt[i] := VarArrayOf(Value);

  // Adicionando Contas para o Filtro
  for x := 5 to High(Value) do
    if VarArrayDimCount(Value[x]) > 0 then
      for y := VarArrayLowBound(Value[x], 1) to VarArrayHighBound(Value[x], 1) do begin
        sConta := Value[x][y];
        sConta := StringReplace(sConta , '.', '', [rfReplaceAll]);
        sConta := StringReplace(sConta , 'C', '', []); // Crédito
        sConta := StringReplace(sConta , 'D', '', []); // Débito
        sConta := StringReplace(sConta , 'I', '', []); // Início do exercício

        bAddConta := True;
        for i := Low(FContas) to High(FContas) do
          if FContas[i] = sConta then begin
            bAddConta := False;
            Break;
          end;

        if bAddConta then begin
          i := Length(FContas);
          SetLength(FContas, i+1);
          FContas[i] := sConta;
        end;
      end;
end;

procedure TRptCGPC28.CarregaDados;
var
  iColuna, iOldColuna: Integer;
  sDescFmt, sSinal, sDesc: String;
  dAtual, dAnterior: Double;
  sFmt: String;
  x: Integer;
  iCont: Integer;
begin
  iOldColuna := 0;

  for x := Low(aValuesRpt) to High(aValuesRpt) do begin
    iColuna   := aValuesRpt[x][0];
    sDescFmt  := '';
    sSinal    := '';
    sDesc     := '';
    dAtual    := 0;
    dAnterior := 0;

    iCont := VarArrayHighBound(aValuesRpt[x], 1);

    if iCont >= 1 then sDescFmt := aValuesRpt[x][1];
    if iCont >= 2 then sSinal   := aValuesRpt[x][2];
    if iCont >= 3 then sDesc    := aValuesRpt[x][3];

    if iCont >= 5 then begin
      dAtual    := dAtual + SomaSe('SaldoRef1', aValuesRpt[x][5]);
      dAnterior := dAnterior + SomaSe('SaldoRef2', aValuesRpt[x][5]);

      if (aValuesRpt[x][4]) then dAtual    := dAtual * -1;
      if (aValuesRpt[x][4]) then dAnterior := dAnterior * -1;
    end;

    // Na elaboração da Demonstração da Mutação do Ativo Líquido por Plano de Benefícios
    // referente ao exercício de 2010, ou ao mês/ano 31/01/2010, não será necessário o
    // preenchimento da coluna Exercício Anterior e Variação
    if FDataRef2 < EncodeDate(2010, 1, 1) then begin
      dAnterior := 0;
    end;
    // Rubricas com saldos nulos em ambos os períodos não serão apresentadas
    if ( ((Trim(sSinal) <> '') or  (Trim(sDesc) <> '')) and ((dAtual <> 0) or  (dAnterior <> 0)) ) or
       (  (Trim(sSinal) =  '') and (Trim(sDesc) =  '')  and  (dAtual = 0) and (dAnterior = 0)  ) or
       (Pos('B', sDescFmt) > 0) then  //ERALDO LUIS DA SILVA SOL 160035/5321,160035/5322,160035/5324,160035/5325
                                      //ERALDO LUIS DA SILVA KINTANA 1331744,1331675,1331674,1331751
    begin

      if (Abs(iColuna) = 1) then begin
        // Alterado por FHBS - SOL: 147101 KTN: 1018514
        //CdsCGPC28.Insert;
        CdsCGPC28.Append;
      end else begin

        if (iColuna > iOldColuna) then
          CdsCGPC28.First
        else
        if not(CdsCGPC28.Bof) and (iColuna = iOldColuna) then
          CdsCGPC28.Next;

        if CdsCGPC28.Eof then
          // Alterado por FHBS - SOL: 147101 KTN: 1018514
          //CdsCGPC28.Insert
          CdsCGPC28.Append
        else
          CdsCGPC28.Edit;
      end;

      if (Trim(sSinal) <> '') or (Trim(sDesc) <> '') then
      begin
        CdsCGPC28.FieldByName('Sinal'+IntToStr(Abs(iColuna))).AsString     := sSinal;
        CdsCGPC28.FieldByName('Descricao'+IntToStr(Abs(iColuna))).AsString := sDesc;

        sFmt := '';

        if (Pos('B', sDescFmt) > 0) then sFmt := sFmt + 'B;';
        if (Pos('U', sDescFmt) > 0) then sFmt := sFmt + 'U;';
        if (Pos('I', sDescFmt) > 0) then sFmt := sFmt + 'I;';

        CdsCGPC28.FieldByName('DescricaoFmt'+IntToStr(Abs(iColuna))).AsString := sFmt;

        // Alterado por FHBS - SOL: 140612 KTN: 881389
        if CmpRptCM.ParamByName('RMil').AsBoolean then begin
          // Alterado por FHBS - SOL: 143522 KTN: 934189
          //CdsCGPC28.FieldByName('Atual'+IntToStr(Abs(iColuna))).AsString    := FormatFloat('#,0;(#,0)', Trunc(dAtual));
          //CdsCGPC28.FieldByName('Anterior'+IntToStr(Abs(iColuna))).AsString := FormatFloat('#,0;(#,0)', Trunc(dAnterior));
          CdsCGPC28.FieldByName('Atual'+IntToStr(Abs(iColuna))).AsString    := sFmt + FormatFloat('#,0;(#,0)', Round(dAtual));
          CdsCGPC28.FieldByName('Anterior'+IntToStr(Abs(iColuna))).AsString := sFmt + FormatFloat('#,0;(#,0)', Round(dAnterior));
          // Fim - Alterado por FHBS - SOL: 143522 KTN: 934189
        end else begin
          CdsCGPC28.FieldByName('Atual'+IntToStr(Abs(iColuna))).AsString    := sFmt + FormatFloat('#,0.00;(#,0.00)', dAtual);
          CdsCGPC28.FieldByName('Anterior'+IntToStr(Abs(iColuna))).AsString := sFmt + FormatFloat('#,0.00;(#,0.00)', dAnterior);
        end;
        // Fim - Alterado por FHBS

        if dAnterior <> 0 then
        begin
          // Alterado por FHBS - SOL: 140612 KTN: 881389
          if (((dAtual/dAnterior)-1)*100 > 1000) then
            CdsCGPC28.FieldByName('Variacao'+IntToStr(Abs(iColuna))).AsString  := 'M %'
          else
          if (((dAtual/dAnterior)-1)*100 < -1000) then
            CdsCGPC28.FieldByName('Variacao'+IntToStr(Abs(iColuna))).AsString  := '-M %'
          else
            CdsCGPC28.FieldByName('Variacao'+IntToStr(Abs(iColuna))).AsString  := sFmt + FormatFloat('#,0.00 %;-#,0.00 %', ((dAtual/dAnterior)-1)*100);
          // Fim - Alterado por FHBS
        end
        else
          CdsCGPC28.FieldByName('Variacao'+IntToStr(Abs(iColuna))).AsString  := '-';

        // Na elaboração da Demonstração da Mutação do Ativo Líquido por Plano de Benefícios
        // referente ao exercício de 2010, ou ao mês/ano 31/01/2010, não será necessário o
        // preenchimento da coluna Exercício Anterior e Variação
        if FDataRef2 < EncodeDate(2010, 1, 1) then
        begin
          CdsCGPC28.FieldByName('Anterior'+IntToStr(Abs(iColuna))).Clear;
          CdsCGPC28.FieldByName('Variacao'+IntToStr(Abs(iColuna))).Clear;
        end;
      end;

      if CdsCGPC28.State in [dsInsert, dsEdit] then
        CdsCGPC28.Post;

      iOldColuna := iColuna;
    end;
  end;
end;

function TRptCGPC28.SomaSe(sCampo: String;
  sContas: Variant): Double;
var
  Contador: integer;
  sConta: String;
  bCredito, bDebito, bInicioExercio: Boolean;
  sCampoAux: String;
begin
  Result := 0;
  CdsAux.First;
  while not(CdsAux.Eof) do
  begin
    for Contador := VarArrayLowBound(sContas, 1) to VarArrayHighBound(sContas, 1) do
    begin
      sConta := sContas[Contador];
      sConta := StringReplace(sConta, '.', '', [rfReplaceAll]);

      bInicioExercio := Pos('I', sConta) > 0; // Início de Exercício (SaldoRef1->SaldoRef2 e SaldoRef2->SaldoRef3)
      bCredito       := Pos('C', sConta) > 0; // Soma os Crédito
      bDebito        := Pos('D', sConta) > 0; // Soma os Débito

      sConta := StringReplace(sConta, 'I', '', [rfReplaceAll]);
      sConta := StringReplace(sConta, 'D', '', [rfReplaceAll]);
      sConta := StringReplace(sConta, 'C', '', [rfReplaceAll]);

      if Trim(CdsAux.FieldByName('PlaConta').AsString) = sConta then
      begin

        if bInicioExercio then
          sCampoAux := StringReplace( StringReplace(sCampo,'2','3',[]), '1','2',[])
        else
          sCampoAux := sCampo;

        if (bCredito or bDebito) then
        begin
          if ((CdsAux.FieldByName(sCampo+'_DC').AsString = 'C') and (bCredito)) or
             ((CdsAux.FieldByName(sCampo+'_DC').AsString = 'D') and (bDebito)) then
          begin
            Result := Result + CdsAux.FieldByName(sCampoAux).AsFloat;
          end;
        end else begin
          Result := Result + CdsAux.FieldByName(sCampoAux).AsFloat;
        end;

      end;
    end;
    CdsAux.Next;
  end;
end;

procedure TRptCGPC28.CarregaDadosAssinatura;
var
  dDataSelecao: TDateTime;
begin
  dDataSelecao := UltimoDiaMes(EncodeDate(StrToIntDef(CmpRptCM.ParamByName('Exercicio').AsString,0),
                                          StrToIntDef(CmpRptCM.ParamByName('Mes').AsString,12),
                                          1));

  with sqlAssinatura do
  begin
    Prepare;
    ParamByName('DataSelecao').AsString := DateToStr(dDataSelecao);
    Open;
  end;
end;

function TRptCGPC28.GetFmtDescricaoStyle(sValue: String): TFontStyles;
begin
  sValue := ';' + UpperCase(sValue) + ';';
  Result := [];

  if Pos(';B;', sValue) > 0 then
    Result := Result + [fsBold];

  if Pos(';I;', sValue) > 0 then
    Result := Result + [fsItalic];

  if Pos(';U;', sValue) > 0 then
    Result := Result + [fsUnderline];


end;

procedure TRptCGPC28._ppDBTextPrint(Sender: TObject);
begin
  inherited;

  //ERALDO LUIS DA SILVA INICIO SOL 160035/5321,160035/5322,160035/5324,160035/5325
  //ERALDO LUIS DA SILVA INICIO KINTANA 1331744,1331675,1331674,1331751
  if TppLine(Sender).Name = '_ppLineDetTeste' then begin
    if ((bUltNegrito) and not (Pos('B;',CdsCGPC28.FieldByName('DescricaoFmt1').AsString) > 0)) then begin
      TppLine(Sender).Height := 10;
      bUltNegrito := False;
      Exit;
    end;

    if (Pos('B;',CdsCGPC28.FieldByName('DescricaoFmt1').AsString) > 0) then begin
      TppLine(Sender).Height := 10;
      bUltNegrito := True;
    end else begin
      TppLine(Sender).Height := 0;
    end;
    exit;
  end;

  if (UpperCase(TppDBText(Sender).DataField) = 'DESCRICAO1') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('DescricaoFmt1').AsString);
  end
  else
  if (UpperCase(TppDBText(Sender).DataField) = 'DESCRICAO2') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('DescricaoFmt2').AsString);
  end
  else
  if (UpperCase(TppDBText(Sender).DataField) = 'ANTERIOR1') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('Anterior1').AsString);
    CdsCGPC28.Edit;
    CdsCGPC28.FieldByName('Anterior1').AsString := StringReplace(TppDBText(Sender).Text, 'B;U;', '', []);
    CdsCGPC28.FieldByName('Anterior1').AsString := StringReplace(TppDBText(Sender).Text, 'B;', '', []);
    CdsCGPC28.Post;
  end
  else
  if (UpperCase(TppDBText(Sender).DataField) = 'ATUAL1') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('ATUAL1').AsString);
    CdsCGPC28.Edit;
    CdsCGPC28.FieldByName('atual1').AsString := StringReplace(TppDBText(Sender).Text, 'B;U;', '', []);
    CdsCGPC28.FieldByName('atual1').AsString := StringReplace(TppDBText(Sender).Text, 'B;', '', []);
    CdsCGPC28.Post;
  end
  else
  if (UpperCase(TppDBText(Sender).DataField) = 'VARIACAO1') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('VARIACAO1').AsString);
    CdsCGPC28.Edit;
    CdsCGPC28.FieldByName('variacao1').AsString := StringReplace(TppDBText(Sender).Text, 'B;U;', '', []);
    CdsCGPC28.FieldByName('variacao1').AsString := StringReplace(TppDBText(Sender).Text, 'B;', '', []);
    CdsCGPC28.Post;
  end
  else
  if (UpperCase(TppDBText(Sender).DataField) = 'ATUAL2') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('ATUAL2').AsString);
    CdsCGPC28.Edit;
    CdsCGPC28.FieldByName('atual2').AsString := StringReplace(TppDBText(Sender).Text, 'B;U;', '', []);
    CdsCGPC28.FieldByName('atual2').AsString := StringReplace(TppDBText(Sender).Text, 'B;', '', []);
    CdsCGPC28.Post;
  end
  else
  if (UpperCase(TppDBText(Sender).DataField) = 'ANTERIOR2') then begin
    TppDBText(Sender).Font.Style := GetFmtDescricaoStyle(CdsCGPC28.FieldByName('Anterior2').AsString);
    CdsCGPC28.Edit;
    CdsCGPC28.FieldByName('Anterior2').AsString := StringReplace(TppDBText(Sender).Text, 'B;U;', '', []);
    CdsCGPC28.FieldByName('Anterior2').AsString := StringReplace(TppDBText(Sender).Text, 'B;', '', []);
    CdsCGPC28.Post;
  end;
  //ERALDO LUIS DA SILVA FIM SOL 160035/5321,160035/5322,160035/5324,160035/5325
  //ERALDO LUIS DA SILVA FIM KINTANA 1331744,1331675,1331674,1331751
end;

procedure TRptCGPC28._ppLineLastPrint(Sender: TObject);
begin
  TppLine(Sender).Visible := (CdsCGPC28.RecNo = CdsCGPC28.RecordCount);
end;

procedure TRptCGPC28.AddColRpt(iLinL: Integer; sCab, sCabPos,
  sField, sFieldPos, sLinBottom, sLinTop: String;
  iFontSize: Integer);
var
  x: integer;
begin
  x := Length(aColRpt);
  SetLength(aColRpt, x+1);
  aColRpt[x][1] := IntToStr(iLinL);
  aColRpt[x][2] := sCab;
  aColRpt[x][3] := sCabPos;
  aColRpt[x][4] := sField;
  aColRpt[x][5] := sFieldPos;
  aColRpt[x][6] := sLinBottom;
  aColRpt[x][7] := IntToStr(iFontSize);
  aColRpt[x][8] := sLinTop;
end;

procedure TRptCGPC28.CarregaDadosLayout;
const
  iEspaco = 4;
var
  xObj: TObject;
  Contador: Integer;
begin
  //ERALDO LUIS DA SILVA SOL 160035/5321,160035/5322,160035/5324,160035/5325
  //ERALDO LUIS DA SILVA KINTANA 1331744,1331675,1331674,1331751
  bUltNegrito := False;
  for Contador := Low(aColRpt) to High(aColRpt) do begin

    // Linha da Coluna do Cabeçalho
    if StrToInt(aColRpt[Contador][1]) >= 0 then begin
      xObj := TppLine.Create(Self);
      with TppLine(xObj) do begin
        Name     := '_ppLineCab'+IntToStr(Contador);
        Band     := ppHeaderBand1;
        Top      := ppLineCabL.Top;
        Left     := StrToInt(aColRpt[Contador][1]);
        Height   := ppLineCabL.Height;
        Width    := 1;
        Position := lpLeft;
      end;
    end;

    // Texto do Cabeçalho
    xObj := TppLabel.Create(Self);
    with TppLabel(xObj) do begin
      Name     := '_ppLabelCab'+IntToStr(Contador);
      Band     := ppHeaderBand1;
      WordWrap := True;
      AutoSize := True;

      case aColRpt[Contador][3][1] of
        'C': TextAlignment := taCentered;
        'R': TextAlignment := taRightJustified;
        'L': TextAlignment := taLeftJustified;
      end;

      Font.Style := Font.Style + [fsBold];
      Caption  := aColRpt[Contador][2];
      AutoSize := False;
      Top      := ppLineCabL.Top + Trunc(((ppLineCabL.Height - Height) / 2)) + 1;
      Height   := ppLineCabL.Height - (Top - ppLineCabL.Top) - 1;

      if StrToInt(aColRpt[Contador][1]) >= 0 then
        Left := StrToInt(aColRpt[Contador][1]) + 1 + 1
      else
        Left := ppLineCabL.Left + ppLineCabL.Width + 1;

      if Contador = High(aColRpt) then
        Width := ppLineCabR.Left - Left - 1
      else
        Width := StrToInt(aColRpt[Contador+1][1]) - Left - 1;

      if aColRpt[Contador][3] = 'L' then begin
        Left := Left + iEspaco;
        Width := Width - iEspaco;
      end else
      if aColRpt[Contador][3] = 'R' then begin
        Width := Width - iEspaco;
      end;

    end;

    // Linha da Coluna do Detalhe
    if StrToInt(aColRpt[Contador][1]) >= 0 then begin
      xObj := TppLine.Create(Self);
      with TppLine(xObj) do begin
        Name     := '_ppLineDet'+IntToStr(Contador);
        Band     := ppDetailBand1;
        Top      := ppLineDetL.Top;
        Left     := StrToInt(aColRpt[Contador][1]);
        Height   := ppLineDetL.Height;
        Width    := 1;
        Position := lpLeft;
      end;
    end;

    // Texto do Detalhe
    xObj := TppDBText.Create(Self);
    with TppDBText(xObj) do begin
      Name         := '_ppDBTextDet'+IntToStr(Contador);
      Band         := ppDetailBand1;
      DataPipeline := ppCGPC28;
      DataField    := aColRpt[Contador][4];
      OnPrint      := _ppDBTextPrint;
      AutoSize     := True;
      Font.Size    := StrToInt(aColRpt[Contador][7]);

      case aColRpt[Contador][5][1] of
        'C': TextAlignment := taCentered;
        'R': TextAlignment := taRightJustified;
        'L': TextAlignment := taLeftJustified;
      end;

      AutoSize := False;
      Top      := ppLineDetL.Top + Trunc(((ppLineDetL.Height - Height)/2)) + 1;
      Height   := ppLineDetL.Height - (Top - ppLineDetL.Top) - 1;

      if StrToInt(aColRpt[Contador][1]) >= 0 then
        Left := StrToInt(aColRpt[Contador][1]) + 1 + 1
      else
        Left := ppLineDetL.Left + ppLineDetL.Width + 1;

      if Contador = High(aColRpt) then
        Width := ppLineDetR.Left - Left - 1
      else
        Width := StrToInt(aColRpt[Contador+1][1]) - Left - 1;

      if aColRpt[Contador][5] = 'L' then begin
        Left := Left + iEspaco;
        Width := Width - iEspaco;
      end else
      if aColRpt[Contador][5] = 'R' then begin
        Width := Width - iEspaco;
      end;

    end;

    // Linha Top do Detalhe
    if aColRpt[Contador][8] <> '' then begin
      xObj := TppLine.Create(Self);
      with TppLine(xObj) do begin
        Band     := ppDetailBand1;
        Top      := ppLineDetL.Top;

        if StrToInt(aColRpt[Contador][1]) >= 0 then
          Left := StrToInt(aColRpt[Contador][1])
        else
          Left := ppLineDetL.Left;

        Height   := 1;

        if Contador = High(aColRpt) then
          Width := ppLineDetR.Left - Left + ppLineDetR.Width
        else
          Width := StrToInt(aColRpt[Contador+1][1]) - Left + 1;

        Position := lpTop;

        if aColRpt[Contador][8] = 'L' then
          OnPrint := _ppLineLastPrint;
      end;
    end;

    // Linha Buttom do Detalhe
    if aColRpt[Contador][6] <> '' then begin
      xObj := TppLine.Create(Self);
      with TppLine(xObj) do begin
        Band     := ppDetailBand1;
        Top      := ppLineDetL.Top + ppLineDetL.Height;

        if StrToInt(aColRpt[Contador][1]) >= 0 then
          Left := StrToInt(aColRpt[Contador][1])
        else
          Left := ppLineDetL.Left;

        Height   := 1;

        if Contador = High(aColRpt) then
          Width := ppLineDetR.Left - Left + ppLineDetR.Width
        else
          Width := StrToInt(aColRpt[Contador+1][1]) - Left + 1;

        Position := lpTop;

        if aColRpt[Contador][6] = 'L' then
          OnPrint := _ppLineLastPrint;
      end;
    end;
  end;
  //ERALDO LUIS DA SILVA INICIO SOL 160035/5321,160035/5322,160035/5324,160035/5325
  //ERALDO LUIS DA SILVA INICIO KINTANA 1331744,1331675,1331674,1331751
  //Linha de Separação de Grupos de Contas
  xObj := TppLine.Create(Self);
  with TppLine(xObj) do begin
    Name     := '_ppLineDetTeste';
    Band     := ppDetailBand1;
    Top      := ppLineDetL.Top;
    Left     := ppLineCabT.Left;
    Height   := ppLineDetL.Height;
    Width    := ppLineCabT.Width;
    Position := lpTop;
    OnPrint  := _ppDBTextPrint;
  //ERALDO LUIS DA SILVA FIM SOL 160035/5321,160035/5322,160035/5324,160035/5325
  //ERALDO LUIS DA SILVA FIM KINTANA 1331744,1331675,1331674,1331751
  end;
end;

procedure TRptCGPC28.PreparaReport20400;
begin
  AddValues([1, 'B', '',      'A) Ativo Líquido - início do exercício',                                True, VarArrayOf(['I2.3']) ]);
  AddValues([1, 'B', '',      '     1. Adições',                                                       True, VarArrayOf(['3.1','C3.3','3.5.1']) ]);
  AddValues([1,  '', '(+)',   '          Contribuições',                                               True, VarArrayOf(['3.1'])                ]);
  AddValues([1,  '', '(+)',   '          Resultado Positivo dos Investimentos - Gestão Previdencial',  True, VarArrayOf(['3.5.1'])              ]);
  AddValues([1,  '', '(+)',   '          Reversão de Contingências - Gestão Previdencial',             True, VarArrayOf(['C3.3'])               ]);
  AddValues([1, 'B', '',      '     2. Destinações',                                                  False, VarArrayOf(['3.2','D3.3','3.4','3.5.2']) ]);
  AddValues([1,  '', '(-)',   '          Benefícios',                                                 False, VarArrayOf(['3.2'])                ]);
  AddValues([1,  '', '(-)',   '          Resultado Negativo dos Investimentos - Gestão Previdencial', False, VarArrayOf(['3.5.2'])              ]);
  AddValues([1,  '', '(-)',   '          Constituição de Contingências - Gestão Previdencial',        False, VarArrayOf(['D3.3'])               ]);
  AddValues([1,  '', '(-)',   '          Custeio Administrativo',                                     False, VarArrayOf(['3.4'])                ]);
  AddValues([1, 'B', '',      '     3. Acréscimo/Decréscimo no Ativo Líquido (1+2)',                   True, VarArrayOf(['3.1','3.2','3.3','3.4','3.5.1','3.5.2']) ]);
  AddValues([1,  '', '(+/-)', '          Provisões Matemáticas',                                       True, VarArrayOf(['2.3.1.1'])            ]);
  AddValues([1,  '', '(+/-)', '          Fundos Previdenciais',                                        True, VarArrayOf(['2.3.2.1'])            ]);
  AddValues([1,  '', '(+/-)', '          Superávit(Déficit) Técnico do Exercício',                     True, VarArrayOf(['2.3.1.2.01'])         ]);
  // SOL 160035/5322 KINTANA 1331675 Adequação relatórios para CNPC 01/2011
  //AddValues([1,  '', '(+/-)', '          Resultados a Realizar',                                       True, VarArrayOf(['2.3.1.2.02'])         ]);
  // SOL 160035/5322 KINTANA 1331675 Adequação relatórios para CNPC 01/2011
  AddValues([1, 'B', '',      '     4. Operações Transitórias',                                        True, VarArrayOf(['7'])                  ]);
  AddValues([1,  '', '(+/-)', '          Operações Transitórias',                                      True, VarArrayOf(['7'])         ]);
  // SOL 160035/5322 KINTANA 1331675 Adequação relatórios para CNPC 01/2011
  AddValues([1, 'B', '',      'B) Ativo Líquido - final do exercício (A+3+4)',                           True, VarArrayOf(['2.3','7'])                ]);
  AddValues([1, 'B', '',      'C) Fundos não Previdenciais',                                           True, VarArrayOf(['2.3.2.2','2.3.2.3'])  ]);
  AddValues([1,  '', '',      '     Fundos Administrativos',                                           True, VarArrayOf(['2.3.2.2'])            ]);
  AddValues([1,  '', '',      '     Fundos dos Investimentos',                                         True, VarArrayOf(['2.3.2.3'])            ]);
end;

procedure TRptCGPC28.PreparaReport20401;
begin
  AddValues([1, 'B', '',      'A) Ativo Líquido - início do exercício',                                    True, VarArrayOf(['I2.3'])              ]);
  AddValues([1, 'B', '',      '      1. Adições',                                                          True, VarArrayOf(['3.1','3.5.1','C3.3','3.4','4.1','4.5.1','C4.3','4.7']) ]);
  AddValues([1,  '', '(+)',   '            Contribuições Previdenciais',                                   True, VarArrayOf(['3.1','3.4']) ]);
  AddValues([1,  '', '(+)',   '            Resultado Positivo dos Investimentos - Gestão Previdencial',    True, VarArrayOf(['3.5.1'])             ]);
  AddValues([1,  '', '(+)',   '            Reversão de Contingências - Gestão Previdencial',               True, VarArrayOf(['C3.3'])              ]);
  AddValues([1,  '', '(+)',   '            Receitas Administrativas',                                      True, VarArrayOf(['4.1'])               ]);
  AddValues([1,  '', '(+)',   '            Resultado Positivo dos Investimentos - Gestão Administrativa',  True, VarArrayOf(['4.5.1'])             ]);
  AddValues([1,  '', '(+)',   '            Reversão de Continências - Gestão Administrativa',              True, VarArrayOf(['C4.3'])              ]);
  // SOL 160035/5321 KINTANA 1331744 Adequação relatórios para CNPC 01/2011
  AddValues([1,  '', '(+)',   '            Reversão de Fundos - Gestão Administrativa',                   True, VarArrayOf(['C4.7'])              ]);
  AddValues([1,  '', '(+)',   '            Receitas Assistenciais',                                       True, VarArrayOf(['4.1.3'])             ]);
  AddValues([1, 'B', '',      '      2. Destinações',                                                     False, VarArrayOf(['3.2','3.5.2','D3.3','4.2','4.5.2','4.7','D4.3']) ]);
  AddValues([1,  '', '(-)',   '            Benefícios',                                                   False, VarArrayOf(['3.2'])               ]);
  AddValues([1,  '', '(-)',   '            Resultado Negativo dos Investimentos - Gestão Previdencial',   False, VarArrayOf(['3.5.2'])             ]);
  AddValues([1,  '', '(-)',   '            Constituição de Contingências - Gestão Previdencial',          False, VarArrayOf(['D3.3'])              ]);
  AddValues([1,  '', '(-)',   '            Despesas Administrativas',                                     False, VarArrayOf(['4.2'])               ]);
  AddValues([1,  '', '(-)',   '            Resultado Negativo dos Investimentos - Gestão Administrativa', False, VarArrayOf(['4.5.2'])             ]);
  AddValues([1,  '', '(-)',   '            Constituição de Contingências - Gestão Administrativa',        False, VarArrayOf(['D4.3'])              ]);
  // SOL 160035/5321 KINTANA 1331744 Adequação relatórios para CNPC 01/2011
  AddValues([1,  '', '(-)',   '            Constituição de Fundos - Gestão Administrativa',                True, VarArrayOf(['D4.7'])              ]);
  AddValues([1,  '', '(-)',   '            Despesas Assistenciais',                                        False, VarArrayOf(['4.2.3'])             ]);
  AddValues([1, 'B', '',      '      3. Acréscimo/Decréscimo no Ativo Líquido (1+2)',                      True, VarArrayOf(['3.1','3.2','3.3','3.4','3.5','4.1','4.2','4.3','4.5']) ]);
  AddValues([1,  '', '(+/-)', '            Provisões Matemáticas',                                         True, VarArrayOf(['2.3.1.1'])           ]);
  AddValues([1,  '', '(+/-)', '            Fundos Previdenciais',                                          True, VarArrayOf(['2.3.2.1'])           ]);
  AddValues([1,  '', '(+/-)', '            Superávit(Déficit) Técnico do Exercício',                       True, VarArrayOf(['2.3.1.2.01'])        ]);
  // SOL 160035/5321 KINTANA 1331744 Adequação relatórios para CNPC 01/2011
  //AddValues([1,  '', '(+/-)', '            Resultados a Realizar',                                         True, VarArrayOf(['2.3.1.2.02'])        ]);
  AddValues([1,  '', '(+/-)', '            Gestão Assistencial',                                           True, VarArrayOf(['2.4'])               ]);
  // SOL 160035/5321 KINTANA 1331744 Adequação relatórios para CNPC 01/2011
  AddValues([1, 'B', '',      '      4. Operações Transitórias',                                           True, VarArrayOf(['7'])                 ]);
  AddValues([1,  '', '(+/-)', '            Operações Transitórias',                                        True, VarArrayOf(['7'])                 ]);
  // SOL 160035/5321 KINTANA 1331744 Adequação relatórios para CNPC 01/2011
  AddValues([1, 'B', '',      'B) Ativo Líquido - final do exercício (A+3+4)',                             True, VarArrayOf(['2.3','7'])           ]);
  AddValues([1, 'B', '',      'C) Fundos não Previdenciais',                                               True, VarArrayOf(['2.3.2.2','2.3.2.3']) ]);
  AddValues([1,  '', '(+/-)', '      Fundos Administrativos',                                              True, VarArrayOf(['2.3.2.2'])           ]);
  AddValues([1,  '', '(+/-)', '      Fundos dos Investimentos',                                            True, VarArrayOf(['2.3.2.3'])           ]);
end;

procedure TRptCGPC28.PreparaReport20402;
begin
  AddValues([1,'B', '', 'A) Fundo Administrativo do Exercício Anterior',                   True, VarArrayOf(['I2.3.2.2'])    ]);
  AddValues([1,'B', '', '   1. Custeio da Gestão administrativa',                          True, VarArrayOf(['4.1'])        ]);
  AddValues([1,'B', '', '      1.1. Receitas',                                             True, VarArrayOf(['4.1'])        ]);
  AddValues([1, '', '', '         Custeio Administrativo da Gestão Previdencial',          True, VarArrayOf(['4.1.1'])      ]);
  AddValues([1, '', '', '         Custeio Administrativo dos Investimentos',               True, VarArrayOf(['4.1.2.1'])    ]);
  AddValues([1, '', '', '         Taxa de Administração de Empréstimos e Financiamentos',  True, VarArrayOf(['4.1.2.2'])    ]);
  AddValues([1, '', '', '         Receitas Diretas',                                       True, VarArrayOf(['4.1.4'])      ]);
  AddValues([1, '', '', '         Resultado Positivo dos Investimentos',                   True, VarArrayOf(['4.5.1'])      ]);
  AddValues([1, '', '', '         Reversão de Contingências',                              True, VarArrayOf(['4.3'])        ]);
  AddValues([1, '', '', '         Reembolso da Gestão Assistencial',                       True, VarArrayOf(['4.1.3'])      ]);
  AddValues([1, '', '', '         Outras Receitas',                                        True, VarArrayOf(['4.1.9'])      ]);
  AddValues([1,'B', '', '   2. Despesas Administrativas',                                 False, VarArrayOf(['4.2'])        ]);
  // SOL 160035.5325- KTN1331751 Adequação relatórios para CNPC 01/2011
  AddValues([1,'B', '', '      2.1. Administração Previdencial',                          False, VarArrayOf(['4.2.1','4.3.1'])      ]);
  AddValues([1, '', '', '         Pessoal e Encargos',                                    False, VarArrayOf(['4.2.1.1.01']) ]);
  AddValues([1, '', '', '         Treinamentos/Congressos e Seminários',                  False, VarArrayOf(['4.2.1.1.02']) ]);
  AddValues([1, '', '', '         Viagens e Estadias',                                    False, VarArrayOf(['4.2.1.1.03']) ]);
  AddValues([1, '', '', '         Serviçõs de Terceiros',                                 False, VarArrayOf(['4.2.1.1.04']) ]);
  AddValues([1, '', '', '         Despesas Gerais',                                       False, VarArrayOf(['4.2.1.1.05']) ]);
  AddValues([1, '', '', '         Depreciações e Amortizações',                           False, VarArrayOf(['4.2.1.1.06']) ]);
  AddValues([1, '', '', '         Contingências',                                         False, VarArrayOf(['4.3.1'])      ]);
  AddValues([1, '', '', '         Outras Despesas',                                       False, VarArrayOf(['4.2.1.1.99']) ]);
  // SOL 160035.5325- KTN1331751 Adequação relatórios para CNPC 01/2011
  AddValues([1,'B', '', '      2.2. Administração dos Investimentos',                     False, VarArrayOf(['4.2.2','4.3.2'])      ]);
  AddValues([1, '', '', '         Pessoal e Encargos',                                    False, VarArrayOf(['4.2.2.1.01']) ]);
  AddValues([1, '', '', '         Treinamentos/Congressos e Seminários',                  False, VarArrayOf(['4.2.2.1.02']) ]);
  AddValues([1, '', '', '         Viagens e Estadias',                                    False, VarArrayOf(['4.2.2.1.03']) ]);
  AddValues([1, '', '', '         Serviçõs de Terceiros',                                 False, VarArrayOf(['4.2.2.1.04']) ]);
  AddValues([1, '', '', '         Despesas Gerais',                                       False, VarArrayOf(['4.2.2.1.05']) ]);
  AddValues([1, '', '', '         Depreciações e Amortizações',                           False, VarArrayOf(['4.2.2.1.06']) ]);
  AddValues([1, '', '', '         Contingências',                                         False, VarArrayOf(['4.3.2'])      ]);
  AddValues([1, '', '', '         Outras Despesas',                                       False, VarArrayOf(['4.2.2.1.99']) ]);
  AddValues([1,'B', '', '      2.3. Administração Assistencial',                          False, VarArrayOf(['4.2.3'])      ]);
  // SOL 160035.5325- KTN1331751 Adequação relatórios para CNPC 01/2011
  AddValues([1,'B', '', '      2.4. Reversão de Recursos para o Plano de Benefícios',     False, VarArrayOf(['4.2.4'])      ]);
  // SOL 160035.5325- KTN1331751 Adequação relatórios para CNPC 01/2011
  AddValues([1,'B', '', '      2.5. Outras Despesas',                                     False, VarArrayOf(['4.2.9'])      ]);
  AddValues([1,'B', '', '   3. Resultado Negativo dos Investimentos',                     False, VarArrayOf(['4.5.2'])      ]);
  AddValues([1,'B', '', '   4. Sobra/Insuficiência da Gestão Administrativa (1-2-3)',     False, VarArrayOf(['4.1','4.2','4.5.2']) ]);
  AddValues([1,'B', '', '   5. Constituição/Reversão do Fundo Administrativo (4)',        True, VarArrayOf(['4.7'])        ]);
  // SOL 160035.5325- KTN1331751 Adequação relatórios para CNPC 01/2011
  AddValues([1,'B', '', '   6. Operações Transitórias',                                   True, VarArrayOf(['7'])        ]);
  // SOL 160035.5325- KTN1331751 Adequação relatórios para CNPC 01/2011
  AddValues([1,'B', '', 'B) Fundo Administrativo do Exercício Atual (A+5+6)',             True, VarArrayOf(['I2.3.2.2','4.7','7']) ]);
end;

procedure TRptCGPC28.PreparaReport20403;
begin
  // Dados da Primeira Coluna
  AddValues([1,'BU', '', 'Disponível',                                      False, VarArrayOf(['1.1'])           ]);
  AddValues([1]);
  AddValues([1,'BU', '', 'Realizável',                                      False, VarArrayOf(['1.2'])           ]);
  AddValues([1,  '', '', '   Gestão Previdencial',                          False, VarArrayOf(['1.2.1'])         ]);
  AddValues([1,  '', '', '   Gestão Administrativa',                        False, VarArrayOf(['1.2.2'])         ]);
  AddValues([1,  '', '', '   Investimentos',                                False, VarArrayOf(['1.2.3'])         ]);
  AddValues([1,  '', '', '      Títulos Públicos',                          False, VarArrayOf(['1.2.3.1'])       ]);
  AddValues([1,  '', '', '      Créditos Privados e Depósitos',             False, VarArrayOf(['1.2.3.2'])       ]);
  AddValues([1,  '', '', '      Ações',                                     False, VarArrayOf(['1.2.3.3'])       ]);
  AddValues([1,  '', '', '      Fundos de Investimento',                    False, VarArrayOf(['1.2.3.4'])       ]);
  AddValues([1,  '', '', '      Derivativos',                               False, VarArrayOf(['1.2.3.5'])       ]);
  AddValues([1,  '', '', '      Investimentos Imobiliários',                False, VarArrayOf(['1.2.3.6'])       ]);
  AddValues([1,  '', '', '      Empréstimos',                               False, VarArrayOf(['1.2.3.7.01'])    ]);
  AddValues([1,  '', '', '      Financiamentos Imobiliários',               False, VarArrayOf(['1.2.3.7.02'])    ]);
  AddValues([1,  '', '', '      Outros Realizáveis',                        False, VarArrayOf(['1.2.3.9'])       ]);
  AddValues([1]);
  AddValues([1,'BU', '', 'Permanente',                                      False, VarArrayOf(['1.3'])           ]);
  AddValues([1,  '', '', '   Imobilizado',                                  False, VarArrayOf(['1.3.1'])         ]);
  AddValues([1,  '', '', '   Intangível',                                   False, VarArrayOf(['1.3.2'])         ]);
  AddValues([1,  '', '', '   Diferido',                                     False, VarArrayOf(['1.3.3'])         ]);
  AddValues([1]);

  // Dados da Segunda Coluna
  AddValues([2,'BU', '', 'Exigível Operacional',                             True, VarArrayOf(['2.1'])           ]);
  AddValues([2,  '', '', '   Gestão Previdencial',                           True, VarArrayOf(['2.1.1'])         ]);
  AddValues([2,  '', '', '   Gestão Administrativa',                         True, VarArrayOf(['2.1.2'])         ]);
  AddValues([2,  '', '', '   Investimentos',                                 True, VarArrayOf(['2.1.3'])         ]);
  AddValues([2]);
  AddValues([2,'BU', '', 'Exigível Contingencial',                           True, VarArrayOf(['2.2'])           ]);
  AddValues([2,  '', '', '   Gestão Previdencial',                           True, VarArrayOf(['2.2.1'])         ]);
  AddValues([2,  '', '', '   Gestão Administrativa',                         True, VarArrayOf(['2.2.2'])         ]);
  AddValues([2,  '', '', '   Investimentos',                                 True, VarArrayOf(['2.2.3'])         ]);
  AddValues([2]);
  AddValues([2,'BU', '', 'Patrimônio Social',                                True, VarArrayOf(['2.3'])           ]);
  AddValues([2,  '', '', '   Patrimônio de Cobertura do Plano',              True, VarArrayOf(['2.3.1'])         ]);
  AddValues([2,  '', '', '      Provisões Matemáticas',                      True, VarArrayOf(['2.3.1.1'])       ]);
  AddValues([2,  '', '', '         Benefícios Concedidos',                   True, VarArrayOf(['2.3.1.1.01'])    ]);
  AddValues([2,  '', '', '         Benefícios a Conceder',                   True, VarArrayOf(['2.3.1.1.02'])    ]);
  AddValues([2,  '', '', '         (-) Provisões Matemáticas a Constituir', False, VarArrayOf(['2.3.1.1.03'])    ]);
  AddValues([2,  '', '', '      Equilíbrio Técnico',                         True, VarArrayOf(['2.3.1.2'])       ]);
  AddValues([2,  '', '', '         Resultados Realizados',                   True, VarArrayOf(['2.3.1.2.01'])    ]);
  AddValues([2,  '', '', '         Superávit Técnico Acumulado',             True, VarArrayOf(['2.3.1.2.01.01']) ]);
  AddValues([2,  '', '', '         (-) Déficit Técnico Acumulado',          False, VarArrayOf(['2.3.1.2.01.02']) ]);
  AddValues([2,  '', '', '         Resultados a Realizar',                   True, VarArrayOf(['2.3.1.2.02'])    ]);
  AddValues([2,  '', '', '   Fundos',                                        True, VarArrayOf(['2.3.2'])         ]);
  AddValues([2,  '', '', '      Fundos Previdenciais',                       True, VarArrayOf(['2.3.2.1'])       ]);
  AddValues([2,  '', '', '      Fundos Administrativos',                     True, VarArrayOf(['2.3.2.2'])       ]);
  AddValues([2,  '', '', '      Fundos dos Investimentos',                   True, VarArrayOf(['2.3.2.3'])       ]);
  AddValues([2]);

  // Totais
  AddValues([-1,'B', '', 'Total do Ativo',                                  False, VarArrayOf(['1'])             ]);
  AddValues([-2,'B', '', 'Total do Passivo',                                 True, VarArrayOf(['2'])             ]);
end;

procedure TRptCGPC28.PreparaReport20406;
begin
  AddValues([1,'B', '', 'Patrimônio de Cobertura do Plano (1+2)',                                  True, VarArrayOf(['2.3.1'])            ]);
  AddValues([1,'B', '', '   1. Provisões Matemáticas',                                             True, VarArrayOf(['2.3.1.1'])          ]);
  AddValues([1,'B', '', '      1.1 Benefícios Concedidos',                                         True, VarArrayOf(['2.3.1.1.01'])       ]);
  AddValues([1, '', '', '         Contribuição Definida',                                          True, VarArrayOf(['2.3.1.1.01.01'])    ]);
  AddValues([1, '', '', '         Benefício Definido',                                             True, VarArrayOf(['2.3.1.1.01.02'])    ]);
  AddValues([1,'B', '', '      1.2 Benefício a Conceder',                                          True, VarArrayOf(['2.3.1.1.02'])       ]);
  AddValues([1, '', '', '         Contribuição Definida',                                          True, VarArrayOf(['2.3.1.1.02.01'])    ]);
  AddValues([1, '', '', '            Saldo de Contas - Parcela Patrocinador(es)/Instituidor(es)',  True, VarArrayOf(['2.3.1.1.02.01.01']) ]);
  AddValues([1, '', '', '            Saldo de Contas - Parcela Participantes',                     True, VarArrayOf(['2.3.1.1.02.01.02']) ]);
  AddValues([1, '', '', '         Benefício Definido',                                             True, VarArrayOf(['2.3.1.1.02.02','2.3.1.1.02.03','2.3.1.1.02.04','2.3.1.1.02.05']) ]);
  AddValues([1,'B', '', '      1.3 (-) Provisões Matemáticas a Constituir',                       False, VarArrayOf(['2.3.1.1.03'])       ]);
  AddValues([1, '', '', '          (-) Serviço Passado',                                          False, VarArrayOf(['2.3.1.1.03.01'])    ]);
  AddValues([1, '', '', '             (-) Patrocinador(es)',                                      False, VarArrayOf(['2.3.1.1.03.01.01']) ]);
  AddValues([1, '', '', '             (-) Participantes',                                         False, VarArrayOf(['2.3.1.1.03.01.02']) ]);
  AddValues([1, '', '', '          (-) Déficit Equacionado',                                      False, VarArrayOf(['2.3.1.1.03.02'])    ]);
  AddValues([1, '', '', '             (-) Patrocinador(es)',                                      False, VarArrayOf(['2.3.1.1.03.02.01']) ]);
  AddValues([1, '', '', '             (-) Participantes',                                         False, VarArrayOf(['2.3.1.1.03.02.02']) ]);
  AddValues([1, '', '', '             (-) Assistidos',                                            False, VarArrayOf(['2.3.1.1.03.02.03']) ]);
  AddValues([1, '', '', '          (+/-) Por Ajustes das Contribuições Extraordinárias',           True, VarArrayOf(['2.3.1.1.03.03'])    ]);
  AddValues([1, '', '', '             (+/-) Patrocinador(es)',                                     True, VarArrayOf(['2.3.1.1.03.03.01']) ]);
  AddValues([1, '', '', '             (+/-) Participantes',                                        True, VarArrayOf(['2.3.1.1.03.03.02']) ]);
  AddValues([1, '', '', '             (+/-) Assistidos',                                           True, VarArrayOf(['2.3.1.1.03.03.03']) ]);
  AddValues([1,'B', '', '   2. Equilíbrio Técnico',                                                True, VarArrayOf(['2.3.1.2'])          ]);
  AddValues([1,'B', '', '      2.1 Resultados Realizados',                                         True, VarArrayOf(['2.3.1.2.01'])       ]);
  AddValues([1, '', '', '         Superávit Técnico Acumulado',                                    True, VarArrayOf(['2.3.1.2.01.01'])    ]);
  AddValues([1, '', '', '            Reserva de Contingência',                                     True, VarArrayOf(['2.3.1.2.01.01.01']) ]);
  AddValues([1, '', '', '            Reserva de Revisão de Plano',                                 True, VarArrayOf(['2.3.1.2.01.01.02']) ]);
  AddValues([1, '', '', '         (-) Déficit Técnico Acumulado',                                 False, VarArrayOf(['2.3.1.2.01.02'])    ]);
  AddValues([1,'B', '', '      2.2 Resultados a Realizar',                                         True, VarArrayOf(['2.3.1.2.02'])       ]);
end;

procedure TRptCGPC28.PreparaReport20407;
begin
  AddValues([1,'B', '', '1. Ativos',                           False, VarArrayOf(['1'])             ]);
  AddValues([1, '', '', '   Disponível',                       False, VarArrayOf(['1.1'])           ]);
  AddValues([1, '', '', '   Recebíveis',                       False, VarArrayOf(['1.2.1','1.2.2']) ]);
  AddValues([1, '', '', '   Investimento',                     False, VarArrayOf(['1.2.3'])         ]);
  AddValues([1, '', '', '      Títulos Públicos',              False, VarArrayOf(['1.2.3.1'])       ]);
  AddValues([1, '', '', '      Créditos Privados e Depósitos', False, VarArrayOf(['1.2.3.2'])       ]);
  AddValues([1, '', '', '      Ações',                         False, VarArrayOf(['1.2.3.3'])       ]);
  AddValues([1, '', '', '      Fundos de Investimento',        False, VarArrayOf(['1.2.3.4'])       ]);
  AddValues([1, '', '', '      Derivativos',                   False, VarArrayOf(['1.2.3.5'])       ]);
  AddValues([1, '', '', '      Investimentos Imobiliários',    False, VarArrayOf(['1.2.3.6'])       ]);
  AddValues([1, '', '', '      Empréstimos',                   False, VarArrayOf(['1.2.3.7.01'])    ]);
  AddValues([1, '', '', '      Financiamentos Imobiliários',   False, VarArrayOf(['1.2.3.7.02'])    ]);
  AddValues([1, '', '', '      Outros Realizáveis',            False, VarArrayOf(['1.2.3.9'])       ]);
  AddValues([1, '', '', '   Permanente',                       False, VarArrayOf(['1.3'])           ]);
  AddValues([1,'B', '', '2. Obrigações',                        True, VarArrayOf(['2.1','2.2'])     ]);
  AddValues([1, '', '', '   Operacional',                       True, VarArrayOf(['2.1'])           ]);
  AddValues([1, '', '', '   Contingencial',                     True, VarArrayOf(['2.2'])           ]);
  // SOL 160035/5324 KINTANA 1331674 Adequação relatórios para CNPC 01/2011
  //AddValues([1,'B', '', 'Total Dos Ativos Líquidos (1-2)',     False, VarArrayOf(['1','2.1','2.2']) ]);
  //AddValues([1,'B', '', '3. Patrimônio Social',                 True, VarArrayOf(['2.3'])           ]);
  AddValues([1,'B', '', '3. Fundos não Previdenciais',          True, VarArrayOf(['2.3.2.2','2.3.2.3'])           ]);
  AddValues([1, '', '', '   Fundos Administrativos',            True, VarArrayOf(['2.3.2.2'])       ]);
  AddValues([1, '', '', '   Fundos dos Investimentos',          True, VarArrayOf(['2.3.2.3'])       ]);
  AddValues([1,'B', '', '4. Resultados a Realizar',             True, VarArrayOf(['2.3.1.2.02'])           ]);
  AddValues([1, '', '', '   Resultados a Realizar',             True, VarArrayOf(['2.3.1.2.02'])    ]);
  AddValues([1,'B', '', '5. Ativo Liquido (1-2-3-4)',           True, VarArrayOf(['1','2.1','2.2','2.3.2.2','2.3.2.3','2.3.1.2.02'])           ]);
  AddValues([1, '', '', '   Provisões Matemáticas',             True, VarArrayOf(['2.3.1.1'])       ]);
  AddValues([1, '', '', '   Superávit/Déficit Técnico',         True, VarArrayOf(['2.3.1.2.01.01','2.3.1.2.01.02']) ]);
  AddValues([1, '', '', '   Fundos Previdenciais',              True, VarArrayOf(['2.3.2.1'])       ]);
  // SOL 160035/5324 KINTANA 1331674 Adequação relatórios para CNPC 01/2011
  //AddValues([1,'B', '', 'Total do Patrimônio Social',           True, VarArrayOf(['2.3'])           ]);
end;

procedure TRptCGPC28.ppFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  ppLblPagina.Visible := (FPaginaNum > 0);
  ppLblPagina.Caption := 'Página   ' + IntToStr(FPaginaNum);
  if FPaginaNum > 0 then Inc(FPaginaNum);
end;

end.
