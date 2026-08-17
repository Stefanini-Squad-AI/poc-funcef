{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: MontarelatorioPorPercVlrImovel
Nº SIG...........: 126818
Data da Alteração: 29/07/2022
Responsável......: Luis Ferrari
Descrição........: Modificado totalização para se ajustar de acordo com o Relat.Analitico
--------------------------------------------------------------------------------
Rotina...........: ConvNum, MontaRelatorioPorPlanoPrevSegregado
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
N. Sol..........: 145744
N. Kintana......: 981496
Data............: 14/10/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no relatório Patrimonial de Imóveis - Sintético, para
                  agrupar corretamente os planos previdenciários que compõem a
                  segregação dos bens dos imóveis em uma determinada vigência.
--------------------------------------------------------------------------------
N. Sol..........: 143594
N. Kintana......: 933950
Data............: 10/09/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no relatório Patrimonial de Imóveis - Sintético, para
                  que a exibição dos resumos de segregação seja feita conforme
                  o período informado na consulta.
--------------------------------------------------------------------------------
N. Sol..........: 142231
N. Kintana......: 905545
Data............: 18/08/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção do relatório Patrimonial de Imóvel - Sintético, que
                  não estava exibindo os percentuais no Resumo de Segregação   
--------------------------------------------------------------------------------
N. Sol..........: 139712
N. Kintana......: 864895
Data............: 14/07/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no relatório Patrimonial de Imóveis - Sintético, que
                  estava exibindo valores errados no totais de segregação por
                  Grupos Contábeis, de cada segmento.
--------------------------------------------------------------------------------
N. Sol..........: 135923
N. Kintana......: 810025
Data............: 14/05/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no relatório Patrimonial de Imóveis - Sintético, para
                  trazer corretamente o percenutal de segregação dos planos
                  previdenciários dos imóveis pertencentes a determinados imóveis
                  mestre.
--------------------------------------------------------------------------------
N. Sol..........: 135765
N. Kintana......: 808154
Data............: 12/05/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção da query de Segregação para o relatório Patrimonial
                  de Imóveis - Sintético, e correção na exibição de segmento no
                  Resumo Geral
--------------------------------------------------------------------------------
N. Sol..........: 131662
N. Kintana......: 753160
Data............: 29/04/2010
Responsável.....: Cássio Camargo
Descrição.......: Alteração realizada no Relatório Patrimonial de Imóveis -
                  Sintético, para contemplar os percentuais seguindo a data de
                  vigência.
--------------------------------------------------------------------------------
N. Sol..........: 131484
N. Kintana......: 749048
Data............: 25/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção da query de Segregação para o relatório Patrimonial
                  de Imóveis - Sintético, que não estava trazendo bens para o
                  segmento CONST
--------------------------------------------------------------------------------

Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 17/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fParamSldCtbImoMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, fcCombo, fcColorCombo,
  uCtrlPlanPrevContabPatro, dBaseDados;

type
  TfrmParamSldCtbImoMestre = class(TfrmOkCancelar)
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    chkValorZero: TCheckBox;
    dbcboPlanoContabil: TwwDBLookupCombo;
    dbcboPatro: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataFimExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro; //Bruno Bastos - Sol: 126224 - Kintana: 657726
    procedure TotalizaGrupos;

    //Cássio - SOL Nº 143594 SOL Nº 933950 - Início
    procedure MontaRelatorioPorPercVlrTotal;
    procedure MontarelatorioPorPercVlrImovel;
    procedure MontaRelatorioPorPlanoPrev;
    //Cássio - SOL Nº 143594 SOL Nº 933950 - Fim

    function ConvNum(nValor : Extended; trun2cd:boolean = false) : Extended; // Vando - SOL 154328-5901 / KTN 1373449
    procedure MontaRelatorioPorPlanoPrevSegregado; // Vando - SOL 154328-5901 / KTN 1373449
  public
    { Public declarations }
    iIdConjunto : Integer;
  end;

var
  frmParamSldCtbImoMestre: TfrmParamSldCtbImoMestre;

implementation

uses dRelBalCaf, uSistema, uMensErro, uModuloImobiliario, dLookImobiliario, uFuncoesImob,
     uCMClientDataSet, uCMMath, uCMControlObject;
{$R *.DFM}

procedure TfrmParamSldCtbImoMestre.FormActivate(Sender: TObject);
begin
   inherited;
   eDataFim.Date := Date;
   eDataFim.SetFocus;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.Initialize(dtmBaseDados.dbBaseDados,True);

   dtmLookImobiliario.qryLookPlanoPrev.Open;
   LimpaParametros(dtmLookImobiliario.qryLookPatrocinadora);
   dtmLookImobiliario.qryLookPatrocinadora.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookPatrocinadora.Open;
   //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim
end;
//========================================================================================
procedure TfrmParamSldCtbImoMestre.bbtnConfirmarClick(Sender: TObject);
var iDia, iMes, iAno : Word;
    sSQL : string;
    _cdsTemp, _cdsTemp2, _cdsTemp3 : TCMClientDataSet;
    _Ctrl : TCmControlObject;
    fCustoCorr0, fDepBemAcum0, fDepBemAtu0, fCustoReav0,
    fDepreAvAcum0, fDepreAvAtu0, fValCtb0, fValorLanc, dPercent : Double;
    i : integer;
    sCodTipImovel : String;
    sIdImovel, sPatro : string;

begin
   inherited;
   dtmRelBalCaf.cdsGrpBem.EmptyDataSet;

   if (eDataFim.Date >= StrToDate('01/01/2010')) and (eDataFim.Date <= StrToDate('31/03/2010')) then
   begin
    dtmRelBalCaf.dsSldCtbImoMestre.DataSet := dtmRelBalCaf.qrySldCtbImoMestre2;
    dtmRelBalCaf.qrySldCtbImoMestre2.Close;

    dtmRelBalCaf.dsGrpSegregacao.DataSet := dtmRelBalCaf.qrySegregacao;
    dtmRelBalCaf.dsTotalGeral.DataSet := dtmRelBalCaf.qryTotalGeral;   
    MontaRelatorioPorPercVlrTotal;
   end
   else
    if (eDataFim.Date >= StrToDate('01/04/2010')) and (eDataFim.Date <= StrToDate('31/07/2010')) then
    begin
      dtmRelBalCaf.dsSldCtbImoMestre.DataSet := dtmRelBalCaf.qrySldCtbImoMestre;
      dtmRelBalCaf.qrySldCtbImoMestre.Close;
      MontarelatorioPorPercVlrImovel;;
    end
    // Vando - SOL 154328-5901 / KTN 1373449 - inicio
    else  if (eDataFim.Date >= StrToDate('01/01/2014')) then
    begin
      dtmRelBalCaf.dsSldCtbImoMestre.DataSet := dtmRelBalCaf.qrySldCtbImoMestre;
      dtmRelBalCaf.qrySldCtbImoMestre.Close;
      MontaRelatorioPorPlanoPrevSegregado;
    end
    // Vando - SOL 154328-5901 / KTN 1373449 - fim
    else
    begin
      dtmRelBalCaf.dsSldCtbImoMestre.DataSet := dtmRelBalCaf.qrySldCtbImoMestre;
      dtmRelBalCaf.qrySldCtbImoMestre.Close;
      MontaRelatorioPorPlanoPrev;
    end;

   Screen.Cursor := crDefault;
   dtmRelBalCaf.bSeparador := chkLinhas.Checked;
   // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
   dtmRelBalCaf.bCorlinha  := chkCorLinha.Checked;
   dtmRelBalCaf.CorLinha   := cboCorLinha.SelectedColor;

   {
   _cdsTemp := TCMClientDataSet.Create(nil);
   _cdsTemp2 := TCMClientDataSet.Create(nil);
   _cdsTemp3 := TCMClientDataSet.Create(nil);
   _Ctrl := TCMControlObject.Create;
   i := 1;
   fValorLanc := 0;
   dPercent := 0;
   try
    _Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);


     //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
     if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
     begin
       MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
              'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
              'Informação', mtInformation, [mbOK], 0);
       ModalResult := mrNone;
       dbcboPatro.SetFocus;
       Exit;
     end;

     if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
     begin
       if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                       StrToInt(dbcboPlanoContabil.LookupValue)) then
       begin
         MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
         ModalResult := mrNone;
         dbcboPlanoContabil.SetFocus;
         Exit;
       end;
     end;
     //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

     Screen.Cursor := crSQLWait;
     //-------------------------------------------------------------------------------------
     with dtmRelBalCaf do begin
       LimpaParametros(dtmRelBalCaf.qrySldCtbImoMestre);
        qrySldCtbImoMestre.Close;
        ppLabel6.Caption := eDataFim.Text;

        //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
        if dbcboPlanoContabil.LookupValue = '' then
          lblPlanoContabil.Caption := 'Plano: < Todos >'
        else
          lblPlanoContabil.Caption := 'Plano: < ' + dbcboPlanoContabil.Text +' >';


        if dbcboPatro.LookupValue = '' then
          lblPatro.Caption := 'Patrocinadora: < Todos >'
        else
          lblPatro.Caption := 'Patrocinadora: < ' + dbcboPatro.Text +' >';
        //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

        if DBcboTipoImovel.LookupValue = '' then
             ppLabel148.Caption := 'Segmento: < Todos >'
        else ppLabel148.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';


        DecodeDate(eDataFim.Date, iAno, iMes, iDia);

        // carrega parâmetros
        qrySldCtbImoMestre.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qrySldCtbImoMestre.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
        qrySldCtbImoMestre.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
        qrySldCtbImoMestre.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
        qrySldCtbImoMestre.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

        if DBcboTipoImovel.Text <> '' then
           qrySldCtbImoMestre.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

        if chkValorZero.Checked then  // imóveis com saldo maior que zero
           qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger :=1
        else
           qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger := 0;

        qrySldCtbImoMestre.Open;

        if qrySldCtbImoMestre.IsEmpty then begin
          MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0);
        end
        else
        begin
          //Alteração começa daqui
          //Cássio - SOL Nº 135765 KINTANA Nº 808154
          if cdsSegregacao.Active then
            cdsSegregacao.EmptyDataSet;

          qrySldCtbImoMestre.First;
          sSQL := 'SELECT   ''                                                                    '' AS DESCGRUPO, ' +
                   '        ''                                                                    '' AS PLANOPREV,' +
                   '        ''                                                           '' AS PATRO, ' +
                   '        0.00 AS PERCENTRATEIO, ' +
                   '        0.00 AS CUSTOCORR0, ' +
                   '        0.00 AS DEPBEMACUM0, ' +
                   '        0.00 AS DEPBEMATU0, ' +
                   '        0.00 AS CUSTOREAV0, ' +
                   '        0.00 AS DEPREAVACUM0, ' +
                   '        0.00 AS DEPREAVATU0, ' +
                   '        0.00 AS VALCTB0 ' +
                   '  FROM DUAL   ' +
                   ' WHERE 1 = 2' ;
          cdsSegregacao.Data := _Ctrl.GetDataPacket(sSQL);

          while not qrySldCtbImoMestre.Eof do
          begin
            //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Início
            sIdImovel := '';
            //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim
            _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT DISTINCT I.IDIMOVEL ' +
                                                 '  FROM IMOVEL I, ' +
                                                 '       (SELECT IDIMOVEL FROM IMOVEL ' +
                                                 '         WHERE IMONOME = ' + QuotedStr(qrySldCtbImoMestre.FieldByName('NOME').asString) + ' ) IM ' +
                                                 ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL ' +
                                                 '   AND I.CODTIPIMOVEL = '+ QuotedStr(qrySldCtbImoMestre.FieldByName('CODTIPIMOVEL').asString));
            while not _cdsTemp3.Eof do
            begin
              if sIdImovel = '' then
                sIdImovel := _cdsTemp3.FieldByName('IDIMOVEL').asString
              else
                sIdImovel := sIdImovel + ',' + _cdsTemp3.FieldByName('IDIMOVEL').asString;
              _cdsTemp3.Next;
            end;
              fCustoCorr0   := 0;
              fDepBemAcum0  := 0;
              fDepBemAtu0   := 0;
              fCustoReav0   := 0;
              fDepreAvAcum0 := 0;
              fDepreAvAtu0  := 0;
              fValCtb0      := 0;
              //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Início
               //('SELECT IMO.IDIMOVEL, IMO.CODTIPIMOVEL, PLN.NOME AS PLANOPREV, PPB.IDPLANOPREV, ' +
              {_cdsTemp.Data := _Ctrl.GetDataPacket('SELECT PLN.NOME AS PLANOPREV, PPB.IDPLANOPREV, ' +
                                                   '       PES.NOME AS PATRO, PPB.IDPATRO, ' +
                                                   //Cássio - SOL Nº 135923 KINTANA Nº 810025 - Início
                                                   //'       SUM((PPB.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) AS PERCENTRATEIO,  ' +
                                                   '       (SUM((PPB.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) / QNT.QNT_IMOVEL) AS PERCENTRATEIO, ' +
                                                   //Cássio - SOL Nº 135923 KINTANA Nº 810025 - Fim
                                                   '       0 AS CUSTOCORR0, 0 AS DEPBEMACUM0, 0 AS DEPBEMATU0, 0 AS CUSTOREAV0, 0 AS DEPREAVACUM0, ' +
                                                   '       0 AS DEPREAVATU0, 0 AS VALCTB0 ' +
                                                   '  FROM PLANOPATROXVIGENCIAIMOB PPB, IMOVEL IMO, PESSOA PES, PLANPREVCONTABIL PLN, ' +
                                                   '       (SELECT SUM(PPI.PERCENTRATEIO) AS PERCENTRATEIO ' + #13 +
                                                   '          FROM PLANOPATROXVIGENCIAIMOB PPI, '   + #13 +
                                                   '                IMOVEL IM   '  + #13 +
                                                   '          WHERE IM.IDIMOVEL IN ( ' + sIdImovel + ')' + #13 +
                                                   '            AND PPI.IDIMOVEL = IM.IDIMOVEL) PT, ' + #13+
                                                   '       (SELECT COUNT(IM.IDIMOVEL) AS QNT_IMOVEL FROM IMOVEL IM ' + #13 +
                                                   '         WHERE IDIMOVEL IN ( ' + sIdImovel + ')) QNT ' +#13+
                                                   //' WHERE IMO.IDIMOVEL = ' + qrySldCtbImoMestre.FieldByName('IDIMOVEL').asString +
                                                   ' WHERE IMO.IDIMOVEL IN( ' + sIdImovel +')' +
                                                   '   AND PPB.DATAVIGENCIA =  (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ' +
                                                   '                              FROM PLANOPATROXVIGENCIAIMOB ' +
                                                   //'                             WHERE IDIMOVEL = ' + qrySldCtbImoMestre.FieldByName('IDIMOVEL').asString +
                                                   '                               WHERE IDIMOVEL = IMO.IDIMOVEL '+
                                                   '                                 AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date)) +')' +
                                                   '   AND PPB.IDIMOVEL = IMO.IDIMOVEL ' +
                                                   '   AND PES.IDPESSOA = PPB.IDPATRO ' +
                                                   '   AND PLN.IDPLANOPREV = PPB.IDPLANOPREV ' + #13 +
                                                   ' GROUP BY IMO.CODTIPIMOVEL, PLN.NOME, PPB.IDPLANOPREV, PES.NOME, PPB.IDPATRO, QNT.QNT_IMOVEL');}
          {
             _cdsTemp.Data :=  _Ctrl.GetDataPacket ('SELECT PLN.NOME AS PLANOPREV,                                                  ' + #13 +
                               '       PPI.IDPLANOPREV,                                                        ' + #13 +
                               '       PES.NOME AS PATRO,                                                      ' + #13 +
                               '       PPI.IDPATRO,                                                            ' + #13 +
                               '       SUM(PPI.PERCENTRATEIO) / COUNT(DISTINCT PPI.IDIMOVEL) AS PERCENTRATEIO, ' + #13 +
                               '       0 AS CUSTOCORR0,                                                        ' + #13 +
                               '       0 AS DEPBEMACUM0,                                                       ' + #13 +
                               '       0 AS DEPBEMATU0,                                                        ' + #13 +
                               '       0 AS CUSTOREAV0,                                                        ' + #13 +
                               '       0 AS DEPREAVACUM0,                                                      ' + #13 +
                               '       0 AS DEPREAVATU0,                                                       ' + #13 +
                               '       0 AS VALCTB0                                                            ' + #13 +
                               '  FROM PLANOPATROXVIGENCIAIMOB PPI,                                            ' + #13 +
                               '       (SELECT IDIMOVEL, MAX(DATAVIGENCIA) AS DATAMAX                          ' + #13 +
                               '          FROM PLANOPATROXVIGENCIAIMOB                                         ' + #13 +
                               '         WHERE IDIMOVEL IN ( ' + sIdImovel + ')                                ' + #13 +
                               '           AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date))        + #13 +
                               '         GROUP BY IDIMOVEL) DT,                                                ' + #13 +
                               '       PESSOA PES,                                                             ' + #13 +
                               '       PLANPREVCONTABIL PLN                                                    ' + #13 +
                               ' WHERE PPI.IDIMOVEL = DT.IDIMOVEL                                              ' + #13 +
                               '   AND PPI.DATAVIGENCIA = DT.DATAMAX                                           ' + #13 +
                               '   AND PES.IDPESSOA = PPI.IDPATRO                                              ' + #13 +
                               '   AND PLN.IDPLANOPREV = PPI.IDPLANOPREV                                       ' + #13 +
                               ' GROUP BY PLN.NOME,                                                            ' + #13 +
                               '       PPI.IDPLANOPREV,                                                        ' + #13 +
                               '       PES.NOME,                                                               ' + #13 +
                               '       PPI.IDPATRO                                                             ' + #13 +
                               ' ORDER BY PPI.IDPATRO, PPI.IDPLANOPREV                                         ' );
             //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim

             while not _cdsTemp.Eof do
             begin
              if not cdsSegregacao.Locate('DESCGRUPO;PATRO;PLANOPREV', VarArrayOf([
                  qrySldCtbImoMestre.FieldByName('DESCGRUPO').Value,
                  _cdsTemp.FieldByName('PATRO').Value,
                  _cdsTemp.FieldByName('PLANOPREV').Value]), []) then
              begin
                cdsSegregacao.Append;
                cdsSegregacao.FieldByName('DESCGRUPO').Value := qrySldCtbImoMestre.FieldByName('DESCGRUPO').Value; //_cdsTemp.FieldByName('CODTIPIMOVEL').Value;
                cdsSegregacao.FieldByName('PLANOPREV').Value := _cdsTemp.FieldByName('PLANOPREV').Value;
                cdsSegregacao.FieldByName('PATRO').Value := _cdsTemp.FieldByName('PATRO').Value;
                cdsSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

                if _cdsTemp.RecNo = _cdsTemp.RecordCount then
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0;
                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0;
                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat :=  qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0;
                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat :=  qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat - fCustoReav0;
                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0;
                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0;
                  cdsSegregacao.FieldByName('VALCTB0').asFloat := qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat - fValCtb0;
                end
                else
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fCustoCorr0 := fCustoCorr0 + cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;

                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepBemAcum0 := fDepBemAcum0 + cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;

                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepBemAtu0 := fDepBemAtu0 + cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;

                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fCustoReav0 := fCustoReav0 + cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;

                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepreAvAcum0 := fDepreAvAcum0 + cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;

                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepreAvAtu0 := fDepreAvAtu0 + cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;

                  cdsSegregacao.FieldByName('VALCTB0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fValCtb0 := fValCtb0 + cdsSegregacao.FieldByName('VALCTB0').asFloat;
                end;
              end
              else
              begin
                cdsSegregacao.Edit;
                if _cdsTemp.RecNo = _cdsTemp.RecordCount then
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat + (qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0);
                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0);
                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0);
                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat  + (qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat - fCustoReav0);
                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0);
                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0);
                  cdsSegregacao.FieldByName('VALCTB0').asFloat :=  cdsSegregacao.FieldByName('VALCTB0').asFloat + (qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat - fValCtb0);
                end
                else
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fCustoCorr0 := fCustoCorr0 +  RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepBemAcum0 := fDepBemAcum0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := cdsSegregacao.FieldByName('DEPBEMATU0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2));
                  fDepBemAtu0 := fDepBemAtu0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2);

                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := cdsSegregacao.FieldByName('CUSTOREAV0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fCustoReav0 := fCustoReav0 + RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepreAvAcum0 := fDepreAvAcum0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepreAvAtu0 := fDepreAvAtu0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('VALCTB0').asFloat := cdsSegregacao.FieldByName('VALCTB0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fValCtb0 := fValCtb0 + RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                end;
              end;
              cdsSegregacao.Post;
              _cdsTemp.Next;
             end;
            //_cdsTemp3.Next;
           //end;
           qrySldCtbImoMestre.Next;
          end;

          _cdsTemp2.Data := _Ctrl.GetDataPacket('SELECT ''                                                                    '' AS DESCGRUPO, ' +
                                               '        ''                                                                    '' AS PLANOPREV,' +
                                               '        ''                                                           '' AS PATRO, ' +
                                               '        0.00 AS PERCENTRATEIO, ' +
                                               '        0.00 AS CUSTOCORR0, ' +
                                               '        0.00 AS DEPBEMACUM0, ' +
                                               '        0.00 AS DEPBEMATU0, ' +
                                               '        0.00 AS CUSTOREAV0, ' +
                                               '        0.00 AS DEPREAVACUM0, ' +
                                               '        0.00 AS DEPREAVATU0, ' +
                                               '        0.00 AS VALCTB0 ' +
                                               '  FROM DUAL   ' +
                                               ' WHERE 1 = 2');

            cdsSegregacao.First;
            while not cdsSegregacao.Eof do
            begin
             _cdsTemp2.Append;
             _cdsTemp2.FieldByName('DESCGRUPO').asString := cdsSegregacao.FieldByName('DESCGRUPO').asString;
             _cdsTemp2.FieldByName('PLANOPREV').asString := cdsSegregacao.FieldByName('PLANOPREV').asString;
             _cdsTemp2.FieldByName('PATRO').asString :=  cdsSegregacao.FieldByName('PATRO').asString;
             _cdsTemp2.FieldByName('PERCENTRATEIO').asFloat :=  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat;
             _cdsTemp2.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;
             _cdsTemp2.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;
             _cdsTemp2.FieldByName('DEPBEMATU0').asFloat :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;
             _cdsTemp2.FieldByName('CUSTOREAV0').asFloat :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;
             _cdsTemp2.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;
             _cdsTemp2.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;
             _cdsTemp2.FieldByName('VALCTB0').asFloat :=  cdsSegregacao.FieldByName('VALCTB0').asFloat;
             _cdsTemp2.Post;
             cdsSegregacao.Next;
            end;
            cdsSegregacao.First;
            _cdsTemp2.First;

            while not cdsSegregacao.Eof do
            begin
              sCodTipImovel := _cdsTemp2.FieldByName('DESCGRUPO').asString;
              while (sCodTipImovel = _cdsTemp2.FieldByName('DESCGRUPO').asString) and (not _cdsTemp2.Eof) do
              begin
                fValorLanc := fValorLanc + _cdsTemp2.FieldByName('VALCTB0').asFloat;
                _cdsTemp2.Next;
              end;

              while (sCodTipImovel = cdsSegregacao.FieldByName('DESCGRUPO').asString) and (not cdsSegregacao.Eof) do
              begin
                cdsSegregacao.Edit;
                //Cássio SOL Nº 142231 KINTANA Nº 905545 - Início
                if fValorLanc > 0 then
                  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := RoundCM((cdsSegregacao.FieldByName('VALCTB0').asFloat * 100) /
                                                                                          fValorLanc,2)
                //Cássio SOL Nº 142231 KINTANA Nº 905545 - Fim
                else
                  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := 0;

                cdsSegregacao.Post;
                cdsSegregacao.Next;
              end;
              fValorLanc := 0;
            end;
          //Cássio - SOL Nº 135765 KINTANA Nº 808154
          if cdsTotalGeral.Active then
            cdsTotalGeral.EmptyDataSet;

          sSQL := 'SELECT  ''                                                                    '' AS PLANOPREV,' +
                  '        ''                                                           '' AS PATRO, ' +
                  '        0.00 AS PERCENTRATEIO, ' +
                  '        0.00 AS CUSTOCORR0, ' +
                  '        0.00 AS DEPBEMACUM0, ' +
                  '        0.00 AS DEPBEMATU0, ' +
                  '        0.00 AS CUSTOREAV0, ' +
                  '        0.00 AS DEPREAVACUM0, ' +
                  '        0.00 AS DEPREAVATU0, ' +
                  '        0.00 AS VALCTB0 ' +
                  '  FROM DUAL   ' +
                  ' WHERE 1 = 2' ;
          cdsTotalGeral.Data := _Ctrl.GetDataPacket(sSQL);

          cdsSegregacao.First;
          while not cdsSegregacao.Eof do
          begin
            if not cdsTotalGeral.Locate('PATRO;PLANOPREV', VarArrayOf([
                                      cdsSegregacao.FieldByName('PATRO').Value,
                                      cdsSegregacao.FieldByName('PLANOPREV').Value]), []) then
            begin
              cdsTotalGeral.Append;
              cdsTotalGeral.FieldByName('PLANOPREV').Value := cdsSegregacao.FieldByName('PLANOPREV').Value;
              cdsTotalGeral.FieldByName('PATRO').Value := cdsSegregacao.FieldByName('PATRO').Value;
              cdsTotalGeral.FieldByName('PERCENTRATEIO').Value := 0;
              cdsTotalGeral.FieldByName('CUSTOCORR0').Value := cdsSegregacao.FieldByName('CUSTOCORR0').Value;
              cdsTotalGeral.FieldByName('DEPBEMACUM0').Value := cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
              cdsTotalGeral.FieldByName('DEPBEMATU0').Value := cdsSegregacao.FieldByName('DEPBEMATU0').Value;
              cdsTotalGeral.FieldByName('CUSTOREAV0').Value := cdsSegregacao.FieldByName('CUSTOREAV0').Value;
              cdsTotalGeral.FieldByName('DEPREAVACUM0').Value := cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
              cdsTotalGeral.FieldByName('DEPREAVATU0').Value := cdsSegregacao.FieldByName('DEPREAVATU0').Value;
              cdsTotalGeral.FieldByName('VALCTB0').Value := cdsSegregacao.FieldByName('VALCTB0').Value;
            end
            else
            begin
              cdsTotalGeral.Edit;
              cdsTotalGeral.FieldByName('CUSTOCORR0').Value := cdsTotalGeral.FieldByName('CUSTOCORR0').Value +
                                                             cdsSegregacao.FieldByName('CUSTOCORR0').Value;
              cdsTotalGeral.FieldByName('DEPBEMACUM0').Value := cdsTotalGeral.FieldByName('DEPBEMACUM0').Value +
                                                              cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
              cdsTotalGeral.FieldByName('DEPBEMATU0').Value := cdsTotalGeral.FieldByName('DEPBEMATU0').Value +
                                                             cdsSegregacao.FieldByName('DEPBEMATU0').Value;
              cdsTotalGeral.FieldByName('CUSTOREAV0').Value := cdsTotalGeral.FieldByName('CUSTOREAV0').Value  +
                                                             cdsSegregacao.FieldByName('CUSTOREAV0').Value;
              cdsTotalGeral.FieldByName('DEPREAVACUM0').Value := cdsTotalGeral.FieldByName('DEPREAVACUM0').Value +
                                                               cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
              cdsTotalGeral.FieldByName('DEPREAVATU0').Value := cdsTotalGeral.FieldByName('DEPREAVATU0').Value +
                                                              cdsSegregacao.FieldByName('DEPREAVATU0').Value;
              cdsTotalGeral.FieldByName('VALCTB0').Value := cdsTotalGeral.FieldByName('VALCTB0').Value +
                                                          cdsSegregacao.FieldByName('VALCTB0').Value;
            end;
            cdsTotalGeral.Post;
            cdsSegregacao.Next;
          end;

          i := 1;
          fValorLanc := 0;
          cdsTotalGeral.First;
          //Cássio SOL Nº 142231 KINTANA Nº 905545 - Início
          _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT ''                                                           '' AS PATRO FROM DUAL WHERE 1=2');

          while not cdsTotalGeral.Eof do
          begin
            if not _cdsTemp3.Locate('PATRO', VarArrayOf([cdsTotalGeralPATRO.Value]), []) then
            begin
              _cdsTemp3.Append;
              _cdsTemp3.FieldByName('PATRO').Value := cdsTotalGeralPATRO.Value;
              _cdsTemp3.Post;
            end;
            cdsTotalGeral.Next;
          end;

          _cdsTemp3.First;
          while not _cdsTemp3.Eof do
          begin
            dPercent := 0;
            fValorLanc:= 0;
            cdsTotalGeral.First;
            cdsTotalGeral.Filter := 'PATRO = ' +QuotedStr(_cdsTemp3.FieldByName('PATRO').asString);
            cdsTotalGeral.Filtered := True;

            while not cdsTotalGeral.Eof do
            begin
              fValorLanc := fValorLanc + cdsTotalGeral.FieldByName('VALCTB0').AsFloat;
              cdsTotalGeral.Next;
            end;
            cdsTotalGeral.First;

            while not cdsTotalGeral.Eof do
            begin
              cdsTotalGeral.Edit;
              if cdsTotalGeral.RecNo = cdsTotalGeral.RecordCount then
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent
              else
                if fValorLanc > 0 then
                  cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := RoundCM((cdsTotalGeral.FieldByName('VALCTB0').asFloat * 100) /
                                                                                fValorLanc ,2)
                else
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 0;

              dPercent := dPercent + cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat;

              cdsTotalGeral.Post;
              cdsTotalGeral.Next;
            end;
           _cdsTemp3.Next;
          end;
          //Alteração termina aqui
          cdsTotalGeral.Filtered := False;
          //Cássio SOL Nº 142231 KINTANA Nº 905545 - Fim
          TotalizaGrupos;
        end;

        Screen.Cursor := crDefault;
        dtmRelBalCaf.bSeparador := chkLinhas.Checked;
        // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
        dtmRelBalCaf.bCorlinha  := chkCorLinha.Checked;
        dtmRelBalCaf.CorLinha   := cboCorLinha.SelectedColor;

     end;
     // Carrega o Logotipo
  finally
    FreeAndNil(_cdsTemp);
    FreeAndNil(_cdsTemp2);
    FreeAndNil(_cdsTemp3);
    FreeAndNil(_Ctrl);
  end;  }
end;
//========================================================================================
procedure TfrmParamSldCtbImoMestre.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;

procedure TfrmParamSldCtbImoMestre.TotalizaGrupos;
begin   
  with dtmRelBalCaf do
  begin
    if (eDataFim.Date >= StrToDate('01/01/2010')) and (eDataFim.Date <= StrToDate('31/03/2010')) then
    begin
      qrySldCtbImoMestre2.First;

      if cdsGrpBem.Active then
        cdsGrpBem.EmptyDataSet;

      while not qrySldCtbImoMestre2.Eof do begin
        if not cdsGrpBem.Locate('IDGRUPO',qrySldCtbImoMestre2.FieldByName('IDGRUPO').AsInteger,[]) then
        begin
          cdsGrpBem.Insert;
          cdsGrpBemIDGRUPO.AsInteger  := qrySldCtbImoMestre2.FieldByName('IDGRUPO').AsInteger;
          cdsGrpBemDSC_GRUPO.AsString := qrySldCtbImoMestre2.FieldByName('DESCGRUPO').AsString;
        end
        else
        begin
          cdsGrpBem.Edit;
        end;
        cdsGrpBemVLR_CUSTO.AsFloat    := cdsGrpBemVLR_CUSTO.AsFloat    + qrySldCtbImoMestre2.FieldByName('CUSTOCORR0').AsFloat;
        cdsGrpBemVLR_CM.AsFloat       := cdsGrpBemVLR_CM.AsFloat       + qrySldCtbImoMestre2.FieldByName('CMBEM0').AsFloat;
        cdsGrpBemVLR_CUSTOACU.AsFloat := cdsGrpBemVLR_CUSTOACU.AsFloat + qrySldCtbImoMestre2.FieldByName('DEPBEMACUM0').AsFloat;
        cdsGrpBemVLR_CUSTOMES.AsFloat := cdsGrpBemVLR_CUSTOMES.AsFloat + qrySldCtbImoMestre2.FieldByName('DEPBEMATU0').AsFloat;
        cdsGrpBemVLR_REAV.AsFloat     := cdsGrpBemVLR_REAV.AsFloat     + qrySldCtbImoMestre2.FieldByName('CUSTOREAV0').AsFloat;
        cdsGrpBemVLR_REAVACU.AsFloat  := cdsGrpBemVLR_REAVACU.AsFloat  + qrySldCtbImoMestre2.FieldByName('DEPREAVACUM0').AsFloat;
        cdsGrpBemVLR_REAVMES.AsFloat  := cdsGrpBemVLR_REAVMES.AsFloat  + qrySldCtbImoMestre2.FieldByName('DEPREAVATU0').AsFloat;
        cdsGrpBemVLR_SLDCTB.AsFloat   := cdsGrpBemVLR_SLDCTB.AsFloat   + qrySldCtbImoMestre2.FieldByName('VALCTB0').AsFloat;
        cdsGrpBem.Post;
        qrySldCtbImoMestre2.Next;
      end;
      qrySldCtbImoMestre2.First;
      cdsGrpBem.First;
    end
  else
    begin
      qrySldCtbImoMestre.First;

      if cdsGrpBem.Active then
        cdsGrpBem.EmptyDataSet;

      while not qrySldCtbImoMestre.Eof do
      begin
        if not cdsGrpBem.Locate('IDGRUPO',qrySldCtbImoMestreIDGRUPO.AsInteger,[]) then
        begin
          cdsGrpBem.Insert;
          cdsGrpBemIDGRUPO.AsInteger  := qrySldCtbImoMestreIDGRUPO.AsInteger;
          cdsGrpBemDSC_GRUPO.AsString := qrySldCtbImoMestreDESCGRUPO.AsString;
        end
        else
        begin
          cdsGrpBem.Edit;
        end;
        cdsGrpBemVLR_CUSTO.AsFloat    := cdsGrpBemVLR_CUSTO.AsFloat    + qrySldCtbImoMestreCUSTOCORR0.AsFloat;
        cdsGrpBemVLR_CM.AsFloat       := cdsGrpBemVLR_CM.AsFloat       + qrySldCtbImoMestreCMBEM0.AsFloat;
        cdsGrpBemVLR_CUSTOACU.AsFloat := cdsGrpBemVLR_CUSTOACU.AsFloat + qrySldCtbImoMestreDEPBEMACUM0.AsFloat;
        cdsGrpBemVLR_CUSTOMES.AsFloat := cdsGrpBemVLR_CUSTOMES.AsFloat + qrySldCtbImoMestreDEPBEMATU0.AsFloat;
        cdsGrpBemVLR_REAV.AsFloat     := cdsGrpBemVLR_REAV.AsFloat     + qrySldCtbImoMestreCUSTOREAV0.AsFloat;
        cdsGrpBemVLR_REAVACU.AsFloat  := cdsGrpBemVLR_REAVACU.AsFloat  + qrySldCtbImoMestreDEPREAVACUM0.AsFloat;
        cdsGrpBemVLR_REAVMES.AsFloat  := cdsGrpBemVLR_REAVMES.AsFloat  + qrySldCtbImoMestreDEPREAVATU0.AsFloat;
        cdsGrpBemVLR_SLDCTB.AsFloat   := cdsGrpBemVLR_SLDCTB.AsFloat   + qrySldCtbImoMestreVALCTB0.AsFloat;
        cdsGrpBem.Post;
        qrySldCtbImoMestre.Next;
      end;
      qrySldCtbImoMestre.First;
      cdsGrpBem.First;
    end;
  end;
end;

procedure TfrmParamSldCtbImoMestre.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro.Free; //Bruno Bastos - Sol: 126224 - Kintana: 657726
end;

procedure TfrmParamSldCtbImoMestre.MontarelatorioPorPercVlrImovel;
var iDia, iMes, iAno : Word;
    sSQL : string;
    _cdsTemp, _cdsTemp2, _cdsTemp3 : TCMClientDataSet;
    _Ctrl : TCmControlObject;
    fCustoCorr0, fDepBemAcum0, fDepBemAtu0, fCustoReav0,
    fDepreAvAcum0, fDepreAvAtu0, fValCtb0, fValorLanc, dPercent : Double;
    i : integer;
    sCodTipImovel : String;
    sIdImovel : string;
begin

   _cdsTemp := TCMClientDataSet.Create(nil);
   _cdsTemp2 := TCMClientDataSet.Create(nil);
   _cdsTemp3 := TCMClientDataSet.Create(nil);
   _Ctrl := TCMControlObject.Create;
   i := 1;
   fValorLanc := 0;
   dPercent := 0;
   try
    _Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);


     //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
     if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
     begin
       MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
              'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
              'Informação', mtInformation, [mbOK], 0);
       ModalResult := mrNone;
       dbcboPatro.SetFocus;
       Exit;
     end;

     if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
     begin
       if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                       StrToInt(dbcboPlanoContabil.LookupValue)) then
       begin
         MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
         ModalResult := mrNone;
         dbcboPlanoContabil.SetFocus;
         Exit;
       end;
     end;
     //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

     Screen.Cursor := crSQLWait;
     //-------------------------------------------------------------------------------------
     with dtmRelBalCaf do begin
       dsGrpSegregacao.DataSet := cdsSegregacao;
       dsTotalGeral.DataSet := cdsTotalGeral;

       LimpaParametros(dtmRelBalCaf.qrySldCtbImoMestre);
        qrySldCtbImoMestre.Close;
        ppLabel6.Caption := eDataFim.Text;

        //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
        if dbcboPlanoContabil.LookupValue = '' then
          lblPlanoContabil.Caption := 'Plano: < Todos >'
        else
          lblPlanoContabil.Caption := 'Plano: < ' + dbcboPlanoContabil.Text +' >';


        if dbcboPatro.LookupValue = '' then
          lblPatro.Caption := 'Patrocinadora: < Todos >'
        else
          lblPatro.Caption := 'Patrocinadora: < ' + dbcboPatro.Text +' >';
        //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

        if DBcboTipoImovel.LookupValue = '' then
             ppLabel148.Caption := 'Segmento: < Todos >'
        else ppLabel148.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';


        DecodeDate(eDataFim.Date, iAno, iMes, iDia);

        // carrega parâmetros
        qrySldCtbImoMestre.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qrySldCtbImoMestre.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
        qrySldCtbImoMestre.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
        qrySldCtbImoMestre.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
        qrySldCtbImoMestre.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

        if DBcboTipoImovel.Text <> '' then
           qrySldCtbImoMestre.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

        if chkValorZero.Checked then  // imóveis com saldo maior que zero
           qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger :=1
        else
           qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger := 0;

        qrySldCtbImoMestre.SQL.Savetofile('c:\planus\temp\sintetico1.txt');     // SIG 126818 Ferrari
        qrySldCtbImoMestre.Open;

        if qrySldCtbImoMestre.IsEmpty then begin
          MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0);
        end
        else
        begin
          //Alteração começa daqui
          //Cássio - SOL Nº 135765 KINTANA Nº 808154
          if cdsSegregacao.Active then
            cdsSegregacao.EmptyDataSet;

          qrySldCtbImoMestre.First;
          sSQL := 'SELECT   ''                                                                    '' AS DESCGRUPO, ' +
                   '        ''                                                                    '' AS PLANOPREV,' +
                   '        ''                                                           '' AS PATRO, ' +
                   '        0.00 AS PERCENTRATEIO, ' +
                   '        0.00 AS CUSTOCORR0, ' +
                   '        0.00 AS DEPBEMACUM0, ' +
                   '        0.00 AS DEPBEMATU0, ' +
                   '        0.00 AS CUSTOREAV0, ' +
                   '        0.00 AS DEPREAVACUM0, ' +
                   '        0.00 AS DEPREAVATU0, ' +
                   '        0.00 AS VALCTB0 ' +
                   '  FROM DUAL   ' +
                   ' WHERE 1 = 2' ;
          cdsSegregacao.Data := _Ctrl.GetDataPacket(sSQL);

          while not qrySldCtbImoMestre.Eof do
          begin
            //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Início
            sIdImovel := '';
            //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim
            _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT DISTINCT I.IDIMOVEL ' +
                                                 '  FROM IMOVEL I, ' +
                                                 '       (SELECT IDIMOVEL FROM IMOVEL ' +
                                                 '         WHERE IMONOME = ' + QuotedStr(qrySldCtbImoMestre.FieldByName('NOME').asString) + ' ) IM ' +
                                                 ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL ' +
                                                 '   AND I.CODTIPIMOVEL = '+ QuotedStr(qrySldCtbImoMestre.FieldByName('CODTIPIMOVEL').asString));
            while not _cdsTemp3.Eof do
            begin
              if sIdImovel = '' then
                sIdImovel := _cdsTemp3.FieldByName('IDIMOVEL').asString
              else
                sIdImovel := sIdImovel + ',' + _cdsTemp3.FieldByName('IDIMOVEL').asString;
              _cdsTemp3.Next;
            end;
              fCustoCorr0   := 0;
              fDepBemAcum0  := 0;
              fDepBemAtu0   := 0;
              fCustoReav0   := 0;
              fDepreAvAcum0 := 0;
              fDepreAvAtu0  := 0;
              fValCtb0      := 0;
              //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Início
               //('SELECT IMO.IDIMOVEL, IMO.CODTIPIMOVEL, PLN.NOME AS PLANOPREV, PPB.IDPLANOPREV, ' +
              {_cdsTemp.Data := _Ctrl.GetDataPacket('SELECT PLN.NOME AS PLANOPREV, PPB.IDPLANOPREV, ' +
                                                   '       PES.NOME AS PATRO, PPB.IDPATRO, ' +
                                                   //Cássio - SOL Nº 135923 KINTANA Nº 810025 - Início
                                                   //'       SUM((PPB.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) AS PERCENTRATEIO,  ' +
                                                   '       (SUM((PPB.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) / QNT.QNT_IMOVEL) AS PERCENTRATEIO, ' +
                                                   //Cássio - SOL Nº 135923 KINTANA Nº 810025 - Fim
                                                   '       0 AS CUSTOCORR0, 0 AS DEPBEMACUM0, 0 AS DEPBEMATU0, 0 AS CUSTOREAV0, 0 AS DEPREAVACUM0, ' +
                                                   '       0 AS DEPREAVATU0, 0 AS VALCTB0 ' +
                                                   '  FROM PLANOPATROXVIGENCIAIMOB PPB, IMOVEL IMO, PESSOA PES, PLANPREVCONTABIL PLN, ' +
                                                   '       (SELECT SUM(PPI.PERCENTRATEIO) AS PERCENTRATEIO ' + #13 +
                                                   '          FROM PLANOPATROXVIGENCIAIMOB PPI, '   + #13 +
                                                   '                IMOVEL IM   '  + #13 +
                                                   '          WHERE IM.IDIMOVEL IN ( ' + sIdImovel + ')' + #13 +
                                                   '            AND PPI.IDIMOVEL = IM.IDIMOVEL) PT, ' + #13+
                                                   '       (SELECT COUNT(IM.IDIMOVEL) AS QNT_IMOVEL FROM IMOVEL IM ' + #13 +
                                                   '         WHERE IDIMOVEL IN ( ' + sIdImovel + ')) QNT ' +#13+
                                                   //' WHERE IMO.IDIMOVEL = ' + qrySldCtbImoMestre.FieldByName('IDIMOVEL').asString +
                                                   ' WHERE IMO.IDIMOVEL IN( ' + sIdImovel +')' +
                                                   '   AND PPB.DATAVIGENCIA =  (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ' +
                                                   '                              FROM PLANOPATROXVIGENCIAIMOB ' +
                                                   //'                             WHERE IDIMOVEL = ' + qrySldCtbImoMestre.FieldByName('IDIMOVEL').asString +
                                                   '                               WHERE IDIMOVEL = IMO.IDIMOVEL '+
                                                   '                                 AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date)) +')' +
                                                   '   AND PPB.IDIMOVEL = IMO.IDIMOVEL ' +
                                                   '   AND PES.IDPESSOA = PPB.IDPATRO ' +
                                                   '   AND PLN.IDPLANOPREV = PPB.IDPLANOPREV ' + #13 +
                                                   ' GROUP BY IMO.CODTIPIMOVEL, PLN.NOME, PPB.IDPLANOPREV, PES.NOME, PPB.IDPATRO, QNT.QNT_IMOVEL');}

             _cdsTemp.Data :=  _Ctrl.GetDataPacket ('SELECT PLN.NOME AS PLANOPREV,                                                  ' + #13 +
                               '       PPI.IDPLANOPREV,                                                        ' + #13 +
                               '       PES.NOME AS PATRO,                                                      ' + #13 +
                               '       PPI.IDPATRO,                                                            ' + #13 +
                               '       SUM(PPI.PERCENTRATEIO) / COUNT(DISTINCT PPI.IDIMOVEL) AS PERCENTRATEIO, ' + #13 +
                               '       0 AS CUSTOCORR0,                                                        ' + #13 +
                               '       0 AS DEPBEMACUM0,                                                       ' + #13 +
                               '       0 AS DEPBEMATU0,                                                        ' + #13 +
                               '       0 AS CUSTOREAV0,                                                        ' + #13 +
                               '       0 AS DEPREAVACUM0,                                                      ' + #13 +
                               '       0 AS DEPREAVATU0,                                                       ' + #13 +
                               '       0 AS VALCTB0                                                            ' + #13 +
                               '  FROM PLANOPATROXVIGENCIAIMOB PPI,                                            ' + #13 +
                               '       (SELECT IDIMOVEL, MAX(DATAVIGENCIA) AS DATAMAX                          ' + #13 +
                               '          FROM PLANOPATROXVIGENCIAIMOB                                         ' + #13 +
                               '         WHERE IDIMOVEL IN ( ' + sIdImovel + ')                                ' + #13 +
                               '           AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date))        + #13 +
                               '         GROUP BY IDIMOVEL) DT,                                                ' + #13 +
                               '       PESSOA PES,                                                             ' + #13 +
                               '       PLANPREVCONTABIL PLN                                                    ' + #13 +
                               ' WHERE PPI.IDIMOVEL = DT.IDIMOVEL                                              ' + #13 +
                               '   AND PPI.DATAVIGENCIA = DT.DATAMAX                                           ' + #13 +
                               '   AND PES.IDPESSOA = PPI.IDPATRO                                              ' + #13 +
                               '   AND PLN.IDPLANOPREV = PPI.IDPLANOPREV                                       ' + #13 +
                               ' GROUP BY PLN.NOME,                                                            ' + #13 +
                               '       PPI.IDPLANOPREV,                                                        ' + #13 +
                               '       PES.NOME,                                                               '  + #13 +
                               '       PPI.IDPATRO                                                             ');
             //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim

             while not _cdsTemp.Eof do
             begin
              if not cdsSegregacao.Locate('DESCGRUPO;PATRO;PLANOPREV', VarArrayOf([
                  qrySldCtbImoMestre.FieldByName('DESCGRUPO').Value,
                  _cdsTemp.FieldByName('PATRO').Value,
                  _cdsTemp.FieldByName('PLANOPREV').Value]), []) then
              begin
                cdsSegregacao.Append;
                cdsSegregacao.FieldByName('DESCGRUPO').Value := qrySldCtbImoMestre.FieldByName('DESCGRUPO').Value; //_cdsTemp.FieldByName('CODTIPIMOVEL').Value;
                cdsSegregacao.FieldByName('PLANOPREV').Value := _cdsTemp.FieldByName('PLANOPREV').Value;
                cdsSegregacao.FieldByName('PATRO').Value := _cdsTemp.FieldByName('PATRO').Value;
                cdsSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

                if _cdsTemp.RecNo = _cdsTemp.RecordCount then
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0;
                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0;
                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat :=  qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0;
                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat :=  qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat - fCustoReav0;
                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0;
                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0;
                  cdsSegregacao.FieldByName('VALCTB0').asFloat := qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat - fValCtb0;
                end
                else
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fCustoCorr0 := fCustoCorr0 + cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;

                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepBemAcum0 := fDepBemAcum0 + cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;

                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepBemAtu0 := fDepBemAtu0 + cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;

                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fCustoReav0 := fCustoReav0 + cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;

                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepreAvAcum0 := fDepreAvAcum0 + cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;

                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepreAvAtu0 := fDepreAvAtu0 + cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;

                  cdsSegregacao.FieldByName('VALCTB0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fValCtb0 := fValCtb0 + cdsSegregacao.FieldByName('VALCTB0').asFloat;
                end;
              end
              else
              begin
                cdsSegregacao.Edit;
                if _cdsTemp.RecNo = _cdsTemp.RecordCount then
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat + (qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0);
                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0);
                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0);
                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat  + (qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat - fCustoReav0);
                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0);
                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0);
                  cdsSegregacao.FieldByName('VALCTB0').asFloat :=  cdsSegregacao.FieldByName('VALCTB0').asFloat + (qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat - fValCtb0);
                end
                else
                begin
                  cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fCustoCorr0 := fCustoCorr0 +  RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepBemAcum0 := fDepBemAcum0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := cdsSegregacao.FieldByName('DEPBEMATU0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2));
                  fDepBemAtu0 := fDepBemAtu0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2);

                  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := cdsSegregacao.FieldByName('CUSTOREAV0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fCustoReav0 := fCustoReav0 + RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepreAvAcum0 := fDepreAvAcum0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepreAvAtu0 := fDepreAvAtu0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsSegregacao.FieldByName('VALCTB0').asFloat := cdsSegregacao.FieldByName('VALCTB0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fValCtb0 := fValCtb0 + RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                end;
              end;
              cdsSegregacao.Post;
              _cdsTemp.Next;
             end;
            //_cdsTemp3.Next;
           //end;
           qrySldCtbImoMestre.Next;
          end;

          _cdsTemp2.Data := _Ctrl.GetDataPacket('SELECT ''                                                                    '' AS DESCGRUPO, ' +
                                               '        ''                                                                    '' AS PLANOPREV,' +
                                               '        ''                                                           '' AS PATRO, ' +
                                               '        0.00 AS PERCENTRATEIO, ' +
                                               '        0.00 AS CUSTOCORR0, ' +
                                               '        0.00 AS DEPBEMACUM0, ' +
                                               '        0.00 AS DEPBEMATU0, ' +
                                               '        0.00 AS CUSTOREAV0, ' +
                                               '        0.00 AS DEPREAVACUM0, ' +
                                               '        0.00 AS DEPREAVATU0, ' +
                                               '        0.00 AS VALCTB0 ' +
                                               '  FROM DUAL   ' +
                                               ' WHERE 1 = 2');

            cdsSegregacao.First;
            while not cdsSegregacao.Eof do
            begin
             _cdsTemp2.Append;
             _cdsTemp2.FieldByName('DESCGRUPO').asString := cdsSegregacao.FieldByName('DESCGRUPO').asString;
             _cdsTemp2.FieldByName('PLANOPREV').asString := cdsSegregacao.FieldByName('PLANOPREV').asString;
             _cdsTemp2.FieldByName('PATRO').asString :=  cdsSegregacao.FieldByName('PATRO').asString;
             _cdsTemp2.FieldByName('PERCENTRATEIO').asFloat :=  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat;
             _cdsTemp2.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;
             _cdsTemp2.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;
             _cdsTemp2.FieldByName('DEPBEMATU0').asFloat :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;
             _cdsTemp2.FieldByName('CUSTOREAV0').asFloat :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;
             _cdsTemp2.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;
             _cdsTemp2.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;
             _cdsTemp2.FieldByName('VALCTB0').asFloat :=  cdsSegregacao.FieldByName('VALCTB0').asFloat;
             _cdsTemp2.Post;
             cdsSegregacao.Next;
            end;
            cdsSegregacao.First;
            _cdsTemp2.First;

            while not cdsSegregacao.Eof do
            begin
              sCodTipImovel := _cdsTemp2.FieldByName('DESCGRUPO').asString;
              while (sCodTipImovel = _cdsTemp2.FieldByName('DESCGRUPO').asString) and (not _cdsTemp2.Eof) do
              begin
                fValorLanc := fValorLanc + _cdsTemp2.FieldByName('VALCTB0').asFloat;
                _cdsTemp2.Next;
              end;

              while (sCodTipImovel = cdsSegregacao.FieldByName('DESCGRUPO').asString) and (not cdsSegregacao.Eof) do
              begin
                cdsSegregacao.Edit;

                if fValorLanc > 0 then
                  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := RoundCM((cdsSegregacao.FieldByName('VALCTB0').asFloat * 100) /
                                                                                        fValorLanc,2)
                else
                  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := 0;

                cdsSegregacao.Post;
                cdsSegregacao.Next;
              end;
              fValorLanc := 0;
            end;
          //Cássio - SOL Nº 135765 KINTANA Nº 808154
          if cdsTotalGeral.Active then
            cdsTotalGeral.EmptyDataSet;

          sSQL := 'SELECT  ''                                                                    '' AS PLANOPREV,' +
                  '        ''                                                           '' AS PATRO, ' +
                  '        0.00 AS PERCENTRATEIO, ' +
                  '        0.00 AS CUSTOCORR0, ' +
                  '        0.00 AS DEPBEMACUM0, ' +
                  '        0.00 AS DEPBEMATU0, ' +
                  '        0.00 AS CUSTOREAV0, ' +
                  '        0.00 AS DEPREAVACUM0, ' +
                  '        0.00 AS DEPREAVATU0, ' +
                  '        0.00 AS VALCTB0 ' +
                  '  FROM DUAL   ' +
                  ' WHERE 1 = 2' ;
          cdsTotalGeral.Data := _Ctrl.GetDataPacket(sSQL);

          cdsSegregacao.First;
          while not cdsSegregacao.Eof do
          begin
            if not cdsTotalGeral.Locate('PATRO;PLANOPREV', VarArrayOf([
                                      cdsSegregacao.FieldByName('PATRO').Value,
                                      cdsSegregacao.FieldByName('PLANOPREV').Value]), []) then
            begin
              cdsTotalGeral.Append;
              cdsTotalGeral.FieldByName('PLANOPREV').Value := cdsSegregacao.FieldByName('PLANOPREV').Value;
              cdsTotalGeral.FieldByName('PATRO').Value := cdsSegregacao.FieldByName('PATRO').Value;
              cdsTotalGeral.FieldByName('PERCENTRATEIO').Value := 0;
              cdsTotalGeral.FieldByName('CUSTOCORR0').Value := cdsSegregacao.FieldByName('CUSTOCORR0').Value;
              cdsTotalGeral.FieldByName('DEPBEMACUM0').Value := cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
              cdsTotalGeral.FieldByName('DEPBEMATU0').Value := cdsSegregacao.FieldByName('DEPBEMATU0').Value;
              cdsTotalGeral.FieldByName('CUSTOREAV0').Value := cdsSegregacao.FieldByName('CUSTOREAV0').Value;
              cdsTotalGeral.FieldByName('DEPREAVACUM0').Value := cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
              cdsTotalGeral.FieldByName('DEPREAVATU0').Value := cdsSegregacao.FieldByName('DEPREAVATU0').Value;
              cdsTotalGeral.FieldByName('VALCTB0').Value := cdsSegregacao.FieldByName('VALCTB0').Value;
            end
            else
            begin
              cdsTotalGeral.Edit;
              cdsTotalGeral.FieldByName('CUSTOCORR0').Value := cdsTotalGeral.FieldByName('CUSTOCORR0').Value +
                                                             cdsSegregacao.FieldByName('CUSTOCORR0').Value;
              cdsTotalGeral.FieldByName('DEPBEMACUM0').Value := cdsTotalGeral.FieldByName('DEPBEMACUM0').Value +
                                                              cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
              cdsTotalGeral.FieldByName('DEPBEMATU0').Value := cdsTotalGeral.FieldByName('DEPBEMATU0').Value +
                                                             cdsSegregacao.FieldByName('DEPBEMATU0').Value;
              cdsTotalGeral.FieldByName('CUSTOREAV0').Value := cdsTotalGeral.FieldByName('CUSTOREAV0').Value  +
                                                             cdsSegregacao.FieldByName('CUSTOREAV0').Value;
              cdsTotalGeral.FieldByName('DEPREAVACUM0').Value := cdsTotalGeral.FieldByName('DEPREAVACUM0').Value +
                                                               cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
              cdsTotalGeral.FieldByName('DEPREAVATU0').Value := cdsTotalGeral.FieldByName('DEPREAVATU0').Value +
                                                              cdsSegregacao.FieldByName('DEPREAVATU0').Value;
              cdsTotalGeral.FieldByName('VALCTB0').Value := cdsTotalGeral.FieldByName('VALCTB0').Value +
                                                          cdsSegregacao.FieldByName('VALCTB0').Value;
            end;
            cdsTotalGeral.Post;
            cdsSegregacao.Next;
          end;

          i := 1;
          fValorLanc := 0;
          cdsTotalGeral.First;

          while not cdsTotalGeral.Eof do
          begin
            fValorLanc := fValorLanc + cdsTotalGeral.FieldByName('VALCTB0').AsFloat;
            cdsTotalGeral.Next;
          end;

          cdsTotalGeral.First;
          while not cdsTotalGeral.Eof do
          begin
            cdsTotalGeral.Edit;
            if i = cdsTotalGeral.RecordCount then
              cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent
            else
            begin
              if fValorLanc > 0 then
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := RoundCM((cdsTotalGeral.FieldByName('VALCTB0').asFloat * 100) /
                                                                             fValorLanc ,2)
              else
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 0;
              dPercent := dPercent + cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat;
            end;
            cdsTotalGeral.Post;
            cdsTotalGeral.Next;
          end;
          //Alteração termina aqui

          TotalizaGrupos;
        end;

        Screen.Cursor := crDefault;
        dtmRelBalCaf.bSeparador := chkLinhas.Checked;
        // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
        dtmRelBalCaf.bCorlinha  := chkCorLinha.Checked;
        dtmRelBalCaf.CorLinha   := cboCorLinha.SelectedColor;

     end;
     // Carrega o Logotipo
  finally
    FreeAndNil(_cdsTemp);
    FreeAndNil(_cdsTemp2);
    FreeAndNil(_cdsTemp3);
    FreeAndNil(_Ctrl);
  end;
end;

procedure TfrmParamSldCtbImoMestre.MontaRelatorioPorPercVlrTotal;
var iDia, iMes, iAno : Word;
begin
   inherited;

   //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
   if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
   begin
     MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
            'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
            'Informação', mtInformation, [mbOK], 0);
     ModalResult := mrNone;
     dbcboPatro.SetFocus;
     Exit;
   end;

   if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
   begin
     if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                     StrToInt(dbcboPlanoContabil.LookupValue)) then
     begin
       MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
       ModalResult := mrNone;
       dbcboPlanoContabil.SetFocus;
       Exit;
     end;
   end;
   //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   with dtmRelBalCaf do
   begin
     LimpaParametros(dtmRelBalCaf.qrySldCtbImoMestre2);
      qrySldCtbImoMestre2.Close;
      ppLabel6.Caption := eDataFim.Text;

      //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
      if dbcboPlanoContabil.LookupValue = '' then
        lblPlanoContabil.Caption := 'Plano: < Todos >'
      else
        lblPlanoContabil.Caption := 'Plano: < ' + dbcboPlanoContabil.Text +' >';


      if dbcboPatro.LookupValue = '' then
        lblPatro.Caption := 'Patrocinadora: < Todos >'
      else
        lblPatro.Caption := 'Patrocinadora: < ' + dbcboPatro.Text +' >';
      //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

      if DBcboTipoImovel.LookupValue = '' then
           ppLabel148.Caption := 'Segmento: < Todos >'
      else ppLabel148.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';


      DecodeDate(eDataFim.Date, iAno, iMes, iDia);

      // carrega parâmetros
      qrySldCtbImoMestre2.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      qrySldCtbImoMestre2.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qrySldCtbImoMestre2.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qrySldCtbImoMestre2.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
      qrySldCtbImoMestre2.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

      if DBcboTipoImovel.Text <> '' then
         qrySldCtbImoMestre2.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

      if chkValorZero.Checked then  // imóveis com saldo maior que zero
         qrySldCtbImoMestre2.ParamByName('PVLRZERO').AsInteger :=1
      else
         qrySldCtbImoMestre2.ParamByName('PVLRZERO').AsInteger := 0;

      qrySldCtbImoMestre2.Open;

      if qrySldCtbImoMestre2.IsEmpty then begin
        MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0);
      end else
      begin
        cdsGrpBem.Close;
        spGrpBem.Open;

        //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
        qrySegregacao.Close;
        qrySegregacao.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qrySegregacao.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
        qrySegregacao.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
        qrySegregacao.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
        qrySegregacao.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

        if DBcboTipoImovel.Text <> '' then
          qrySegregacao.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

        if chkValorZero.Checked then  // imóveis com saldo maior que zero
          qrySegregacao.ParamByName('PVLRZERO').AsInteger := 1
        else
          qrySegregacao.ParamByName('PVLRZERO').AsInteger := 0;
        qrySegregacao.Open;

        qryTotalGeral.Close;
        qryTotalGeral.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qryTotalGeral.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
        qryTotalGeral.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
        qryTotalGeral.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
        qryTotalGeral.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

        if DBcboTipoImovel.Text <> '' then
          qryTotalGeral.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

        if chkValorZero.Checked then  // imóveis com saldo maior que zero
          qryTotalGeral.ParamByName('PVLRZERO').AsInteger := 1
        else
          qryTotalGeral.ParamByName('PVLRZERO').AsInteger := 0;
        qryTotalGeral.Open;
        //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

        TotalizaGrupos;
      end;
   end;
end;

procedure TfrmParamSldCtbImoMestre.MontaRelatorioPorPlanoPrev;
var iDia, iMes, iAno : Word;
    sSQL : string;
    _cdsTemp, _cdsTemp2, _cdsTemp3 : TCMClientDataSet;
    _Ctrl : TCmControlObject;
    fCustoCorr0, fDepBemAcum0, fDepBemAtu0, fCustoReav0,
    fDepreAvAcum0, fDepreAvAtu0, fValCtb0, fValorLanc, dPercent : Double;
    i : integer;
    sCodTipImovel : String;
    sIdImovel, sPatro : string;
begin
  _cdsTemp  := TCMClientDataSet.Create(nil);
  _cdsTemp2 := TCMClientDataSet.Create(nil);
  _cdsTemp3 := TCMClientDataSet.Create(nil);
  _Ctrl     := TCMControlObject.Create;
  i := 1;
  fValorLanc := 0;
  dPercent := 0;
  try
    _Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);


    //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
    if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
    begin
      MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
             'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
             'Informação', mtInformation, [mbOK], 0);
      ModalResult := mrNone;
      dbcboPatro.SetFocus;
      Exit;
    end;

    if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
    begin
      if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                      StrToInt(dbcboPlanoContabil.LookupValue)) then
      begin
        MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
        ModalResult := mrNone;
        dbcboPlanoContabil.SetFocus;
        Exit;
      end;
    end;
    //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

    Screen.Cursor := crSQLWait;
    //-------------------------------------------------------------------------------------
    with dtmRelBalCaf do
    begin
      dsGrpSegregacao.DataSet := cdsSegregacao;
      dsTotalGeral.DataSet := cdsTotalGeral;
      
      LimpaParametros(dtmRelBalCaf.qrySldCtbImoMestre);
      qrySldCtbImoMestre.Close;
      ppLabel6.Caption := eDataFim.Text;

      //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
      if dbcboPlanoContabil.LookupValue = '' then
        lblPlanoContabil.Caption := 'Plano: < Todos >'
      else
        lblPlanoContabil.Caption := 'Plano: < ' + dbcboPlanoContabil.Text +' >';


      if dbcboPatro.LookupValue = '' then
        lblPatro.Caption := 'Patrocinadora: < Todos >'
      else
        lblPatro.Caption := 'Patrocinadora: < ' + dbcboPatro.Text +' >';
      //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

      if DBcboTipoImovel.LookupValue = '' then
        ppLabel148.Caption := 'Segmento: < Todos >'
      else ppLabel148.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';

      DecodeDate(eDataFim.Date, iAno, iMes, iDia);
      // carrega parâmetros
      qrySldCtbImoMestre.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      qrySldCtbImoMestre.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qrySldCtbImoMestre.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qrySldCtbImoMestre.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
      qrySldCtbImoMestre.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

      if DBcboTipoImovel.Text <> '' then
        qrySldCtbImoMestre.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

      if chkValorZero.Checked then  // imóveis com saldo maior que zero
        qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger :=1
      else
        qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger := 0;

      qrySldCtbImoMestre.SQL.Savetofile('c:\planus\temp\sintetico2.txt');     // SIG 126818 Ferrari
      qrySldCtbImoMestre.Open;

      if qrySldCtbImoMestre.IsEmpty then begin
        MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0);
      end
      else
      begin
        //Alteração começa daqui
        //Cássio - SOL Nº 135765 KINTANA Nº 808154
        if cdsSegregacao.Active then
          cdsSegregacao.EmptyDataSet;

        qrySldCtbImoMestre.First;
        sSQL := 'SELECT   ''                                                                    '' AS DESCGRUPO, ' +
                '        ''                                                                    '' AS PLANOPREV,' +
                '        ''                                                           '' AS PATRO, ' +
                '        0.00 AS PERCENTRATEIO, ' +
                '        0.00 AS CUSTOCORR0, ' +
                '        0.00 AS DEPBEMACUM0, ' +
                '        0.00 AS DEPBEMATU0, ' +
                '        0.00 AS CUSTOREAV0, ' +
                '        0.00 AS DEPREAVACUM0, ' +
                '        0.00 AS DEPREAVATU0, ' +
                '        0.00 AS VALCTB0 ' +
                '  FROM DUAL   ' +
                ' WHERE 1 = 2' ;
        cdsSegregacao.Data := _Ctrl.GetDataPacket(sSQL);

        while not qrySldCtbImoMestre.Eof do
        begin
          //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Início
          sIdImovel := '';
          //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim
          _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT DISTINCT I.IDIMOVEL ' +
                                                '  FROM IMOVEL I, ' +
                                                '       (SELECT IDIMOVEL FROM IMOVEL ' +
                                                '         WHERE IMONOME = ' + QuotedStr(qrySldCtbImoMestre.FieldByName('NOME').asString) + ' ) IM ' +
                                                ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL ' +
                                                '   AND I.CODTIPIMOVEL = '+ QuotedStr(qrySldCtbImoMestre.FieldByName('CODTIPIMOVEL').asString));
          while not _cdsTemp3.Eof do
          begin
            if sIdImovel = '' then
              sIdImovel := _cdsTemp3.FieldByName('IDIMOVEL').asString
            else
              sIdImovel := sIdImovel + ',' + _cdsTemp3.FieldByName('IDIMOVEL').asString;

            _cdsTemp3.Next;
          end;

          fCustoCorr0   := 0;
          fDepBemAcum0  := 0;
          fDepBemAtu0   := 0;
          fCustoReav0   := 0;
          fDepreAvAcum0 := 0;
          fDepreAvAtu0  := 0;
          fValCtb0      := 0;

          _cdsTemp.Data :=  _Ctrl.GetDataPacket ('SELECT PLN.NOME AS PLANOPREV,                                                  ' + #13 +
                           '       PPI.IDPLANOPREV,                                                        ' + #13 +
                           '       PES.NOME AS PATRO,                                                      ' + #13 +
                           '       PPI.IDPATRO,                                                            ' + #13 +
                           '       SUM(PPI.PERCENTRATEIO) / COUNT(DISTINCT PPI.IDIMOVEL) AS PERCENTRATEIO, ' + #13 +
                           '       0 AS CUSTOCORR0,                                                        ' + #13 +
                           '       0 AS DEPBEMACUM0,                                                       ' + #13 +
                           '       0 AS DEPBEMATU0,                                                        ' + #13 +
                           '       0 AS CUSTOREAV0,                                                        ' + #13 +
                           '       0 AS DEPREAVACUM0,                                                      ' + #13 +
                           '       0 AS DEPREAVATU0,                                                       ' + #13 +
                           '       0 AS VALCTB0                                                            ' + #13 +
                           '  FROM PLANOPATROXVIGENCIAIMOB PPI,                                            ' + #13 +
                           '       (SELECT IDIMOVEL, MAX(DATAVIGENCIA) AS DATAMAX                          ' + #13 +
                           '          FROM PLANOPATROXVIGENCIAIMOB                                         ' + #13 +
                           '         WHERE IDIMOVEL IN ( ' + sIdImovel + ')                                ' + #13 +
                           '           AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date))        + #13 +
                           '         GROUP BY IDIMOVEL) DT,                                                ' + #13 +
                           '       PESSOA PES,                                                             ' + #13 +
                           '       PLANPREVCONTABIL PLN                                                    ' + #13 +
                           ' WHERE PPI.IDIMOVEL = DT.IDIMOVEL                                              ' + #13 +
                           '   AND PPI.DATAVIGENCIA = DT.DATAMAX                                           ' + #13 +
                           '   AND PES.IDPESSOA = PPI.IDPATRO                                              ' + #13 +
                           '   AND PLN.IDPLANOPREV = PPI.IDPLANOPREV                                       ' + #13 +
                           ' GROUP BY PLN.NOME,                                                            ' + #13 +
                           '       PPI.IDPLANOPREV,                                                        ' + #13 +
                           '       PES.NOME,                                                               ' + #13 +
                           '       PPI.IDPATRO                                                             ' + #13 +
                           ' ORDER BY PPI.IDPATRO, PPI.IDPLANOPREV                                         ' );
          //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim

          while not _cdsTemp.Eof do
          begin
            if not cdsSegregacao.Locate('DESCGRUPO;PATRO;PLANOPREV', VarArrayOf([
                   qrySldCtbImoMestre.FieldByName('DESCGRUPO').Value,
                   _cdsTemp.FieldByName('PATRO').Value,
                   _cdsTemp.FieldByName('PLANOPREV').Value]), []) then
            begin
              cdsSegregacao.Append;
              cdsSegregacao.FieldByName('DESCGRUPO').Value := qrySldCtbImoMestre.FieldByName('DESCGRUPO').Value; //_cdsTemp.FieldByName('CODTIPIMOVEL').Value;
              cdsSegregacao.FieldByName('PLANOPREV').Value := _cdsTemp.FieldByName('PLANOPREV').Value;
              cdsSegregacao.FieldByName('PATRO').Value := _cdsTemp.FieldByName('PATRO').Value;
              cdsSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

              if _cdsTemp.RecNo = _cdsTemp.RecordCount then
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0;
                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0;
                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat :=  qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0;
                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat :=  qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat - fCustoReav0;
                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0;
                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0;
                cdsSegregacao.FieldByName('VALCTB0').asFloat := qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat - fValCtb0;
              end
              else
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat *
                                                                            _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fCustoCorr0 := fCustoCorr0 + cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;

                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat *
                                                                             _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fDepBemAcum0 := fDepBemAcum0 + cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;

                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat *
                                                                            _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fDepBemAtu0 := fDepBemAtu0 + cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;

                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat *
                                                                            _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fCustoReav0 := fCustoReav0 + cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;

                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat *
                                                                              _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fDepreAvAcum0 := fDepreAvAcum0 + cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;

                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat *
                                                                             _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fDepreAvAtu0 := fDepreAvAtu0 + cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;

                cdsSegregacao.FieldByName('VALCTB0').asFloat := RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat *
                                                                         _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                fValCtb0 := fValCtb0 + cdsSegregacao.FieldByName('VALCTB0').asFloat;
              end;
            end
            else
            begin
              cdsSegregacao.Edit;
              if _cdsTemp.RecNo = _cdsTemp.RecordCount then
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat + (qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0);
                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0);
                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0);
                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat  + (qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat - fCustoReav0);
                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0);
                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat + (qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0);
                cdsSegregacao.FieldByName('VALCTB0').asFloat :=  cdsSegregacao.FieldByName('VALCTB0').asFloat + (qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat - fValCtb0);
              end
              else
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat *
                                                                  _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                fCustoCorr0 := fCustoCorr0 +  RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat *
                                                                    _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                fDepBemAcum0 := fDepBemAcum0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := cdsSegregacao.FieldByName('DEPBEMATU0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat *
                                                                   _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2));
                fDepBemAtu0 := fDepBemAtu0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2);

                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := cdsSegregacao.FieldByName('CUSTOREAV0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat *
                                                                   _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                fCustoReav0 := fCustoReav0 + RoundCM((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat *
                                                                     _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                fDepreAvAcum0 := fDepreAvAcum0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat *
                                                                    _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                fDepreAvAtu0 := fDepreAvAtu0 + RoundCM((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                cdsSegregacao.FieldByName('VALCTB0').asFloat := cdsSegregacao.FieldByName('VALCTB0').asFloat + (RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat *
                                                                _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                fValCtb0 := fValCtb0 + RoundCM((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
              end;
            end;
            cdsSegregacao.Post;
            _cdsTemp.Next;
          end;
          qrySldCtbImoMestre.Next;
        end;

        //Cássio - SOl Nº 145744 KINTANA Nº 981496 - Início
        cdsSegregacao.IndexFieldNames := 'DESCGRUPO';
        //Cássio - SOl Nº 145744 KINTANA Nº 981496 - Fim

        _cdsTemp2.Data := _Ctrl.GetDataPacket('SELECT ''                                                                    '' AS DESCGRUPO, ' +
                                              '        ''                                                                    '' AS PLANOPREV,' +
                                              '        ''                                                           '' AS PATRO, ' +
                                              '        0.00 AS PERCENTRATEIO, ' +
                                              '        0.00 AS CUSTOCORR0, ' +
                                              '        0.00 AS DEPBEMACUM0, ' +
                                              '        0.00 AS DEPBEMATU0, ' +
                                              '        0.00 AS CUSTOREAV0, ' +
                                              '        0.00 AS DEPREAVACUM0, ' +
                                              '        0.00 AS DEPREAVATU0, ' +
                                              '        0.00 AS VALCTB0 ' +
                                              '  FROM DUAL   ' +
                                              ' WHERE 1 = 2');

        cdsSegregacao.First;
        while not cdsSegregacao.Eof do
        begin
          _cdsTemp2.Append;
          _cdsTemp2.FieldByName('DESCGRUPO').asString    := cdsSegregacao.FieldByName('DESCGRUPO').asString;
          _cdsTemp2.FieldByName('PLANOPREV').asString    := cdsSegregacao.FieldByName('PLANOPREV').asString;
          _cdsTemp2.FieldByName('PATRO').asString        :=  cdsSegregacao.FieldByName('PATRO').asString;
          _cdsTemp2.FieldByName('PERCENTRATEIO').asFloat :=  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat;
          _cdsTemp2.FieldByName('CUSTOCORR0').asFloat    := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;
          _cdsTemp2.FieldByName('DEPBEMACUM0').asFloat   := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;
          _cdsTemp2.FieldByName('DEPBEMATU0').asFloat    :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;
          _cdsTemp2.FieldByName('CUSTOREAV0').asFloat    :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;
          _cdsTemp2.FieldByName('DEPREAVACUM0').asFloat  := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;
          _cdsTemp2.FieldByName('DEPREAVATU0').asFloat   := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;
          _cdsTemp2.FieldByName('VALCTB0').asFloat       :=  cdsSegregacao.FieldByName('VALCTB0').asFloat;
          _cdsTemp2.Post;
          cdsSegregacao.Next;
        end;

        cdsSegregacao.First;
        _cdsTemp2.First;

        while not cdsSegregacao.Eof do
        begin
          sCodTipImovel := _cdsTemp2.FieldByName('DESCGRUPO').asString;
          while (sCodTipImovel = _cdsTemp2.FieldByName('DESCGRUPO').asString) and (not _cdsTemp2.Eof) do
          begin
            fValorLanc := fValorLanc + _cdsTemp2.FieldByName('VALCTB0').asFloat;
            _cdsTemp2.Next;
          end;

          while (sCodTipImovel = cdsSegregacao.FieldByName('DESCGRUPO').asString) and (not cdsSegregacao.Eof) do
          begin
            cdsSegregacao.Edit;
            //Cássio SOL Nº 142231 KINTANA Nº 905545 - Início
            if fValorLanc > 0 then
              cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := RoundCM((cdsSegregacao.FieldByName('VALCTB0').asFloat * 100) /
                                                                            fValorLanc,2)
            //Cássio SOL Nº 142231 KINTANA Nº 905545 - Fim
            else
              cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := 0;

            cdsSegregacao.Post;
            cdsSegregacao.Next;
          end;
            fValorLanc := 0;
        end;
        //Cássio - SOL Nº 135765 KINTANA Nº 808154
        if cdsTotalGeral.Active then
          cdsTotalGeral.EmptyDataSet;

        sSQL := 'SELECT  ''                                                                    '' AS PLANOPREV,' +
                '        ''                                                           '' AS PATRO, ' +
                '        0.00 AS PERCENTRATEIO, ' +
                '        0.00 AS CUSTOCORR0, ' +
                '        0.00 AS DEPBEMACUM0, ' +
                '        0.00 AS DEPBEMATU0, ' +
                '        0.00 AS CUSTOREAV0, ' +
                '        0.00 AS DEPREAVACUM0, ' +
                '        0.00 AS DEPREAVATU0, ' +
                '        0.00 AS VALCTB0 ' +
                '  FROM DUAL   ' +
                ' WHERE 1 = 2' ;
        cdsTotalGeral.Data := _Ctrl.GetDataPacket(sSQL);

        cdsSegregacao.First;
        while not cdsSegregacao.Eof do
        begin
          if not cdsTotalGeral.Locate('PATRO;PLANOPREV', VarArrayOf([
                                      cdsSegregacao.FieldByName('PATRO').Value,
                                      cdsSegregacao.FieldByName('PLANOPREV').Value]), []) then
          begin
            cdsTotalGeral.Append;
            cdsTotalGeral.FieldByName('PLANOPREV').Value     := cdsSegregacao.FieldByName('PLANOPREV').Value;
            cdsTotalGeral.FieldByName('PATRO').Value         := cdsSegregacao.FieldByName('PATRO').Value;
            cdsTotalGeral.FieldByName('PERCENTRATEIO').Value := 0;
            cdsTotalGeral.FieldByName('CUSTOCORR0').Value    := cdsSegregacao.FieldByName('CUSTOCORR0').Value;
            cdsTotalGeral.FieldByName('DEPBEMACUM0').Value   := cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
            cdsTotalGeral.FieldByName('DEPBEMATU0').Value    := cdsSegregacao.FieldByName('DEPBEMATU0').Value;
            cdsTotalGeral.FieldByName('CUSTOREAV0').Value    := cdsSegregacao.FieldByName('CUSTOREAV0').Value;
            cdsTotalGeral.FieldByName('DEPREAVACUM0').Value  := cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
            cdsTotalGeral.FieldByName('DEPREAVATU0').Value   := cdsSegregacao.FieldByName('DEPREAVATU0').Value;
            cdsTotalGeral.FieldByName('VALCTB0').Value       := cdsSegregacao.FieldByName('VALCTB0').Value;
          end
          else
          begin
            cdsTotalGeral.Edit;
            cdsTotalGeral.FieldByName('CUSTOCORR0').Value   := cdsTotalGeral.FieldByName('CUSTOCORR0').Value +
                                                               cdsSegregacao.FieldByName('CUSTOCORR0').Value;
            cdsTotalGeral.FieldByName('DEPBEMACUM0').Value  := cdsTotalGeral.FieldByName('DEPBEMACUM0').Value +
                                                               cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
            cdsTotalGeral.FieldByName('DEPBEMATU0').Value   := cdsTotalGeral.FieldByName('DEPBEMATU0').Value +
                                                               cdsSegregacao.FieldByName('DEPBEMATU0').Value;
            cdsTotalGeral.FieldByName('CUSTOREAV0').Value   := cdsTotalGeral.FieldByName('CUSTOREAV0').Value  +
                                                               cdsSegregacao.FieldByName('CUSTOREAV0').Value;
            cdsTotalGeral.FieldByName('DEPREAVACUM0').Value := cdsTotalGeral.FieldByName('DEPREAVACUM0').Value +
                                                               cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
            cdsTotalGeral.FieldByName('DEPREAVATU0').Value  := cdsTotalGeral.FieldByName('DEPREAVATU0').Value +
                                                               cdsSegregacao.FieldByName('DEPREAVATU0').Value;
            cdsTotalGeral.FieldByName('VALCTB0').Value      := cdsTotalGeral.FieldByName('VALCTB0').Value +
                                                               cdsSegregacao.FieldByName('VALCTB0').Value;
          end;
          cdsTotalGeral.Post;
          cdsSegregacao.Next;
        end;

        i := 1;
        fValorLanc := 0;
        cdsTotalGeral.First;

        //Cássio SOL Nº 142231 KINTANA Nº 905545 - Início
        _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT ''                                                           '' AS PATRO FROM DUAL WHERE 1=2');

        while not cdsTotalGeral.Eof do
        begin
          if not _cdsTemp3.Locate('PATRO', VarArrayOf([cdsTotalGeralPATRO.Value]), []) then
          begin
            _cdsTemp3.Append;
            _cdsTemp3.FieldByName('PATRO').Value := cdsTotalGeralPATRO.Value;
            _cdsTemp3.Post;
          end;
          cdsTotalGeral.Next;
        end;

        _cdsTemp3.First;
        while not _cdsTemp3.Eof do
        begin
          dPercent := 0;
          fValorLanc:= 0;
          cdsTotalGeral.First;
          cdsTotalGeral.Filter := 'PATRO = ' +QuotedStr(_cdsTemp3.FieldByName('PATRO').asString);
          cdsTotalGeral.Filtered := True;

          while not cdsTotalGeral.Eof do
          begin
            fValorLanc := fValorLanc + cdsTotalGeral.FieldByName('VALCTB0').AsFloat;
            cdsTotalGeral.Next;
          end;
          cdsTotalGeral.First;

          while not cdsTotalGeral.Eof do
          begin
            cdsTotalGeral.Edit;
            if cdsTotalGeral.RecNo = cdsTotalGeral.RecordCount then
              cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent
            else
              if fValorLanc > 0 then
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := RoundCM((cdsTotalGeral.FieldByName('VALCTB0').asFloat * 100) /
                                                                              fValorLanc ,2)
              else
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 0;

            dPercent := dPercent + cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat;
            cdsTotalGeral.Post;
            cdsTotalGeral.Next;
          end;
          _cdsTemp3.Next;
        end;
        //Alteração termina aqui
        cdsTotalGeral.Filtered := False;
        //Cássio SOL Nº 142231 KINTANA Nº 905545 - Fim
        TotalizaGrupos;
      end;
    end;
  finally
    FreeAndNil(_cdsTemp);
    FreeAndNil(_cdsTemp2);
    FreeAndNil(_cdsTemp3);
    FreeAndNil(_Ctrl);
  end;
end;


procedure TfrmParamSldCtbImoMestre.MontaRelatorioPorPlanoPrevSegregado;
var iDia, iMes, iAno : Word;
    sSQL : string;
    _cdsTemp, _cdsTemp2, _cdsTemp3 : TCMClientDataSet;
    _Ctrl : TCmControlObject;
    fCustoCorr0, fDepBemAcum0, fDepBemAtu0, fCustoReav0,
    fDepreAvAcum0, fDepreAvAtu0, fValCtb0, fValorLanc, dPercent : Double;
    i, indParametros : integer;
    sCodTipImovel : String;
    sIdImovel, sPatro : string;
    arquivosql : TStringList;

    function verificarDadosSegregados:boolean;
    var indP:integer;
    begin
      try
        dtmRelBalCaf.qrySldCtbImoMestreSegregado.close;
        for indP := 0 to dtmRelBalCaf.qrySldCtbImoMestre.paramcount -1 do
          dtmRelBalCaf.qrySldCtbImoMestreSegregado.ParamByName(dtmRelBalCaf.qrySldCtbImoMestre.params[indP].name).value := dtmRelBalCaf.qrySldCtbImoMestre.Params[indP].value;
        dtmRelBalCaf.qrySldCtbImoMestreSegregado.Open;
        result := not dtmRelBalCaf.qrySldCtbImoMestreSegregado.IsEmpty;
        dtmRelBalCaf.qrySldCtbImoMestreSegregado.close;
      except
        result := false;
      end;
    end;
begin
  _cdsTemp  := TCMClientDataSet.Create(nil);
  _cdsTemp2 := TCMClientDataSet.Create(nil);
  _cdsTemp3 := TCMClientDataSet.Create(nil);
  _Ctrl     := TCMControlObject.Create;
  i := 1;
  fValorLanc := 0;
  dPercent := 0;
  try
    _Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);


    //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
    if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
    begin
      MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
             'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
             'Informação', mtInformation, [mbOK], 0);
      ModalResult := mrNone;
      dbcboPatro.SetFocus;
      Exit;
    end;

    if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
    begin
      if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                      StrToInt(dbcboPlanoContabil.LookupValue)) then
      begin
        MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
        ModalResult := mrNone;
        dbcboPlanoContabil.SetFocus;
        Exit;
      end;
    end;
    //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

    Screen.Cursor := crSQLWait;
    //-------------------------------------------------------------------------------------
    with dtmRelBalCaf do
    begin
      dsGrpSegregacao.DataSet := cdsSegregacao;
      dsTotalGeral.DataSet := cdsTotalGeral;

      LimpaParametros(dtmRelBalCaf.qrySldCtbImoMestre);
      qrySldCtbImoMestre.Close;
      ppLabel6.Caption := eDataFim.Text;

      //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
      if dbcboPlanoContabil.LookupValue = '' then
        lblPlanoContabil.Caption := 'Plano: < Todos >'
      else
        lblPlanoContabil.Caption := 'Plano: < ' + dbcboPlanoContabil.Text +' >';


      if dbcboPatro.LookupValue = '' then
        lblPatro.Caption := 'Patrocinadora: < Todos >'
      else
        lblPatro.Caption := 'Patrocinadora: < ' + dbcboPatro.Text +' >';
      //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

      if DBcboTipoImovel.LookupValue = '' then
        ppLabel148.Caption := 'Segmento: < Todos >'
      else ppLabel148.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';

      DecodeDate(eDataFim.Date, iAno, iMes, iDia);
      // carrega parâmetros
      qrySldCtbImoMestre.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      qrySldCtbImoMestre.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qrySldCtbImoMestre.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qrySldCtbImoMestre.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
      qrySldCtbImoMestre.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);

      if DBcboTipoImovel.Text <> '' then
        qrySldCtbImoMestre.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

      if chkValorZero.Checked then  // imóveis com saldo maior que zero
        qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger :=1
      else
        qrySldCtbImoMestre.ParamByName('PVLRZERO').AsInteger := 0;

      verificarDadosSegregados;

      qrySldCtbImoMestre.SQL.Savetofile('c:\planus\temp\sintetico3.txt');     // SIG 126818 Ferrari
      qrySldCtbImoMestre.Open;

      if qrySldCtbImoMestre.IsEmpty then begin
        MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0);
      end
      else
      begin
        //Alteração começa daqui
        //Cássio - SOL Nº 135765 KINTANA Nº 808154
        if cdsSegregacao.Active then
          cdsSegregacao.EmptyDataSet;

        qrySldCtbImoMestre.First;
        sSQL := 'SELECT   ''                                                                    '' AS DESCGRUPO, ' +
                '        ''                                                                    '' AS PLANOPREV,' +
                '        ''                                                           '' AS PATRO, ' +
                '        0.00 AS PERCENTRATEIO, ' +
                '        0.00 AS CUSTOCORR0, ' +
                '        0.00 AS DEPBEMACUM0, ' +
                '        0.00 AS DEPBEMATU0, ' +
                '        0.00 AS CUSTOREAV0, ' +
                '        0.00 AS DEPREAVACUM0, ' +
                '        0.00 AS DEPREAVATU0, ' +
                '        0.00 AS VALCTB0 ' +
                '  FROM DUAL   ' +
                ' WHERE 1 = 2' ;
        cdsSegregacao.Data := _Ctrl.GetDataPacket(sSQL);

//        while not qrySldCtbImoMestre.Eof do              // sig 126818
        begin
          //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Início
          sIdImovel := '';
          //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim
          _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT DISTINCT I.IDIMOVELMESTRE ' +      // SIG 126818
                                                '  FROM IMOVEL I, ' +
                                                '       (SELECT IDIMOVEL FROM IMOVEL ' +
                                                '         WHERE IMONOME = ' + QuotedStr(qrySldCtbImoMestre.FieldByName('NOME').asString) + ' ) IM ' +
                                                ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL ' +
                                                '   AND I.CODTIPIMOVEL = '+ QuotedStr(qrySldCtbImoMestre.FieldByName('CODTIPIMOVEL').asString));
          while not _cdsTemp3.Eof do
          begin
            if sIdImovel = '' then
              sIdImovel := _cdsTemp3.FieldByName('IDIMOVELMESTRE').asString ;
//            else
//              sIdImovel := sIdImovel + ',' + _cdsTemp3.FieldByName('IDIMOVELMESTRE').asString;

            _cdsTemp3.Next;
          end;

          fCustoCorr0   := 0;
          fDepBemAcum0  := 0;
          fDepBemAtu0   := 0;
          fCustoReav0   := 0;
          fDepreAvAcum0 := 0;
          fDepreAvAtu0  := 0;
          fValCtb0      := 0;
// sig 126818 Inicio
{
          _cdsTemp.Data :=  _Ctrl.GetDataPacket ('SELECT PLN.NOME AS PLANOPREV,                                                  ' + #13 +
                           '       PPI.IDPLANOPREV,                                                        ' + #13 +
                           '       PES.NOME AS PATRO,                                                      ' + #13 +
                           '       PPI.IDPATRO,                                                            ' + #13 +
                           '       SUM(PPI.PERCENTRATEIO) / COUNT(DISTINCT PPI.IDIMOVEL) AS PERCENTRATEIO, ' + #13 +
                           '       0 AS CUSTOCORR0,                                                        ' + #13 +
                           '       0 AS DEPBEMACUM0,                                                       ' + #13 +
                           '       0 AS DEPBEMATU0,                                                        ' + #13 +
                           '       0 AS CUSTOREAV0,                                                        ' + #13 +
                           '       0 AS DEPREAVACUM0,                                                      ' + #13 +
                           '       0 AS DEPREAVATU0,                                                       ' + #13 +
                           '       0 AS VALCTB0                                                            ' + #13 +
                           '  FROM PLANOPATROXVIGENCIAIMOB PPI,                                            ' + #13 +
                           '       (SELECT IDIMOVEL, MAX(DATAVIGENCIA) AS DATAMAX                          ' + #13 +
                           '          FROM PLANOPATROXVIGENCIAIMOB                                         ' + #13 +
                           '         WHERE IDIMOVEL IN ( ' + sIdImovel + ')                                ' + #13 +
                           '           AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date))        + #13 +
                           '         GROUP BY IDIMOVEL) DT,                                                ' + #13 +
                           '       PESSOA PES,                                                             ' + #13 +
                           '       PLANPREVCONTABIL PLN                                                    ' + #13 +
                           ' WHERE PPI.IDIMOVEL = DT.IDIMOVEL                                              ' + #13 +
                           '   AND PPI.DATAVIGENCIA = DT.DATAMAX                                           ' + #13 +
                           '   AND PES.IDPESSOA = PPI.IDPATRO                                              ' + #13 +
                           '   AND PLN.IDPLANOPREV = PPI.IDPLANOPREV                                       ' + #13 +
                           ' GROUP BY PLN.NOME,                                                            ' + #13 +
                           '       PPI.IDPLANOPREV,                                                        ' + #13 +
                           '       PES.NOME,                                                               ' + #13 +
                           '       PPI.IDPATRO                                                             ' + #13 +
                           ' ORDER BY PPI.IDPATRO, PPI.IDPLANOPREV                                         ' );
          //Cássio - SOL Nº 139712 KINTANA Nº 864895 - Fim
}

          sSQL := qryPatrimonioSegSintetico.sql.text;      //sig 126818

          sSql := StringReplace(sSQL, '&DATASLD', Quotedstr(DateToStr(eDataFim.Date)), [rfReplaceAll]);
          sSql := StringReplace(sSQL, '&MOECODIGO', IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF), [rfReplaceAll]);
          sSql := StringReplace(sSQL, '&IDPESSOA', IntToStr(Sistema.IdEmpresa), [rfReplaceAll]);
          //edilaine SIG122680 : inicio
//          if molImovel1.iImovel > 0 then
//             sSql := StringReplace(sSQL, '&PIDIMOVEL', qrySldCtbImoveis.FieldByName('IDIMOVEL').asString, [rfReplaceAll])
//          else
             sSql := StringReplace(sSQL, '&PIDIMOVEL', 'null', [rfReplaceAll]);
          //edilaine SIG122680 :  fim
          sSql := StringReplace(sSQL, '&DATAINI', Quotedstr(DateToStr(EncodeDate(iAno, iMes, 1))), [rfReplaceAll]);
          sSql := StringReplace(sSQL, '&IDTAXADEP', IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF), [rfReplaceAll]);
          sSql := StringReplace(sSQL, '&IDIMOVELMESTRE', 'null', [rfReplaceAll]);
          sSql := StringReplace(sSQL, '&CODTIPIMOVEL', QuotedStr(qrySldCtbImoMestre.FieldByName('CODTIPIMOVEL').asString), [rfReplaceAll]);
          if chkValorZero.Checked then  // imóveis com saldo maior que zero
             sSql := StringReplace(sSQL, '&PVLRZERO', '1', [rfReplaceAll])
          else
             sSql := StringReplace(sSQL, '&PVLRZERO', '0', [rfReplaceAll]);

          arquivosql := TStringList.Create;
          arquivosql.Add(sSQL);
          arquivosql.Savetofile('c:\planus\temp\sinteticogeral.txt');


          _cdsTemp.Data :=  _Ctrl.GetDataPacket (sSql);

 // fim 126818
          while not _cdsTemp.Eof do
          begin

            if not cdsSegregacao.Locate('DESCGRUPO;PATRO;PLANOPREV', VarArrayOf([
                   _cdsTemp.FieldByName('DESCGRUPO').Value,
                   _cdsTemp.FieldByName('PATRO').Value,
                   _cdsTemp.FieldByName('PLANOPREV').Value]), []) then
            begin
              cdsSegregacao.Append;
              dtmRelBalCaf.cdsSegregacao.FieldByName('DESCGRUPO').Value := _cdsTemp.FieldByName('DESCGRUPO').Value; //_cdsTemp.FieldByName('CODTIPIMOVEL').Value;
              dtmRelBalCaf.cdsSegregacao.FieldByName('PLANOPREV').Value := _cdsTemp.FieldByName('PLANOPREV').Value;
              dtmRelBalCaf.cdsSegregacao.FieldByName('PATRO').Value := _cdsTemp.FieldByName('PATRO').Value;
              dtmRelBalCaf.cdsSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

//              if _cdsTemp.RecNo = _cdsTemp.RecordCount then
//              begin
                dtmRelBalCaf.cdsSegregacao.FieldByName('CUSTOCORR0').asFloat     := ConvNum(_cdsTemp.FieldByName('CUSTOCORR0').asFloat, true) -  fCustoCorr0;
                dtmRelBalCaf.cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat    := ConvNum(_cdsTemp.FieldByName('DEPBEMACUM0').asFloat, true) -  fDepBemAcum0;
                dtmRelBalCaf.cdsSegregacao.FieldByName('DEPBEMATU0').asFloat     := ConvNum(_cdsTemp.FieldByName('DEPBEMATU0').asFloat, true) - fDepBemAtu0;
                dtmRelBalCaf.cdsSegregacao.FieldByName('CUSTOREAV0').asFloat     := ConvNum(_cdsTemp.FieldByName('CUSTOREAV0').asFloat, true) - fCustoReav0;
                dtmRelBalCaf.cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat   := ConvNum(_cdsTemp.FieldByName('DEPREAVACUM0').asFloat, true) - fDepreAvAcum0;
                dtmRelBalCaf.cdsSegregacao.FieldByName('DEPREAVATU0').asFloat    := ConvNum(_cdsTemp.FieldByName('DEPREAVATU0').asFloat, true) - fDepreAvAtu0;
                dtmRelBalCaf.cdsSegregacao.FieldByName('VALCTB0').asFloat        := ConvNum(_cdsTemp.FieldByName('VALCTB0').asFloat, true) - fValCtb0;
  //            end;
              cdsSegregacao.Post;
// sig 126818 Inicio
{
              else
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat :=   ConvNum( ( qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat ) / 100, true);
                fCustoCorr0 := fCustoCorr0 + ConvNum( cdsSegregacao.FieldByName('CUSTOCORR0').asFloat, true);

                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := ConvNum((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
                fDepBemAcum0 := fDepBemAcum0 + ConvNum( cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat, true);

                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := ConvNum((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
                fDepBemAtu0 := fDepBemAtu0 + ConvNum( cdsSegregacao.FieldByName('DEPBEMATU0').asFloat, true);

                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := ConvNum((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
                fCustoReav0 := fCustoReav0 + ConvNum( cdsSegregacao.FieldByName('CUSTOREAV0').asFloat, true);

                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := ConvNum((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
                fDepreAvAcum0 := fDepreAvAcum0 + ConvNum( cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat, true);

                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := ConvNum((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
                fDepreAvAtu0 := fDepreAvAtu0 + ConvNum( cdsSegregacao.FieldByName('DEPREAVATU0').asFloat, true);

                cdsSegregacao.FieldByName('VALCTB0').asFloat := ConvNum((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
                fValCtb0 := fValCtb0 + ConvNum( cdsSegregacao.FieldByName('VALCTB0').asFloat, true);
              end;
            end
            else
            begin
              cdsSegregacao.Edit;
              if _cdsTemp.RecNo = _cdsTemp.RecordCount then
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat   := ConvNum(cdsSegregacao.FieldByName('CUSTOCORR0').asFloat, true)   + ( ConvNum(qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat, true)   - fCustoCorr0);
                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat  := ConvNum(cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat, true)  + ( ConvNum(qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat, true)  - fDepBemAcum0);
                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat   := ConvNum(cdsSegregacao.FieldByName('DEPBEMATU0').asFloat, true)   + ( ConvNum(qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat, true)   - fDepBemAtu0);
                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat   := ConvNum(cdsSegregacao.FieldByName('CUSTOREAV0').asFloat, true)   + ( ConvNum(qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat, true)   - fCustoReav0);
                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := ConvNum(cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat, true) + ( ConvNum(qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat, true) - fDepreAvAcum0);
                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat  := ConvNum(cdsSegregacao.FieldByName('DEPREAVATU0').asFloat, true)  + ( ConvNum(qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat, true)  - fDepreAvAtu0);
                cdsSegregacao.FieldByName('VALCTB0').asFloat      := ConvNum(cdsSegregacao.FieldByName('VALCTB0').asFloat, true)      + ( ConvNum(qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat, true)      - fValCtb0);
              end
              else
              begin
                cdsSegregacao.FieldByName('CUSTOCORR0').asFloat := ConvNum(cdsSegregacao.FieldByName('CUSTOCORR0').asFloat, true) + (ConvNum((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
                fCustoCorr0 := fCustoCorr0 +  ConvNum((qrySldCtbImoMestre.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

                cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat := ConvNum(cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat,true) + (ConvNum((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
                fDepBemAcum0 := fDepBemAcum0 + ConvNum((qrySldCtbImoMestre.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

                cdsSegregacao.FieldByName('DEPBEMATU0').asFloat := ConvNum(cdsSegregacao.FieldByName('DEPBEMATU0').asFloat,true) + (ConvNum((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, true));
                fDepBemAtu0 := fDepBemAtu0 + ConvNum((qrySldCtbImoMestre.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, true);

                cdsSegregacao.FieldByName('CUSTOREAV0').asFloat := ConvNum(cdsSegregacao.FieldByName('CUSTOREAV0').asFloat,true) + (ConvNum((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
                fCustoReav0 := fCustoReav0 + ConvNum((qrySldCtbImoMestre.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

                cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat := ConvNum(cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat,true) + (ConvNum((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
                fDepreAvAcum0 := fDepreAvAcum0 + ConvNum((qrySldCtbImoMestre.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

                cdsSegregacao.FieldByName('DEPREAVATU0').asFloat := ConvNum(cdsSegregacao.FieldByName('DEPREAVATU0').asFloat,true) + (ConvNum((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
                fDepreAvAtu0 := fDepreAvAtu0 + ConvNum((qrySldCtbImoMestre.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

                cdsSegregacao.FieldByName('VALCTB0').asFloat := ConvNum(cdsSegregacao.FieldByName('VALCTB0').asFloat,true) + (ConvNum((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
                fValCtb0 := fValCtb0 + ConvNum((qrySldCtbImoMestre.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
              end;
            end;
}
            end;
            _cdsTemp.Next;
          end;
//          qrySldCtbImoMestre.Next;       // sig 126818
        end;

        //Cássio - SOl Nº 145744 KINTANA Nº 981496 - Início
        cdsSegregacao.IndexFieldNames := 'DESCGRUPO';
        //Cássio - SOl Nº 145744 KINTANA Nº 981496 - Fim

        _cdsTemp2.Data := _Ctrl.GetDataPacket('SELECT ''                                                                    '' AS DESCGRUPO, ' +
                                              '        ''                                                                    '' AS PLANOPREV,' +
                                              '        ''                                                           '' AS PATRO, ' +
                                              '        0.00 AS PERCENTRATEIO, ' +
                                              '        0.00 AS CUSTOCORR0, ' +
                                              '        0.00 AS DEPBEMACUM0, ' +
                                              '        0.00 AS DEPBEMATU0, ' +
                                              '        0.00 AS CUSTOREAV0, ' +
                                              '        0.00 AS DEPREAVACUM0, ' +
                                              '        0.00 AS DEPREAVATU0, ' +
                                              '        0.00 AS VALCTB0 ' +
                                              '  FROM DUAL   ' +
                                              ' WHERE 1 = 2');

        cdsSegregacao.First;
        while not cdsSegregacao.Eof do
        begin
          _cdsTemp2.Append;
          _cdsTemp2.FieldByName('DESCGRUPO').asString    := cdsSegregacao.FieldByName('DESCGRUPO').asString;
          _cdsTemp2.FieldByName('PLANOPREV').asString    := cdsSegregacao.FieldByName('PLANOPREV').asString;
          _cdsTemp2.FieldByName('PATRO').asString        :=  cdsSegregacao.FieldByName('PATRO').asString;
          _cdsTemp2.FieldByName('PERCENTRATEIO').asFloat :=  cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat;
          _cdsTemp2.FieldByName('CUSTOCORR0').asFloat    := cdsSegregacao.FieldByName('CUSTOCORR0').asFloat;
          _cdsTemp2.FieldByName('DEPBEMACUM0').asFloat   := cdsSegregacao.FieldByName('DEPBEMACUM0').asFloat;
          _cdsTemp2.FieldByName('DEPBEMATU0').asFloat    :=  cdsSegregacao.FieldByName('DEPBEMATU0').asFloat;
          _cdsTemp2.FieldByName('CUSTOREAV0').asFloat    :=  cdsSegregacao.FieldByName('CUSTOREAV0').asFloat;
          _cdsTemp2.FieldByName('DEPREAVACUM0').asFloat  := cdsSegregacao.FieldByName('DEPREAVACUM0').asFloat;
          _cdsTemp2.FieldByName('DEPREAVATU0').asFloat   := cdsSegregacao.FieldByName('DEPREAVATU0').asFloat;
          _cdsTemp2.FieldByName('VALCTB0').asFloat       :=  cdsSegregacao.FieldByName('VALCTB0').asFloat;
          _cdsTemp2.Post;
          cdsSegregacao.Next;
        end;

        cdsSegregacao.First;
        _cdsTemp2.First;

        while not cdsSegregacao.Eof do
        begin
          sCodTipImovel := _cdsTemp2.FieldByName('DESCGRUPO').asString;
          while (sCodTipImovel = _cdsTemp2.FieldByName('DESCGRUPO').asString) and (not _cdsTemp2.Eof) do
          begin
            fValorLanc := fValorLanc + _cdsTemp2.FieldByName('VALCTB0').asFloat;
            _cdsTemp2.Next;
          end;

          while (sCodTipImovel = cdsSegregacao.FieldByName('DESCGRUPO').asString) and (not cdsSegregacao.Eof) do
          begin
            cdsSegregacao.Edit;
            //Cássio SOL Nº 142231 KINTANA Nº 905545 - Início
            if fValorLanc > 0 then
              cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := RoundCM((cdsSegregacao.FieldByName('VALCTB0').asFloat * 100) /
                                                                            fValorLanc,2)
            //Cássio SOL Nº 142231 KINTANA Nº 905545 - Fim
            else
              cdsSegregacao.FieldByName('PERCENTRATEIO').asFloat := 0;

            cdsSegregacao.Post;
            cdsSegregacao.Next;
          end;
            fValorLanc := 0;
        end;
        //Cássio - SOL Nº 135765 KINTANA Nº 808154
        if cdsTotalGeral.Active then
          cdsTotalGeral.EmptyDataSet;

        sSQL := 'SELECT  ''                                                                    '' AS PLANOPREV,' +
                '        ''                                                           '' AS PATRO, ' +
                '        0.00 AS PERCENTRATEIO, ' +
                '        0.00 AS CUSTOCORR0, ' +
                '        0.00 AS DEPBEMACUM0, ' +
                '        0.00 AS DEPBEMATU0, ' +
                '        0.00 AS CUSTOREAV0, ' +
                '        0.00 AS DEPREAVACUM0, ' +
                '        0.00 AS DEPREAVATU0, ' +
                '        0.00 AS VALCTB0 ' +
                '  FROM DUAL   ' +
                ' WHERE 1 = 2' ;
        cdsTotalGeral.Data := _Ctrl.GetDataPacket(sSQL);

        cdsSegregacao.First;
        while not cdsSegregacao.Eof do
        begin
          if not cdsTotalGeral.Locate('PATRO;PLANOPREV', VarArrayOf([
                                      cdsSegregacao.FieldByName('PATRO').Value,
                                      cdsSegregacao.FieldByName('PLANOPREV').Value]), []) then
          begin
            cdsTotalGeral.Append;
            cdsTotalGeral.FieldByName('PLANOPREV').Value     := cdsSegregacao.FieldByName('PLANOPREV').Value;
            cdsTotalGeral.FieldByName('PATRO').Value         := cdsSegregacao.FieldByName('PATRO').Value;
            cdsTotalGeral.FieldByName('PERCENTRATEIO').Value := 0;
            cdsTotalGeral.FieldByName('CUSTOCORR0').Value    := cdsSegregacao.FieldByName('CUSTOCORR0').Value;
            cdsTotalGeral.FieldByName('DEPBEMACUM0').Value   := cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
            cdsTotalGeral.FieldByName('DEPBEMATU0').Value    := cdsSegregacao.FieldByName('DEPBEMATU0').Value;
            cdsTotalGeral.FieldByName('CUSTOREAV0').Value    := cdsSegregacao.FieldByName('CUSTOREAV0').Value;
            cdsTotalGeral.FieldByName('DEPREAVACUM0').Value  := cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
            cdsTotalGeral.FieldByName('DEPREAVATU0').Value   := cdsSegregacao.FieldByName('DEPREAVATU0').Value;
            cdsTotalGeral.FieldByName('VALCTB0').Value       := cdsSegregacao.FieldByName('VALCTB0').Value;
          end
          else
          begin
            cdsTotalGeral.Edit;
            cdsTotalGeral.FieldByName('CUSTOCORR0').Value   := cdsTotalGeral.FieldByName('CUSTOCORR0').Value +
                                                               cdsSegregacao.FieldByName('CUSTOCORR0').Value;
            cdsTotalGeral.FieldByName('DEPBEMACUM0').Value  := cdsTotalGeral.FieldByName('DEPBEMACUM0').Value +
                                                               cdsSegregacao.FieldByName('DEPBEMACUM0').Value;
            cdsTotalGeral.FieldByName('DEPBEMATU0').Value   := cdsTotalGeral.FieldByName('DEPBEMATU0').Value +
                                                               cdsSegregacao.FieldByName('DEPBEMATU0').Value;
            cdsTotalGeral.FieldByName('CUSTOREAV0').Value   := cdsTotalGeral.FieldByName('CUSTOREAV0').Value  +
                                                               cdsSegregacao.FieldByName('CUSTOREAV0').Value;
            cdsTotalGeral.FieldByName('DEPREAVACUM0').Value := cdsTotalGeral.FieldByName('DEPREAVACUM0').Value +
                                                               cdsSegregacao.FieldByName('DEPREAVACUM0').Value;
            cdsTotalGeral.FieldByName('DEPREAVATU0').Value  := cdsTotalGeral.FieldByName('DEPREAVATU0').Value +
                                                               cdsSegregacao.FieldByName('DEPREAVATU0').Value;
            cdsTotalGeral.FieldByName('VALCTB0').Value      := cdsTotalGeral.FieldByName('VALCTB0').Value +
                                                               cdsSegregacao.FieldByName('VALCTB0').Value;
          end;
          cdsTotalGeral.Post;
          cdsSegregacao.Next;
        end;

        i := 1;
        fValorLanc := 0;
        cdsTotalGeral.First;

        //Cássio SOL Nº 142231 KINTANA Nº 905545 - Início
        _cdsTemp3.Data := _Ctrl.GetDataPacket('SELECT ''                                                           '' AS PATRO FROM DUAL WHERE 1=2');

        while not cdsTotalGeral.Eof do
        begin
          if not _cdsTemp3.Locate('PATRO', VarArrayOf([cdsTotalGeralPATRO.Value]), []) then
          begin
            _cdsTemp3.Append;
            _cdsTemp3.FieldByName('PATRO').Value := cdsTotalGeralPATRO.Value;
            _cdsTemp3.Post;
          end;
          cdsTotalGeral.Next;
        end;

        _cdsTemp3.First;
        while not _cdsTemp3.Eof do
        begin
          dPercent := 0;
          fValorLanc:= 0;
          cdsTotalGeral.First;
          cdsTotalGeral.Filter := 'PATRO = ' +QuotedStr(_cdsTemp3.FieldByName('PATRO').asString);
          cdsTotalGeral.Filtered := True;

          while not cdsTotalGeral.Eof do
          begin
            fValorLanc := fValorLanc + cdsTotalGeral.FieldByName('VALCTB0').AsFloat;
            cdsTotalGeral.Next;
          end;
          cdsTotalGeral.First;

          while not cdsTotalGeral.Eof do
          begin
            cdsTotalGeral.Edit;
            if cdsTotalGeral.RecNo = cdsTotalGeral.RecordCount then
              cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent
            else
              if fValorLanc > 0 then
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := RoundCM((cdsTotalGeral.FieldByName('VALCTB0').asFloat * 100) /
                                                                              fValorLanc ,2)
              else
                cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat := 0;

            dPercent := dPercent + cdsTotalGeral.FieldByName('PERCENTRATEIO').AsFloat;
            cdsTotalGeral.Post;
            cdsTotalGeral.Next;
          end;
          _cdsTemp3.Next;
        end;
        //Alteração termina aqui
        cdsTotalGeral.Filtered := False;
        //Cássio SOL Nº 142231 KINTANA Nº 905545 - Fim
        TotalizaGrupos;
      end;
    end;
  finally
    FreeAndNil(_cdsTemp);
    FreeAndNil(_cdsTemp2);
    FreeAndNil(_cdsTemp3);
    FreeAndNil(_Ctrl);
  end;
end;

function TfrmParamSldCtbImoMestre.ConvNum(nValor: Extended; trun2cd: boolean): Extended;
var
  vlrTexto:string;
begin
  //SOL:
  if trun2cd then
  begin
    try
      vlrTexto := FloatToStrF(nValor,ffnumber,20,6);
      vlrTexto := copy(vlrTexto,1, pos(',',vlrTexto) + 2);
      Result := strtofloat( StringReplace(vlrTexto,'.','',[rfreplaceall]) );
    except
      Result := strtofloat(Format('%20.5f',[nValor]));
    end;
  end
  else
    Result := strtofloat(Format('%20.5f',[nValor]));
end;

end.
