//------------------------------------------------------------------
// Sistema  .: ADMPREV
//------------------------------------------------------------------
// Formulário para pedir um novo Motivo.
// RICARDO - 15.05.2000
//------------------------------------------------------------------------------
// Alterações .:
//  21/09/2000 - Alexandre Ramos
//               Diversas!
//------------------------------------------------------------------------------
unit FCadHistFuncPartCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, Wwdotdot,
  Wwdbcomb, DBCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  wwdbedit, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList,
  IvDictio, IvMulti, IvEMulti, {DBCtrlt}  URegra{$IFNDEF Versao05}, UcmTypes {$ENDIF}, udiasUteis;

type
  TValTot  = array[1..100]  of String[08];
  TValUnit = array[1..100]  of String[08];

type
// Tipos usados
  TTipoProcesso=(TpBatch, TpUnitario);

  TfrmCadHistFuncPartCS = class(TfrmCadastroCS)
    MontaSelectPart: TMontaSelect;
    qryAux: TwwQuery;
    qryTpInsalubri: TwwQuery;
    qryTipoDocPessoa: TwwQuery;
    QryHistFuncPrev: TwwQuery;
    dsHistFuncPrev: TwwDataSource;
    qryRegra: TwwQuery;
    qryAux2: TwwQuery;
    QryHistFuncPrevTempoSer: TIntegerField;
    QryHistFuncPrevTemposernaocred: TIntegerField;
    QryHistFuncPrevTemposeresp: TIntegerField;
    QryHistFuncPrevIDPESSOA: TFloatField;
    QryHistFuncPrevIDPESSJUR: TFloatField;
    QryHistFuncPrevSEQHISTFUNC: TFloatField;
    QryHistFuncPrevIDDOCUMENTO: TFloatField;
    QryHistFuncPrevCODTPINSALUBRI: TStringField;
    QryHistFuncPrevDATAINICIO: TDateTimeField;
    QryHistFuncPrevDATAFINAL: TDateTimeField;
    QryHistFuncPrevEMPRESA: TStringField;
    QryHistFuncPrevCARGO: TStringField;
    QryHistFuncPrevVALORCARGO: TFloatField;
    QryHistFuncPrevFUNCAO: TStringField;
    QryHistFuncPrevFLGCONTATS: TFloatField;
    QryHistFuncPrevVINCEMPREG: TStringField;
    QryHistFuncPrevTEMPOSERVANTERIOR: TFloatField;
    QryHistFuncPrevTEMPOSITESPECIAL: TFloatField;
    QryHistFuncPrevTEMPONAOCREDITADO: TFloatField;
    QryHistFuncPrevNOME: TStringField;
    QryHistFuncPrevCPF: TStringField;
    QryHistFuncPrevChkConc: TBooleanField;
    qryAux3: TwwQuery;
    qryPatroFund: TwwQuery;
    dbgHistFuncPrev: TwwDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    edParticipante: TEdit;
    bbtnProcurar: TBitBtn;
    edMatricula: TEdit;
    dbedSeqHistFunc: TwwDBEdit;
    edDocumento: TMaskEdit;
    dtAdmissao: TCMDateTimePicker;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    lblEmpresa: TLabel;
    label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbedDataInicio: TCMDateTimePicker;
    dbedDataFinal: TCMDateTimePicker;
    dbedEmpresa: TwwDBEdit;
    dbchkFlgContaTS: TDBCheckBox;
    dblkpcmbCodTpInsalubri: TwwDBLookupCombo;
    dblkpcmbIdDocumento: TwwDBLookupCombo;
    dbedNumDocumento: TwwDBEdit;
    dbedCargo: TwwDBEdit;
    dbedFuncao: TwwDBEdit;
    dbcbVincEmp: TwwDBComboBox;
    dbedValor: TwwDBEdit;
    rgrpTipoEmpresa: TRadioGroup;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label4: TLabel;
    dbedMatricula: TwwDBEdit;
    QryHistFuncPrevMATRICULA: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDPESSJUR: TFloatField;
    qrySEQHISTFUNC: TFloatField;
    qryDATAINICIO: TDateTimeField;
    qryDATAFINAL: TDateTimeField;
    qryEMPRESA: TStringField;
    qryCARGO: TStringField;
    qryVALORCARGO: TFloatField;
    qryFUNCAO: TStringField;
    qryCODTPINSALUBRI: TStringField;
    qryIDDOCUMENTO: TFloatField;
    qryNUMDOCUMENTO: TStringField;
    qryTEMPOCALCINSALUB: TFloatField;
    qryFLGCONTATS: TFloatField;
    qryVINCEMPREG: TStringField;
    qryMATRICULA: TStringField;
    qryTEMPOCALC: TFloatField;
    qryFLGCONCOMITANTE: TFloatField;
    QryHistFuncPrevTEMPOCALC: TFloatField;
    QryHistFuncPrevFLGCONCOMITANTE: TFloatField;
    PnlTempoTotal: TPanel;
    QryHistFuncPrevFATOR: TFloatField;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbedDataInicioExit(Sender: TObject);
    procedure dbedDataFinalExit(Sender: TObject);
    procedure dblkpcmbIdDocumentoChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure rgrpTipoEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgHistFuncPrevDblClick(Sender: TObject);
  private
    wValTot,wValUnit : TValTot;
    sIdPessoa, sIdPessJur, sSeqHistFunc, sSql, sCodTip, sIdDoc : string;
    iYear, iMonth, iDay : Word;
    sNomeStep, sValorStep, sNomeValorStep, wData, wDataMin, wDataMax, wDataAnt, WDataPos : string;
    dTempoDecorrido: double;
    sTipo, wAnos, wMeses, wDias, wAnos1, wMeses1, wDias1, wanomesdia,wanomesdia1,wanomesdia2, numanos, nummeses, numdias, wTotanomesdia : string;
    dTempoDecorridoi,dTempoemMeses,dTempoDecorridot,dTempoCalculado,dTempoCalculadois,wanoini, wanofim, numlinhas, I, wValInter,wValAtual,wValResult, wCont : integer;
    sCalc : Boolean;
    procedure VerificaTempoCalculado;
    procedure CalcAnoMesDia;
    procedure AtualizaGrid;
    procedure CarregaDados;
    procedure GravaTEMPOSERVANTERIOR;
    procedure GravaTEMPOSITESPECIAL;
    procedure GravaTEMPONAOCREDITADO;
    procedure GravaTEMPOSERVPUBLANT;
    procedure GravaTEMPOSERVPRIANT;
    procedure GravaTEMPOINSSAFAST;
    procedure DesfazTEMPOSERVANTERIOR;
    procedure DesfazTEMPOSITESPECIAL;
    procedure DesfazTEMPONAOCREDITADO;
    procedure DesfazTEMPOSERVPUBLANT;
    procedure DesfazTEMPOSERVPRIANT;
    procedure DesfazTEMPOINSSAFAST;

    { Private declarations }
  public
    { Public declarations }
    wIdDocumento :Integer;
    wNumDocumento:String;

//-----------------------------------------------------------------------------
// Novas Funcoes
//------------------------------------------------------------------------------

// Retorna tempo em extenso
    Function TempoExtenso(Tempo:Integer):String;

    Function TransformaDiasTempo(Tempo:Integer):String;

// Retorna Indicador se Periodo for Concomitante
    Function PeriodoConcomitante(QryLocal: TwwQuery;
                                 IdPessoa, Sequencia : Integer;
                                 DataInicial, DataFinal: String):Boolean;

// Retorna proximo Sequencial da Pessoa
    Function ProxSequencial(QryLocal: TwwQuery;
                            IdPessoa: Integer):Integer;

// Refaz os Calculos dos Tempos de Contribuicao para a Pessoa
    Function ProcessaHistContrib(QryLocal: TwwQuery;
                                 IdPessoa: Integer;
                                 StrDataFinal:String;
                                 TipoProcesso:TTipoProcesso):Boolean;
// Calcula Tempo de Contribuicao Deste Periodo
    Function CalcTempoContrib(QryLocal: TwwQuery;
                              IdPessoa, Sequencia, FlgContaTempoServico,
                              FlgTipoCalculo: Integer; // 1-Normal, 2-Desconto
                              DataInicial, DataFinal, DataFimProc: String):Integer;
// Processa Descontos no Tempo de Contribuicao
    Function ProcessaDescontos(QryLocal: TwwQuery;
                               IdPessoa, Sequencia: Integer;
                               FatorMultiplicador:Double;
                               DataInicial, DataFinal, DataFimProc: String):Integer;
// Processa Acrecimos no Tempo de Contribuicao
    Function ProcessaAcrecimos(QryLocal: TwwQuery;
                               IdPessoa, Sequencia: Integer;
                               TempoCalculado:Double;
                               CodTipInsaubr,
                               DataInicial, DataFinal, DataFimProc: String):Integer;
// Busca o Tempo de Contribuicao calculado
    Function BuscaTempoContrib(QryLocal: TwwQuery;
                               IdPatro, IdPessoa: Integer):Integer;
// Grava o Tempo de Contribuicao calculado
    Procedure GravaTempoContrib(QryLocal: TwwQuery;
                                IdPessoa: Integer);
  end;

// Repete Um Texto "n" Neves
  Function Replicate            (Texto:String;NVezes:Integer):String;

var
  frmCadHistFuncPartCS: TfrmCadHistFuncPartCS;

implementation

uses
   UMensErro, UAdmPrev, UDataBase, UFuncoesUteis,
   FInformaData;

{$R *.DFM}

//------------------------------------------------------
// Repete Um Texto "n" Neves
Function Replicate(Texto:String;NVezes:Integer):String;
Var
  I:Integer;
Begin
// Critica Dados Enviados
  If (Texto = '') Or (NVezes <=0) Then Begin
    Result:=''; // Resultado
    Exit;
  End;
  Result:='';
// Repete a String N Vezes
  For I:= 1 To nVezes Do Begin
    Result:=Result + Texto
  End;
End;

procedure TfrmCadHistFuncPartCS.bbtnConfirmarClick(Sender: TObject);
Var
  wDataFinal:String;
begin
  sCalc := True;
// Caso a Data de Final esteja vazia processa como Atual
  if Trim(dbedDataFinal.Text) = '' then begin
    wDataFinal := DateToStr(Date);
  end else begin
// Guarda Data Final
    wDataFinal := dbedDataFinal.Text;

    if StrToDate(dbedDataFinal.Text) < StrToDate(dbedDataInicio.Text) then begin
    	 MsgDlg('A Data Final deve ser maior que a Data de Início.','Erro',mtError,[mbOk,mbHelp],0);
	     dbedDataFinal.Text := '';
	     dbedDataFinal.SetFocus;
	     Exit;
    end;

  end;

  if Trim(edParticipante.Text) = '' then begin
    MsgDlg('O Participante deve ser selecionado','Erro',mtError,[mbOk,mbHelp],0);
    edDocumento.SetFocus;
    Exit;
  end;

  if Trim(dbedDataInicio.Text) = '' then begin
    MsgDlg('Data Inicio não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedDataInicio.SetFocus;
    Exit;
  end;

//------------------------------------------------------------------------------
// Guarda Dados

// Guarda o Nome da Patrocinadora com Historico, caso seja Patrocinadora
  Qry.FieldByName('IDPESSOA').AsString       := sIdPessoa;

  If Trim(Qry.FieldByName('EMPRESA').AsString) = '' Then Begin
    Qry.FieldByName('EMPRESA').AsString:= dblkpcmbPatro.Text;
  End;

  qry.FieldByName('NUMDOCUMENTO').AsString     := dbedNumDocumento.Text;

// Caso Inserindo
  If Qry.State In [DsInsert] Then Begin
// Pega Proximo Numero na Sequncia
    Qry.FieldByName('SEQHISTFUNC').AsInteger := ProxSequencial(QryAux,StrToInt(sIdPessoa));
  End;

//------------------------------------------------------------------------------
//  Testa se Tempo é Concomitante
  If PeriodoConcomitante(QryAux,
                         StrtoInt(sIdPEssoa),
                         Qry.FieldByName('SEQHISTFUNC').AsInteger,
                         DbedDataInicio.Text,
                         DbedDataFinal.Text)
  Then Begin
    Qry.FieldByName('FLGCONCOMITANTE').AsInteger := 1;
  End Else Begin
    Qry.FieldByName('FLGCONCOMITANTE').AsInteger := 0;
  End;

// Guarda dados que serão informados automaticamente
  wIdDocumento  := Qry.FieldByName('IDDOCUMENTO').AsInteger;
  wNumDocumento := Qry.FieldByName('NUMDOCUMENTO').AsString;

// Heranca
  inherited;

//------------------------------------------------------------------------------
// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  ProcessaHistContrib(QryAux,
                      StrToInt(sIdPessoa),
                      DateToStr(Date),
                      TpUnitario);

  AtualizaGrid;

  Label18.Caption := 'Tempo .: '+TempoExtenso(QryHistFuncPrev.FieldByName('TEMPOCALC').AsInteger);

  PnlTempoTotal.Caption:=IntToStr(BuscaTempoContrib(QryAux,
                                  StrToInt(sIdPessJur), StrToInt(sIdPessoa) ));
  PnlTempoTotal.Hint   := TempoExtenso(StrtoInt(PnlTempoTotal.Caption));

// Habilita Botoes
  sbtnAlterar.Enabled :=True;
  sbtnApagar.Enabled  :=True;
  sbtnInserir.Enabled :=True;
  pnlFundo.Enabled:=True;

end;

//******************************************************************************
// Novas Funcoes
//******************************************************************************

//******************************************************************************
// Retorna tempo em extenso
Function TfrmCadHistFuncPartCS.TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= Replicate('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;

//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TfrmCadHistFuncPartCS.TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := Replicate('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;

//******************************************************************************
// Busca o Tempo total de Contribuicao calculado de uma pessoa
Function TFrmCadHistFuncPartCS.BuscaTempoContrib(QryLocal: TwwQuery;
                                                 IdPatro, IdPessoa: Integer):Integer;
Var
  wTempoTotal:Integer;
Begin
  Result :=0;
// Inicio da Rotina
  Try
    With QryLocal Do Begin
// Busca Todos os Lancamentos da Pessoa
      Close;
      SQL.Clear;
      SQL.Add('SELECT TEMPOSERVCALC FROM ELEGPATRO   '+
              'WHERE IDPESSJUR = ' + IntToStr(IdPatro)+' AND '+
              '      IDPESSOA  = ' + IntToStr(IdPessoa)  );
      Open;
// Caso não Tenha Volta
      If IsEmpty Then Begin
        Exit;
      End;

// Pega o Tempo Total
      wTempoTotal := FieldByName('TEMPOSERVCALC').AsInteger;

      Result := wTempoTotal;
    End;
  Except
// Caso de Erro mostra Mensagem
    MsgDlg('Erro ao Buscar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+')',
           'Erro', mtError,[mbOk],0);
  End;

End;

//******************************************************************************
// Grava o Tempo de Contribuicao calculado
Procedure TFrmCadHistFuncPartCS.GravaTempoContrib(QryLocal: TwwQuery;
                                                  IdPessoa: Integer);
Var
  wTempoTotal:Integer;
Begin
// Inicio da Rotina
  Try
    With QryLocal Do Begin
// Busca Todos os Lancamentos da Pessoa Ordenado por Data Inicial
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM HISTFUNCPREV                '+
              'WHERE IDPESSOA = ' + IntToStr(IdPessoa)+' '+
              'ORDER BY IDPESSOA, DATAINICIO');
      Open;
// Caso não Tenha Volta
      If IsEmpty Then Begin
        Exit;
      End;

// Varre Arquivo Acumulando Tempos de Contribuicao Validos
      wTempoTotal:=0;
      While Not Eof Do Begin
        If FieldByName('FLGCONTATS').AsInteger = 1 Then
          wTempoTotal := (wTempoTotal+FieldByName('TEMPOCALC').AsInteger);
// Proximo Registro
        Next;
      End;

// Atualiza Tabela ELEGPATRO com o Tempo de Contribuicao Total Calculado
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE ELEGPATRO SET TEMPOSERVCALC = ' +IntToStr(wTempoTotal)+' '+
              ' WHERE IDPESSOA = ' + IntToStr(IdPessoa));
      ExecSQL;
    End;
  Except
// Caso de Erro mostra Mensagem
    MsgDlg('Erro ao gravar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+')',
           'Erro', mtError,[mbOk],0);
  End;
End;

//******************************************************************************
// Refaz os Calculos dos Tempos de Contribuicao para a pessoa
Function  TFrmCadHistFuncPartCS.ProcessaHistContrib(QryLocal: TwwQuery;
                                                    IdPessoa: Integer;
                                                    StrDataFinal:String;
                                                    TipoProcesso:TTipoProcesso):Boolean;
Var
  QryLocalAux,QryLocal2:TwwQuery;
  wTempoInicial, wTempoConcomitante,
  wTempoCalc, wTempoCalcIns, wTempoDesconto, wTempoAcrecimo:Integer;
  wDataFinal:String;
Begin
  Result := False;

// Cria Objetos Locais
  QryLocalAux:= TwwQuery.Create(Self);
  QryLocalAux.DatabaseName:='BaseDados';
  QryLocal2  := TwwQuery.Create(Self);
  QryLocal2.DatabaseName:='BaseDados';

//  Inicio da Rotina
  Try
    With QryLocal Do Begin
// Apaga o Histórico de Tempo de Contribuicao
      ExecutarQuery(QryLocalAux,
        'UPDATE HISTFUNCPREV SET    '+
        '  TEMPOCALC        = NULL, '+
        '  TEMPOCALCINSALUB = NULL  '+
        'WHERE IDPESSOA = ' + IntToStr(IdPessoa));

// Busca Todos os Lancamentos da Pessoa Ordenado por Data Inicial, Sequencia
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM HISTFUNCPREV H, TPINSALUBRI T '+
              'WHERE H.IDPESSOA = ' + IntToStr(IdPessoa)+' AND '+
              '      H.CODTPINSALUBRI = T.CODTPINSALUBRI(+)    '+
              'ORDER BY H.IDPESSOA, H.DATAINICIO, H.SEQHISTFUNC');
      Open;
// Caso não Tenha Volta
      If IsEmpty Then Begin
        Result := True;
        Exit;
      End;

// Varre Arquivo Processando os periodos
      While Not Eof Do Begin
// Testa Datas, Caso Processo Unitário Mostra Mensagem caso Batch Aborta
        If (FieldByName('DATAFINAL').AsDateTime < FieldByName('DATAINICIO').AsDateTime) And
           (FieldByName('DATAFINAL').AsDateTime <> 0)
        Then Begin
          If TipoProcesso = TpUnitario Then Begin
     	    MsgDlg('Data Final menor que Inicial, registro será abortado. '+#13+
                  'MATRICULA .: '+QuotedStr(FieldByName('MATRICULA').AsString)  +'  '+
                  'SEQUENCIA .: '+QuotedStr(FieldByName('SEQHISTFUNC').AsString),
                  'Erro',mtError,[mbOk],0);
          End Else Begin
             Raise Exception.Create('Data Final menor que Inicial, registro abortado. '+
                                    'MATRICULA .: '+QuotedStr(FieldByName('MATRICULA').AsString) +'  '+
                                    'SEQUENCIA .: '+QuotedStr(FieldByName('SEQHISTFUNC').AsString));
          End;
// Proximo Registro e Volta
          Next;
          Continue;
        End;

// Calcula Tempo Sem Descontos deste periodo
           wTempoCalc := CalcTempoContrib(QryLocalAux,
                                       FieldByName('IDPESSOA').AsInteger,
                                       FieldByName('SEQHISTFUNC').AsInteger,
                                       FieldByName('FLGCONTATS').AsInteger,
                                       1, // Calculo Normal
                                       FieldByName('DATAINICIO').AsString,
                                       FieldByName('DATAFINAL').AsString,
                                       StrDataFinal);

// Processa Descontos de tempos Concomitantes
        wTempoDesconto:= ProcessaDescontos(QryLocalAux,
                                           FieldByName('IDPESSOA').AsInteger,
                                           FieldByName('SEQHISTFUNC').AsInteger,
                                           FieldByName('FATOR').AsFloat,
                                           FieldByName('DATAINICIO').AsString,
                                           FieldByName('DATAFINAL').AsString,
                                           StrDataFinal);

// Processa Acrecimos de tempos Especiais
        wTempoAcrecimo:= ProcessaAcrecimos(QryLocalAux,
                                           FieldByName('IDPESSOA').AsInteger,
                                           FieldByName('SEQHISTFUNC').AsInteger,
                                           (wTempoCalc-wTempoDesconto),
                                           FieldByName('CODTPINSALUBRI').AsString,
                                           FieldByName('DATAINICIO').AsString,
                                           FieldByName('DATAFINAL').AsString,
                                           StrDataFinal);

// Acerta Tempo de Contribuicao Real, com Descontos
        wTempoCalc:= ((wTempoCalc - wTempoDesconto) + wTempoAcrecimo);

//  Testa e Gera flag se Tempo é Concomitante
        If PeriodoConcomitante(QryLocalAux,
                               FieldByName('IDPESSOA').AsInteger,
                               FieldByName('SEQHISTFUNC').AsInteger,
                               FieldByName('DATAINICIO').AsString,
                               FieldByName('DATAFINAL').AsString)
        Then Begin
          wTempoConcomitante := 1;
        End Else Begin
          wTempoConcomitante := 0;
        End;

// Guarda Tempo de Contribuicao em Dias
        ExecutarQuery(QryLocalAux,
          'UPDATE HISTFUNCPREV SET '+
          '  TEMPOCALC        = '+IntToStr(wTempoCalc)         +', '+
          '  TEMPOCALCINSALUB = '+IntToStr(wTempoCalcIns)      +', '+
          '  FLGCONCOMITANTE  = '+IntToStr(wTempoConcomitante) +'  '+
          'WHERE IDPESSOA    = ' + FieldByName('IDPESSOA').AsString + ' AND ' +
          '      SEQHISTFUNC = ' + FieldByName('SEQHISTFUNC').AsString );

// Proximo Registro
        Next;
      End;
    End;

// Grava o Tempo Total da Pessoa
    GravaTempoContrib(QryLocalAux,
                      IdPessoa);
  Finally
// Libera Objetos Locais
    QryLocalAux.Free;
    QryLocal2.Free;
  End;

End;



//******************************************************************************
// Processa os Acrecimos no tempo de Contribuicao
Function  TFrmCadHistFuncPartCS.ProcessaAcrecimos(QryLocal: TwwQuery;
                                                  IdPessoa, Sequencia: Integer;
                                                  TempoCalculado:Double;
                                                  CodTipInsaubr,
                                                  DataInicial, DataFinal, DataFimProc: String):Integer;
Var
  wDataFimCalc:String;
  wTempoCalc, wTotalAcrecimos:Integer;
  wFator:Double;
Begin
  Result :=0;
// Caso não possua Insalubridade Sai Fora
  If Trim(CodTipInsaubr) = '' Then Exit;
// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);
// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;
// Caso Tempo Negativo Zera Dias Calculados
  If TempoCalculado < 0 Then TempoCalculado :=0;
// Busca Fator de Multiplicacao
  wFator:=1; // Inicia
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT FATOR, TEMPOPERMANMINIMO, FLGTEMPOCONTINUO, IDREGRAINSALUBRI ' +
            'FROM TPINSALUBRI  ' +
            'WHERE CODTPINSALUBRI = ' + QuotedStr(CodTipInsaubr) );
    Open;

// Guarda Fator Multiplicador
    wFator:= FieldByName('FATOR').AsFloat;

// Gera Resultado
    Result := Trunc((TempoCalculado*wFator) - TempoCalculado);
  End;

End;


//******************************************************************************
// Processa os Descontos no tempo de Contribuicao
Function  TFrmCadHistFuncPartCS.ProcessaDescontos(QryLocal: TwwQuery;
                                                  IdPessoa, Sequencia: Integer;
                                                  FatorMultiplicador:Double;
                                                  DataInicial, DataFinal, DataFimProc: String):Integer;
Var
  wDataFimCalc,wDataIniCalc:String;
  wTempoCalc, wTotalDescontos, wTipoDesconto :Integer;
Begin
  Result :=0; wTotalDescontos:=0;
// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);

// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;

// Busca Registros Concomitantes com o Processado
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT NVL(H.DATAFINAL, SYSDATE) AS DATAFINAL, H.*, T.* '+
      'FROM HISTFUNCPREV H, TPINSALUBRI T    ' +
      'WHERE H.IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
      '      H.SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
      '      H.CODTPINSALUBRI = T.CODTPINSALUBRI(+)       AND ' +
      '      (   ' +
      '       ( (H.TEMPOCALC IS NULL) AND (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+') ) OR '+
      '       (NVL(T.FATOR,0) > '+OraNumero(FloatToStr(FatorMultiplicador))+') OR '+
      '       (H.FLGCONTATS= 0 AND H.DATAINICIO <= TO_DATE('+QuotedStr(DataInicial)+',''DD/MM/YYYY'')) '+
      '      )  AND ' +
      '      (   ' +
      '      (H.DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
      '                            TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
      '       OR ' +
      '       H.DATAFINAL  BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
      '                            TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ' +
      '       OR ' +
      '      (H.DATAINICIO < TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'')  ' +
      '       AND ' +
      '       NVL(H.DATAFINAL, SYSDATE) > TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')) AND ' +
      '         (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+')'+
      '      )   ' +
      'ORDER BY DATAINICIO ');
    Open;

// Caso não Possua Registros, sai Fora
    If IsEmpty Then Begin
      Result := 0;
      Exit;
    End;

// Se a data de Inicio de Calculo é menor que o Inicio do Processo, o Calculo
// Assume a data de Inicio do processo, caso contrario assume a mesma.
    If (FieldByName('DATAINICIO').AsDateTime < StrToDate(DataInicial)) Then begin
      wDataIniCalc:=DataInicial;
    End Else Begin
      wDataIniCalc:=FieldByName('DATAINICIO').AsString;
    End;

//------------------------------------------------------------------------------
// Processa Registros
    While Not Eof Do Begin

// Caso Data Inicial seja menor que a Data de Inicio do Proximo calculo, ignora
      If StrToDate(wDataIniCalc) > FieldByName('DATAFINAL').AsDateTime Then Begin
// Proximo Registro e Volta ao Inicio
        Next;
        Continue;
      End;

// Gera a data final que sera calculada,
// Caso data final deste registro seja maior que a final do processo,
// data final = a do processo
      If (FieldByName('DATAFINAL').AsDateTime > StrToDate(DataFinal)) Then begin
        wDataFimCalc  := DataFinal;
        wTipoDesconto := 2;
      End Else Begin
        wDataFimCalc := FieldByName('DATAFINAL').AsString;
        wTipoDesconto := 1;
      End;

// Calcula Tempo Sem Descontos deste periodo
      wTempoCalc := CalcTempoContrib(QryLocal,
                                     FieldByName('IDPESSOA').AsInteger,
                                     FieldByName('SEQHISTFUNC').AsInteger,
                                     FieldByName('FLGCONTATS').AsInteger,
                                     wTipoDesconto, // Calculo Especial caso descontando
                                     wDataIniCalc,
                                     wDataFimCalc,
                                     DataFimProc);

// Acumula Descontos
      wTotalDescontos:= (wTotalDescontos+wTempoCalc);

// Proximo Registro
      Next;

// Se a data de Inicio do Proximo Calculo é menor que o final da ultima está e a data
// de inicio do proximo Calculo
      If (FieldByName('DATAINICIO').AsDateTime < StrToDate(wDataFimCalc)) Then begin
        wDataIniCalc:=DateToStr(StrToDate(wDataFimCalc)+1);
      End Else Begin
        wDataIniCalc:=FieldByName('DATAINICIO').AsString;
      End;

// Caso a data de Inicio do Proximo calculo passe da Data Final do Processo, sai Fora
      If StrToDate(wDataIniCalc) > StrToDate(DataFinal) Then Begin
        Break;
      End;
    End;
  End;
// Seta Resultado
  Result := wTotalDescontos;
End;

//******************************************************************************
// Calcula e Retorna Tempo de Contribuicao Deste Periodo
Function  TFrmCadHistFuncPartCS.CalcTempoContrib(QryLocal: TwwQuery;
                                                 IdPessoa, Sequencia, FlgContaTempoServico,
                                                 FlgTipoCalculo: Integer;
                                                 DataInicial, DataFinal, DataFimProc: String):Integer;
Var
  wAnoI, wMesI, wDiaI,
  wAnoF, wMesF, wDiaF :Word;
  wStrAno, wStrMes, wStrDia, wStrDataI, wStrDataF, wStrTempoFinal:String;
  wTempoFinal, I :Integer;
Begin
  Result :=0;

// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);
// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;

// Decodifica as Datas \\
// Incial
  DecodeDate(StrToDate(DataInicial),wAnoI,wMesI,wDiaI); // Inical
    wStrAno :=IntToStr(wAnoI);
    If wMesI >= 10 Then wStrMes:= IntToStr(wMesI) Else wStrMes:= '0'+IntToStr(wMesI);
    If wDiaI >= 10 Then wStrDia:= IntToStr(wDiaI) Else wStrDia:= '0'+IntToStr(wDiaI);
    wStrDataI:= wStrAno+wStrMes+wStrDia;
// Final
  DecodeDate(StrToDate(DataFinal),  wAnoF,wMesF,wDiaF); // Final

// Caso mes Final seja FEREVEIRO, Ultimo dia conta como 30. (Testa se é Bissexto)
    If ((wMesF = 02) And ((wDiaF = 29) Or ( (wDiaF = 28) And (AnoBissexto(wAnoF) = False) ) ) )
    Then Begin
      wDiaF:=30;
    End;

    wStrAno :=IntToStr(wAnoF);
    If wMesF >= 10 Then wStrMes:= IntToStr(wMesF) Else wStrMes:= '0'+IntToStr(wMesF);
    If wDiaF >= 10 Then wStrDia:= IntToStr(wDiaF) Else wStrDia:= '0'+IntToStr(wDiaF);
    wStrDataF:= wStrAno+wStrMes+wStrDia;

// Calcula Tempo Final
  wTempoFinal:= StrToInt(wStrDataF)-StrToInt(wStrDataI);

// Caso Não seja dia 31 o Final Soma 1 dia para acerto
  If (wDiaI <> 31) And (wDiaF <> 31) Then wTempoFinal:= (wTempoFinal+1);

// Decodifica Tempo Final
  wStrTempoFinal := IntToStr(wTempoFinal);
  I := Length(wStrTempoFinal);
  wStrTempoFinal:= Replicate('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
  wStrAno :=Copy(wStrTempoFinal,1,2);
  wStrMes :=Copy(wStrTempoFinal,3,2);
  wStrDia :=Copy(wStrTempoFinal,5,2);

//------------------------------------------------------------------------------
// Acerta datas \\

// Regras Passadas Pela Ursula Para Acerto da Data Final
// Caso Dias Maior que 30 Acerta
  If (wStrDia > '30')  Then Begin
// Acerta Dia Final
    wTempoFinal:=(wTempoFinal-70);
    wStrTempoFinal := IntToStr(wTempoFinal);
    I := Length(wStrTempoFinal);
    wStrTempoFinal:= Replicate('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Caso Meses > 12 Aumenta Ano
  If wStrMes > '12' Then Begin
// Acerta Dia Final
    wTempoFinal:=(wTempoFinal-8800);
    wStrTempoFinal := IntToStr(wTempoFinal);
    I := Length(wStrTempoFinal);
    wStrTempoFinal:= Replicate('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Caso mes Final seja FEREVEIRO
  If ( (FlgTipoCalculo = 1) And (wMesF = 02) And (StrToInt(wStrDia) >= 28)) Then Begin
    wStrDia:= '30';
  End;

// Caso Dias = 30 Aumenta Mes
  If wStrDia = '30' Then Begin
    wStrMes:= IntToStr((StrToInt(wStrMes)+1));
    If (StrToInt(wStrMes) < 10) Then wStrMes:= '0'+wStrMes;
    wStrDia:= '00';
  End;

// Caso Meses = 12 Aumenta Ano
  If wStrMes = '12' Then Begin
    wStrAno:= IntToStr((StrToInt(wStrAno)+1));
    wStrMes:= '00';
  End;

// Monta e seta Resultado
  wTempoFinal  := (StrToInt(wStrAno)*360)+
                  (StrToInt(wStrMes)*30)+
                   StrToInt(wStrDia);
  Result := wTempoFinal;
End;

//******************************************************************************
// Verifica se o Periodo Informado é Concomitante, Converge com outro
Function  TFrmCadHistFuncPartCS.PeriodoConcomitante(QryLocal: TwwQuery;
                                                    IdPessoa, Sequencia: Integer;
                                                    DataInicial, DataFinal: String):Boolean;
Begin
  Result := False;
// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);
// Verifica se no historico do participante, ja nao existe uma empresa com o periodo igual.
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(
     'SELECT SEQHISTFUNC FROM HISTFUNCPREV                 ' +
     'WHERE IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
     '      SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
     '      (DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
     '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
     '       OR                                                                               ' +
     '       DATAFINAL  BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
     '                          TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ');
    Open;

    If IsEmpty Then Begin
      Result := False;
    End Else Begin
      Result := True;
    End;
  End;
End;

//******************************************************************************
// Retorna o Proximo Sequencial da Pessoa
Function  TFrmCadHistFuncPartCS.ProxSequencial(QryLocal: TwwQuery;
                                               IdPessoa: Integer):Integer;
Begin
  Result := 1;
// Busca o Proximo Sequencial da Pessoa
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT MAX(SEQHISTFUNC) + 1 AS PROXIMOSEQHISTFUNC ' +
            ' FROM HISTFUNCPREV                                 ' +
            ' WHERE IDPESSOA = ' + IntToStr(IdPessoa) );
	   Open;
// Caso Maior que zero retorna o numero
	   If (QryAux.FieldByName('PROXIMOSEQHISTFUNC').AsInteger >= 1) Then Begin
	     Result := qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsInteger;
    End;
  End;
End;

//******************************************************************************
// Fim das Novas Funcoes
//******************************************************************************

procedure TfrmCadHistFuncPartCS.AtualizaGrid;
begin
// Busca Histórico do Funcionario

 If Not (Qry.State In [DsInsert]) Then
  begin
   QryHistFuncPrev.Close;
   QryHistFuncPrev.ParamByName('pIDPESSOA').AsString := sIdpessoa;
   QryHistFuncPrev.Open;
  end;

// Caso sem historico sai fora
  If (QryHistFuncPrev.IsEmpty) Or (Qry.State In [DsInsert]) Or
   (Trim(Qry.FieldByName('SEQHISTFUNC').AsString) = '') Then Exit;
// Posiciona o Grid como escolhido no Formulario
  QryHistFuncPrev.Locate('SEQHISTFUNC',
                  Qry.FieldByName('SEQHISTFUNC').AsString, [loPartialKey]);
// Seleciona o Grid
  If Qry.FieldByName('SEQHISTFUNC').AsString =
     QryHistFuncPrev.FieldByName('SEQHISTFUNC').AsString
  Then Begin
    dbgHistFuncPrev.UnselectAll;
    dbgHistFuncPrev.SelectRecord;
  End;
end;

procedure TfrmCadHistFuncPartCS.dsStateChange(Sender: TObject);
begin
  inherited;
// Habilita ou desabilita Componentes de Acordo com o Tipo de Operacao
  if ds.DataSet.State in [dsInsert] then begin
	   edDocumento.Enabled    := True;
	   edMatricula.Enabled    := True;
    edParticipante.Enabled := True;
	   bbtnProcurar.Enabled   := True;
    edDocumento.SetFocus;
  end;
  if ds.DataSet.State in [dsEdit] then begin
    edDocumento.Enabled    := False;
    edMatricula.Enabled    := False;
    edParticipante.Enabled := False;
    bbtnProcurar.Enabled   := False;
	   dbedDataInicio.SetFocus;
  end;
end;

procedure TfrmCadHistFuncPartCS.CarregaDados;
begin
// Busca Dados do Funcionário
  QryAux.Close;
  QryAux.Sql.Clear;
  QryAux.Sql.Add(
    ' SELECT P.NUMDOCUMENTO, P.IDPESSOA, P.NOME, EL.MATRICULA, EL.DATAADMISSAO, EL.IDPESSJUR ' +
		 ' FROM PESSOA P, ELEGPATRO EL ' +
		 ' WHERE P.TIPO         = ' + '''F''' + ' AND ' +
		 '       EL.IDPESSOA    = ' +sIdPessoa+
		 '       AND P.IDPESSOA = EL.IDPESSOA');
  QryAux.Open;

// Caso Não esteja vazio, Mostra dados
  if not qryAux.IsEmpty then begin
    edMatricula.Text    := qryAux.FieldByName('MATRICULA').AsString;
    dtAdmissao.Text     := qryAux.FieldByName('DATAADMISSAO').AsString;
    sIdPessJur          := qryAux.FieldByName('IDPESSJUR').AsString;
    edDocumento.Text    := qryAux.FieldByName('NUMDOCUMENTO').AsString;
    edParticipante.Text := qryAux.FieldByName('NOME').AsString;
  end;

// Busca outros Dados
  if not qry.IsEmpty then begin

   // Lise -  24/09/2001 - Alterado para DB2
    sSql  := 'SELECT IDDOCUMENTO, NOMEDOCUMENTO FROM TIPODOCPESSOA ' +
             'WHERE  IDDOCUMENTO = '+qry.FieldByName('IDDOCUMENTO').AsString;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;

    dblkpcmbIdDocumento.Text      := qryAux.fieldbyname('NOMEDOCUMENTO').asstring;
  end;
// Mostra tempo total do Funcionario e Hint com o extenso do tempo
  PnlTempoTotal.Caption:=IntToStr(BuscaTempoContrib(QryAux,
                                          StrToInt(sIdPessJur), StrToInt(sIdPessoa) ));

  PnlTempoTotal.Hint   := TempoExtenso(StrtoInt(PnlTempoTotal.Caption));
end;

procedure TfrmCadHistFuncPartCS.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
    sIdPessoa            := MontaSelectPart.ValoresChave[0];
    edParticipante.Text  := MontaSelectPart.ValoresChave[1];
    edDocumento.Text     := MontaSelectPart.ValoresChave[2];
    edMatricula.Text     := MontaSelectPart.ValoresChave[3];
    dtAdmissao.Text      := MontaSelectPart.ValoresChave[4];
    sIdPessJur           := MontaSelectPart.ValoresChave[5];
    AtualizaGrid;
    dbedDataInicio.SetFocus;
  end;
end;

procedure TfrmCadHistFuncPartCS.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbchkFlgContaTS.Checked       := True;
end;

procedure TfrmCadHistFuncPartCS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Atualiza Tela
  AtualizaGrid;

  If Not QryHistFuncPrev.IsEmpty Then
    Label18.Caption := 'Tempo .: '+TempoExtenso(QryHistFuncPrev.FieldByName('TEMPOCALC').AsInteger);
// Habilita Botoes
  sbtnAlterar.Enabled  :=True;
  sbtnApagar.Enabled   :=True;
  sbtnInserir.Enabled  :=True;
  pnlFundo.Enabled     :=True;
  bbtnProcurar.Enabled :=False;
end;

procedure TfrmCadHistFuncPartCS.sbtnInserirClick(Sender: TObject);
Var
  wIdPessoa, wIdPessJur :String;
begin
  wIdPessoa := sIdPessoa;
  wIdPessJur:= sIdPessJur;

  inherited;
  sTipo := 'INCLUSAO';
  Label18.caption := ' Total :';
  sIdPessoa :=wIdPessoa;
  sIdPessJur:=wIdPessJur;

  if (MontaSelect.RetornouValor) then begin
    CarregaDados;
    AtualizaGrid;
    dbedDataInicio.SetFocus;
  end;

// Preenche Dados Default
  Qry.FieldByName('FLGCONTATS').AsString := '1';
// Preenche dados informados automaticamente
  Qry.FieldByName('IDDOCUMENTO').AsInteger:=wIdDocumento;
  Qry.FieldByName('NUMDOCUMENTO').AsString:=wNumDocumento;

  rgrpTipoEmpresa.Itemindex := 1;
  bbtnProcurar.Enabled := True;
end;

procedure TfrmCadHistFuncPartCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (qry.State in [dsInactive]) or (qry.IsEmpty)
  then Exit;

  wCont := 0;

  sIdPessoa := Qry.FieldByName('IDPESSOA').AsString;
  AtualizaGrid;

  if Trim(qry.FieldByName('IDPESSJUR').AsString) = '' then begin
    rgrpTipoEmpresa.ItemIndex :=1;
    dblkpcmbPatro.Visible  := False;
    dbedEmpresa.Visible    := True;
    lblEmpresa.Caption     := 'Empresa';
  end else begin
    rgrpTipoEmpresa.ItemIndex :=0;
    dblkpcmbPatro.Visible  := True;
    dblkpcmbPatro.PerformSearch;
    dbedEmpresa.Visible    := False;
    lblEmpresa.Caption     := 'Patrocinadora';
    dbedEmpresa.Update;
  end;

//------------------------------------------------------------------------------
// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  Label18.Caption := 'Tempo .: '+TempoExtenso(Qry.FieldByName('TEMPOCALC').AsInteger);

end;


procedure TfrmCadHistFuncPartCS.sbtnApagarClick(Sender: TObject);
begin

//  inherited; //Nao tirar o comentario
  if CmeCadastro.Operacao = opIdle then begin
    CmeCadastro.Operacao := opApagar;

    if (MsgDlg('Deseja realmente excluir este registro?',
               'Exclusão', mtWarning, [mbYes,mbNo],0) = mrYes)
    then begin

      CmeCadastro.Delete(Self);

      edDocumento.Text    := '';
      edMatricula.Text    := '';
      edParticipante.Text := '';
      dtAdmissao.Text     := '';
      dblkpcmbCodTpInsalubri.Text := '';
      dblkpcmbIdDocumento.Text    := '';
      Label18.caption := ' Total :';

    end;

    if qry.IsEmpty then
       CmeCadastro.Operacao := opVazio
    else
       CmeCadastro.Operacao := opIdle;
  end;
  AtualizaGrid;
//------------------------------------------------------------------------------
// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  ProcessaHistContrib(QryAux,
                      StrToInt(sIdPessoa), DateToStr(Date),TpUnitario);

// Caso ainda existam registros para este Funcionário posiciona no proximo
  If Not QryHistFuncPrev.IsEmpty Then Begin
// Monta Consulta
	   Qry.Close;
	   Qry.ParamByName('pIDPESSOA').AsString   :=QryHistFuncPrev.FieldByName('IDPESSOA').AsString;
	   Qry.ParamByName('pSEQHISTFUNC').AsString:=QryHistFuncPrev.FieldByName('SEQHISTFUNC').AsString;
	   Qry.Open;

// Carrega os Dados no Funcionário
	   CarregaDados;
	   QryHistFuncPrev.Locate('SEQHISTFUNC',
                    Qry.FieldByName('SEQHISTFUNC').AsString, [loPartialKey]);
  End;

  PnlTempoTotal.Caption:=IntToStr(BuscaTempoContrib(QryAux,
                                  StrToInt(sIdPessJur), StrToInt(sIdPessoa) ));
  PnlTempoTotal.Hint   := TempoExtenso(StrtoInt(PnlTempoTotal.Caption));
  sbtnAlterar.Enabled :=True;
  sbtnApagar.Enabled  :=True;
  sbtnInserir.Enabled :=True;
  pnlFundo.Enabled:=True;
end;

procedure TfrmCadHistFuncPartCS.dbedDataInicioExit(Sender: TObject);
begin
  inherited;
  if Trim(dbedDataInicio.Text) = '' then Exit;

  if ds.DataSet.State in [dsEdit] then begin
    if Trim(dbedDataFinal.Text) = '' then Exit;

    if Trim(dblkpcmbCodTpInsalubri.Text) = '' then Exit;

    if StrToDate(dbedDataFinal.Text) < StrToDate(dbedDataInicio.Text) then begin
      MsgDlg('A Data Final deve ser maior que a Data de Início.','Erro',mtError,[mbOk,mbHelp],0);
      dbedDataFinal.Text := '';
      dbedDataFinal.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmCadHistFuncPartCS.dbedDataFinalExit(Sender: TObject);
begin
  inherited;
  if Trim(dbedDataInicio.Text) = '' then
     Exit;

  if Trim(dbedDataFinal.Text) = '' then
  begin
     Exit;
  end;

  if StrToDate(dbedDataFinal.Text) < StrToDate(dbedDataInicio.Text) then
  begin
     MsgDlg('A Data Final deve ser maior que a Data de Início.','Erro',mtError,[mbOk,mbHelp],0);
     dbedDataFinal.Text := '';
     Exit;
  end;

  if ds.DataSet.State in [dsEdit] then
  begin
     if Trim(dblkpcmbCodTpInsalubri.Text) = '' then
	Exit;
  end;

end;

procedure TfrmCadHistFuncPartCS.dblkpcmbIdDocumentoChange(Sender: TObject);
begin
  inherited;
  if (sIdPessoa <> '') and (Trim(dblkpcmbIdDocumento.Text) = 'CPF') then begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT NUMDOCUMENTO FROM PESSOA ' +
     		   ' WHERE IDPESSOA = ' + sIdPessoa);
    qryAux.Open;
    if ds.DataSet.State in [dsInsert] then
       qry.FieldByName('NUMDOCUMENTO').AsString := qryAux.FieldByName('NUMDOCUMENTO').AsString;
  End Else Begin
    if ds.DataSet.State in [dsInsert] then
       qry.FieldByName('NUMDOCUMENTO').AsString := '';
  end;
end;

procedure TfrmCadHistFuncPartCS.VerificaTempoCalculado;
var
 wAnoInic, wAnoFim, DiasT, i, wValAcum, wSeqAtu : Integer;
	wVet : string;
begin
  wValAcum := 0;
  qryAux3.close;
  qryAux3.ParamByName('pIdPessoa').Value     := sIdPessoa;
  qryAux3.open;

  if not qryAux3.IsEmpty then begin
    wDataMin  := qryAux3.FieldByName('DATAINICIO').AsString;
    wDataMax  := qryAux3.FieldByName('DATAFINAL').AsString;
  end else begin
    wDataMin  := dbedDataInicio.Text;
    wDataMax  := dbedDataFinal.Text;
  end;
  wanoini := strtoint(copy(dbedDataInicio.Text,7,4)+copy(dbedDataInicio.Text,4,2)+copy(dbedDataInicio.Text,1,2));
  wanofim := strtoint(copy(dbedDataFinal.Text,7,4)+copy(dbedDataFinal.Text,4,2)+copy(dbedDataFinal.Text,1,2));

  while not qryAux3.EOF do begin

    if strtodate(qryAux3.FieldByName('DATAINICIO').AsString) <= strtodate(wDataMax)
    then begin
      if strtodate(qryAux3.FieldByName('DATAFINAL').AsString) > strtodate(wDataMax)
      then begin
        wanoini   := strtoint(copy(wDataMax,7,4)+copy(wDataMax,4,2)+copy(wDataMax,1,2));
        wDataMax  := qryAux3.FieldByName('DATAFINAL').AsString;
        wanofim   := strtoint(copy(wDataMax,7,4)+copy(wDataMax,4,2)+copy(wDataMax,1,2));
        wanomesdia2 := inttostr(wanofim - wanoini);
        if strtodate(qryAux3.FieldByName('DATAINICIO').AsString) < strtodate(wDataMin)
        then begin
	         wanofim   := strtoint(copy(wDataMin,7,4)+copy(wDataMin,4,2)+copy(wDataMin,1,2));
	         wDataMin  := qryAux3.FieldByName('DATAINICIO').AsString;
	         wanoini   := strtoint(copy(wDataMin,7,4)+copy(wDataMin,4,2)+copy(wDataMin,1,2));
	         wanomesdia1 := inttostr(wanofim - wanoini);
	         if strtoint(wanomesdia1) < 0 then
	           wanomesdia1 := inttostr(wanoini - wanofim);
	           wValInter := strtoint(floattostr(strtodate(wDataMax) - strtodate(wDataMin)));
        end;
        wValAtual := strtoint(floattostr(strtodate(wDataMax) - strtodate(wDataMin)));
      end else begin
        if strtodate(qryAux3.FieldByName('DATAINICIO').AsString) < strtodate(wDataMin)
        then begin
          wanofim   := strtoint(copy(wDataMin,7,4)+copy(wDataMin,4,2)+copy(wDataMin,1,2));
          wDataMin  := qryAux3.FieldByName('DATAINICIO').AsString;
          wanoini   := strtoint(copy(wDataMin,7,4)+copy(wDataMin,4,2)+copy(wDataMin,1,2));
          wanomesdia1 := inttostr(wanofim - wanoini);
          if strtodate(qryAux3.FieldByName('DATAFINAL').AsString) > strtodate(wDataMax)
          then begin
            wanoini   := strtoint(copy(wDataMax,7,4)+copy(wDataMax,4,2)+copy(wDataMax,1,2));
            wDataMax  := qryAux3.FieldByName('DATAFINAL').AsString;
            wanofim   := strtoint(copy(wDataMax,7,4)+copy(wDataMax,4,2)+copy(wDataMax,1,2));
            wanomesdia2 := inttostr(wanofim - wanoini);
            if strtoint(wanomesdia2) < 0 then
              wanomesdia2 := inttostr(wanoini - wanofim);
            wValInter := strtoint(floattostr(strtodate(wDataMax) - strtodate(wDataMin)));
          end;
          wValAtual := strtoint(floattostr(strtodate(wDataMax) - strtodate(wDataMin)));
        end;
      end

    end; // While

    qryAux.close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(
      ' SELECT  MAX(DATAFINAL) AS DTFIM, MIN(DATAINICIO) AS DTINI FROM HISTFUNCPREV '+
  		 ' WHERE SEQHISTFUNC <= '+qryAux3.FieldByName('SEQHISTFUNC').asstring);
    qryAux.open;

    wanoini   := strtoint(copy(qryAux.FieldByName('DTINI').asstring,7,4)+copy(qryAux.FieldByName('DTINI').asstring,4,2)+copy(qryAux.FieldByName('DTINI').asstring,1,2));
    wanofim   := strtoint(copy(qryAux.FieldByName('DTFIM').asstring,7,4)+copy(qryAux.FieldByName('DTFIM').asstring,4,2)+copy(qryAux.FieldByName('DTFIM').asstring,1,2));

    wanomesdia := inttostr(wanofim - wanoini);
    if strtoint(wanomesdia) < 0 then
      wanomesdia := inttostr(wanoini - wanofim);

    CalcAnoMesDia;

    dTempoCalculadois  := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);
    if (StrToDate(dbedDataInicio.Text) > strtodate(wDataMin)) and (StrToDate(dbedDataFinal.Text) < strtodate(wDataMax))
    then
      dTempoCalculadois := 0;


    wValTot[qryAux3.FieldByName('SEQHISTFUNC').asinteger] := PreparaStr(numanos,4)+ColocaZeros(nummeses,2)+ColocaZeros(numdias,2);

    qryAux3.next;
  end;

  wanomesdia := inttostr(wanofim - wanoini);
  if strtoint(wanomesdia) < 0 then
     wanomesdia := inttostr(wanoini - wanofim);

  Label18.Caption := ' Total : ';
  wAnos := ' ';  wMeses := ' '; wDias := ' ';

  dTempoDecorrido  := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
  dTempoDecorridoi := Trunc(dTempoDecorrido);

  CalcAnoMesDia;

  wValUnit[qryHistFuncPrev.FieldByName('SEQHISTFUNC').asinteger] := Colocazeros(numanos,4)+ColocaZeros(nummeses,2)+ColocaZeros(numdias,2);

  dTempoCalculadois  := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);
  if (StrToDate(dbedDataInicio.Text) > strtodate(wDataMin)) and (StrToDate(dbedDataFinal.Text) < strtodate(wDataMax)) then
     dTempoCalculadois := 0;

  dTempoDecorridot   := dTempoCalculadois;
  dTempoCalculado    := dTempoDecorridot;

  if dsHistFuncPrev.DataSet.State in [dsEdit]
  then begin
    if qryHistFuncPrevTEMPOSERVANTERIOR.Value > 0 then
      qryHistFuncPrevTempoSer.Text    := inttostr(dTempoDecorridot);

    if qryHistFuncPrevTEMPOSITESPECIAL.Value > 0 then
      qryHistFuncPrevTemposeresp.Text := inttostr(dTempoDecorridot);

    if qryHistFuncPrevTEMPONAOCREDITADO.Value > 0 then
      qryHistFuncPrevTemposernaocred.text := inttostr(dTempoDecorridot);
  end;

  if (qryTpInsalubri.FieldByName('FATOR').AsString <> '') and (dblkpcmbCodTpInsalubri.Text <> '') then
    dTempoCalculado := dTempoCalculadois * qryTpInsalubri.FieldByName('FATOR').AsInteger;

  wanoini := strtoint(copy(dbedDataInicio.Text,7,4)+copy(dbedDataInicio.Text,4,2)+copy(dbedDataInicio.Text,1,2));
  wanofim := strtoint(copy(dbedDataFinal.Text,7,4)+copy(dbedDataFinal.Text,4,2)+copy(dbedDataFinal.Text,1,2));

  wanomesdia := inttostr(wanofim - wanoini);
  if strtoint(wanomesdia) < 0 then
    wanomesdia := inttostr(wanoini - wanofim);

  Label18.Caption := ' Total : ';
  wAnos := ' ';  wMeses := ' '; wDias := ' ';

  dTempoDecorrido  := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
  dTempoDecorridoi := Trunc(dTempoDecorrido);

  CalcAnoMesDia;

  dTempoCalculadois  := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);
  if (StrToDate(dbedDataInicio.Text) > strtodate(wDataMin)) and (StrToDate(dbedDataFinal.Text) < strtodate(wDataMax)) then
    dTempoCalculadois := 0;

  dTempoDecorridot   := dTempoCalculadois;
  dTempoCalculado    := dTempoDecorridot;

  if (qryTpInsalubri.FieldByName('FATOR').AsString <> '') and (dblkpcmbCodTpInsalubri.Text <> '') then
    dTempoCalculado := dTempoCalculadois * qryTpInsalubri.FieldByName('FATOR').AsInteger;

  label18.Caption    := ' Total : '+numanos + ' ano(s), '+ nummeses + ' mes(es) e '+ numdias + ' dia(s) ';

end;

procedure TfrmCadHistFuncPartCS.GravaTEMPOSERVANTERIOR;    // Tempo de Servico Anterior
var
  dTempoServAnterior: Integer;
begin
  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin
	   dTempoDecorrido := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
	   dTempoemMeses   := dTempoDecorridot;

	  {Seleciona TEMPOSERVANTERIOR}
	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPOSERVANTERIOR FROM ELEGPATRO '  +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   qryAux.Open;

	// Adiciona Tempo Servico Anterior
	   dTempoServAnterior := qryAux.FieldByName('TEMPOSERVANTERIOR').AsInteger + dTempoemMeses;

	  {Grava em ELEGPATRO Tempo Servico Anterior}
	   qryAux.Close;
	   qryAux.Sql.Clear;
	   qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVANTERIOR = ' + OraNumero(IntToStr(dTempoServAnterior)) +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   try
	      qryAux.ExecSQL;
	   except
	   on E:EDBEngineError do
	      begin
		   MostrarErro(E);
		   Exit;
	      end;
	   end;
      end;
end;

procedure TfrmCadHistFuncPartCS.GravaTEMPOSITESPECIAL;     // Tempo de Servico em Periculosidade
var
  dTempoSitEspecial: Integer;
begin
  dTempoDecorrido := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
  dTempoemMeses   := dTempoDecorridot;

  if (qryTpInsalubri.FieldByName('FLGTEMPOCONTINUO').AsString = '1') and // Se o tempo de servico deve ser continuo e,
     (qryTpInsalubri.FieldByName('TEMPOPERMANMINIMO').AsInteger > Trunc(dTempoemMeses/30)) then // Se o tempo de servico minimo exigido for maior que o tempo de servico do participante nesta empresa
      exit; // Nao grava tempo como TEMPOSITESPECIAL

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin

	  {Seleciona TEMPOSITESPECIAL}
	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPOSITESPECIAL FROM ELEGPATRO '   +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   qryAux.Open;

	   if (qryTpInsalubri.FieldByName('FLGTEMPOCONTINUO').AsString = '0') and // Se o tempo de servico nao deve ser continuo e,
	      (qryTpInsalubri.FieldByName('TEMPOPERMANMINIMO').AsFloat > Trunc(qryAux.FieldByName('TEMPOSITESPECIAL').AsInteger/30)) then // Se o tempo de servico minimo exigido for maior que o tempo de servico do participante acumulado(em todas as empresas)
	       exit; // Nao grava tempo como TEMPOSITESPECIAL

	   // Adiciona Tempo Situacao Especial
	   dTempoSitEspecial := qryAux.FieldByName('TEMPOSITESPECIAL').AsInteger + dTempoemMeses;

	  {Grava em ELEGPATRO Tempo Situacao Especial}
	   qryAux.Close;
	   qryAux.Sql.Clear;
	   qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSITESPECIAL = ' + OraNumero(IntToStr(dTempoSitEspecial)) +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   try
	      qryAux.ExecSQL;
	   except
	   on E:EDBEngineError do
	      begin
		   MostrarErro(E);
		   Exit;
	      end;
	   end;
      end;
end;

procedure TfrmCadHistFuncPartCS.GravaTEMPONAOCREDITADO; // License
var
  dTempoNaoCreditado: Integer;
begin
  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin
	   dTempoDecorrido := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
	   dTempoemMeses   := dTempoDecorridot;

	  {Seleciona TEMPONAOCREDITADO}
	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPONAOCREDITADO FROM ELEGPATRO '  +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   qryAux.Open;

	// Adiciona Tempo nao creditado
	   dTempoNaoCreditado := qryAux.FieldByName('TEMPONAOCREDITADO').AsInteger + dTempoemMeses;

	  {Grava em ELEGPATRO Tempo nao creditado}
	   qryAux.Close;
	   qryAux.Sql.Clear;
	   qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPONAOCREDITADO = ' + OraNumero(IntToStr(dTempoNaoCreditado)) +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   try
	      qryAux.ExecSQL;
	   except
	   on E:EDBEngineError do
	      begin
                   MostrarErro(E);
                   Exit;
	      end;
           end;
      end;
end;

procedure TfrmCadHistFuncPartCS.DesfazTEMPOSERVANTERIOR;       // Tempo de Servico Anterior
var
  dTempoServAnterior: Integer;
begin
  qryAux2.Close;
  qryAux2.Sql.Clear;
  qryAux2.Sql.Add(' SELECT DATAINICIO, DATAFINAL, FLGCONTATS, CODTPINSALUBRI, VINCEMPREG FROM HISTFUNCPREV ' +
		  ' WHERE IDPESSOA    = ' + sIdPessoa +
		  ' AND   SEQHISTFUNC = ' + Trim(dbedSeqHistFunc.Text) );
  qryAux2.Open;

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin
      dTempoDecorrido  := StrToDate(qryAux2.FieldByName('DATAFINAL').AsString) - StrToDate(qryAux2.FieldByName('DATAINICIO').AsString);

    wanoini := strtoint(copy(qryAux2.FieldByName('DATAINICIO').AsString,7,4)+copy(qryAux2.FieldByName('DATAINICIO').AsString,4,2)+copy(qryAux2.FieldByName('DATAINICIO').AsString,1,2));
    wanofim := strtoint(copy(qryAux2.FieldByName('DATAFINAL').AsString,7,4)+copy(qryAux2.FieldByName('DATAFINAL').AsString,4,2)+copy(qryAux2.FieldByName('DATAFINAL').AsString,1,2));
    wanomesdia := inttostr(wanofim - wanoini);

    CalcAnoMesDia;

  dTempoemMeses      := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);


	  {Seleciona TEMPOSERVANTERIOR}
	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPOSERVANTERIOR FROM ELEGPATRO '  +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   qryAux.Open;

           // Diminui Tempo Servico Anterior
           if qryAux.FieldByName('TEMPOSERVANTERIOR').AsInteger > dTempoemMeses then
	      dTempoServAnterior := qryAux.FieldByName('TEMPOSERVANTERIOR').AsInteger - dTempoemMeses
           else
              dTempoServAnterior := dTempoemMeses - qryAux.FieldByName('TEMPOSERVANTERIOR').AsInteger;


	  {Grava em ELEGPATRO Tempo Servico Anterior}
	   qryAux.Close;
	   qryAux.Sql.Clear;
	   qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVANTERIOR = ' + OraNumero(IntToStr(dTempoServAnterior)) +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   try
	      qryAux.ExecSQL;
	   except
	   on E:EDBEngineError do
              begin
                   MostrarErro(E);
		   Exit;
	      end;
           end;
      end;
end;

procedure TfrmCadHistFuncPartCS.DesfazTEMPOSITESPECIAL; // Tempo de Servico em Periculosidade
var
  dTempoSitEspecial: Integer;
begin
  qryAux2.Close;
  qryAux2.Sql.Clear;
  qryAux2.Sql.Add(' SELECT HST.DATAINICIO, HST.DATAFINAL, HST.TEMPOCALCINSALUB, HST.VINCEMPREG, ' +
		  '        HST.FLGCONTATS, HST.CODTPINSALUBRI, TP.FLGTEMPOCONTINUO, TP.TEMPOPERMANMINIMO ' +
		  ' FROM HISTFUNCPREV HST, TPINSALUBRI TP ' +
		  ' WHERE HST.IDPESSOA    = ' + sIdPessoa + ' AND ' +
		  '       HST.SEQHISTFUNC = ' + Trim(dbedSeqHistFunc.Text) + ' AND ' +
		  '       HST.CODTPINSALUBRI = TP.CODTPINSALUBRI ');
  qryAux2.Open;

  dTempoDecorrido  := StrToDate(qryAux2.FieldByName('DATAFINAL').AsString) - StrToDate(qryAux2.FieldByName('DATAINICIO').AsString);

    wanoini := strtoint(copy(qryAux2.FieldByName('DATAINICIO').AsString,7,4)+copy(qryAux2.FieldByName('DATAINICIO').AsString,4,2)+copy(qryAux2.FieldByName('DATAINICIO').AsString,1,2));
    wanofim := strtoint(copy(qryAux2.FieldByName('DATAFINAL').AsString,7,4)+copy(qryAux2.FieldByName('DATAFINAL').AsString,4,2)+copy(qryAux2.FieldByName('DATAFINAL').AsString,1,2));
    wanomesdia := inttostr(wanofim - wanoini);

    CalcAnoMesDia;

  dTempoemMeses      := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);

  if (qryAux2.FieldByName('FLGTEMPOCONTINUO').AsString = '1') and // Se o tempo de servico deve ser continuo e,
     (qryAux2.FieldByName('TEMPOPERMANMINIMO').AsInteger > Trunc(dTempoemMeses/30)) then // Se o tempo de servico minimo exigido for maior que o tempo de servico do participante nesta empresa
      exit; // Nao grava tempo como TEMPOSITESPECIAL

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin

	  {Seleciona TEMPOSITESPECIAL}
	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPOSITESPECIAL FROM ELEGPATRO '   +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                          '       IDPESSOA  = ' + sIdPessoa);
           qryAux.Open;

           if (qryAux2.FieldByName('FLGTEMPOCONTINUO').AsString = '0') and // Se o tempo de servico nao deve ser continuo e,
              (qryAux2.FieldByName('TEMPOPERMANMINIMO').AsFloat > Trunc(qryAux.FieldByName('TEMPOSITESPECIAL').AsInteger/30)) then // Se o tempo de servico minimo exigido for maior que o tempo de servico do participante acumulado(em todas as empresas)
               exit; // Nao grava tempo como TEMPOSITESPECIAL

	   // Diminui Tempo Situacao Especial
           if qryAux.FieldByName('TEMPOSITESPECIAL').AsInteger > dTempoemMeses then
              dTempoSitEspecial := qryAux.FieldByName('TEMPOSITESPECIAL').AsInteger - dTempoemMeses
           else
              dTempoSitEspecial := dTempoemMeses - qryAux.FieldByName('TEMPOSITESPECIAL').AsInteger;

	  {Grava em ELEGPATRO Tempo Situacao Especial}
	   qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSITESPECIAL = ' + OraNumero(IntToStr(dTempoSitEspecial)) +
                          ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                          '       IDPESSOA  = ' + sIdPessoa);
           try
              qryAux.ExecSQL;
           except
           on E:EDBEngineError do
              begin
                   MostrarErro(E);
                   Exit;
              end;
           end;
      end;
end;

procedure TfrmCadHistFuncPartCS.DesfazTEMPONAOCREDITADO; // Licenca
var
  dTempoNaoCreditado: Integer;
begin
  qryAux2.Close;
  qryAux2.Sql.Clear;
  qryAux2.Sql.Add(' SELECT DATAINICIO, DATAFINAL, FLGCONTATS, CODTPINSALUBRI, VINCEMPREG FROM HISTFUNCPREV ' +
		  ' WHERE IDPESSOA    = ' + sIdPessoa  +
		  ' AND   SEQHISTFUNC = ' + Trim(dbedSeqHistFunc.Text) );
  qryAux2.Open;

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin
	   dTempoDecorrido  := StrToDate(qryAux2.FieldByName('DATAFINAL').AsString) - StrToDate(qryAux2.FieldByName('DATAINICIO').AsString);

    wanoini := strtoint(copy(qryAux2.FieldByName('DATAINICIO').AsString,7,4)+copy(qryAux2.FieldByName('DATAINICIO').AsString,4,2)+copy(qryAux2.FieldByName('DATAINICIO').AsString,1,2));
    wanofim := strtoint(copy(qryAux2.FieldByName('DATAFINAL').AsString,7,4)+copy(qryAux2.FieldByName('DATAFINAL').AsString,4,2)+copy(qryAux2.FieldByName('DATAFINAL').AsString,1,2));
    wanomesdia := inttostr(wanofim - wanoini);

    CalcAnoMesDia;

  dTempoemMeses      := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);

	  {Seleciona TEMPONAOCREDITADO}
           qryAux.Close;
	   qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT TEMPONAOCREDITADO FROM ELEGPATRO '  +
                          ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                          '       IDPESSOA  = ' + sIdPessoa);
           qryAux.Open;

	   // Diminui Tempo nao creditado
           if qryAux.FieldByName('TEMPONAOCREDITADO').AsInteger > dTempoemMeses then
              dTempoNaoCreditado := qryAux.FieldByName('TEMPONAOCREDITADO').AsInteger - dTempoemMeses
           else
              dTempoNaoCreditado := dTempoemMeses - qryAux.FieldByName('TEMPONAOCREDITADO').AsInteger;

          {Grava em ELEGPATRO Tempo nao creditado}
	   qryAux.Close;
	   qryAux.Sql.Clear;
           qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPONAOCREDITADO = ' + OraNumero(IntToStr(dTempoNaoCreditado)) +
                          ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                          '       IDPESSOA  = ' + sIdPessoa);
           try
              qryAux.ExecSQL;
           except
           on E:EDBEngineError do
              begin
                   MostrarErro(E);
		   Exit;
              end;
	   end;
      end;
end;

procedure TfrmCadHistFuncPartCS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sTipo := 'ALTERACAO';
end;

procedure TfrmCadHistFuncPartCS.GravaTEMPOSERVPRIANT;
var
  dTempoServPriAnt: Integer;
begin
  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
  begin
      dTempoDecorrido := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
      dTempoemMeses   := dTempoDecorridot;

      {Seleciona TEMPOSERVPRIVANT}
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT TEMPOSERVPRIVANT FROM ELEGPATRO '  +
		     ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
		     '       IDPESSOA  = ' + sIdPessoa);
      qryAux.Open;

      // Adiciona Tempo Servico Privado Anterior
      dTempoServPriAnt := qryAux.FieldByName('TEMPOSERVPRIVANT').AsInteger + dTempoemMeses;

      {Grava em ELEGPATRO Tempo Servico Privado Anterior}
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVPRIVANT = ' + OraNumero(IntToStr(dTempoServPriAnt)) +
		     ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
		     '       IDPESSOA  = ' + sIdPessoa);
      try
	 qryAux.ExecSQL;
      except
      on E:EDBEngineError do
	 begin
	   MostrarErro(E);
	   Exit;
	 end;
      end;
  end;
end;

procedure TfrmCadHistFuncPartCS.GravaTEMPOSERVPUBLANT;
var
  dTempoServPublAnt: Integer;
begin
  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
  begin
      dTempoDecorrido := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);
      dTempoemMeses   := dTempoDecorridot;

      {Seleciona TEMPOSERVPUBLANT}
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT TEMPOSERVPUBLANT FROM ELEGPATRO '  +
		     ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
		     '       IDPESSOA  = ' + sIdPessoa);
      qryAux.Open;

      // Adiciona Tempo Servico Publico Anterior
      dTempoServPublAnt := qryAux.FieldByName('TEMPOSERVPUBLANT').AsInteger + dTempoemMeses;

      {Grava em ELEGPATRO Tempo Servico Publico Anterior}
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVPUBLANT = ' + OraNumero(IntToStr(dTempoServPublAnt)) +
		     ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
		     '       IDPESSOA  = ' + sIdPessoa);
      try
	 qryAux.ExecSQL;
      except
      on E:EDBEngineError do
	 begin
	   MostrarErro(E);
	   Exit;
	 end;
      end;
  end;
end;

procedure TfrmCadHistFuncPartCS.GravaTEMPOINSSAFAST;
var
  dTempoServInssAfast: Integer;
begin
  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then begin
// Caso Data Final Vazia processa até Data Atual
    If Trim(dbedDataFinal.Text) = '' Then
      dTempoDecorrido := Date - StrToDate(dbedDataInicio.Text)
    Else
      dTempoDecorrido := StrToDate(dbedDataFinal.Text) - StrToDate(dbedDataInicio.Text);;

    dTempoemMeses   := dTempoDecorridot;

// Seleciona TEMPOINSSAFAST
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT TEMPOINSSAFAST FROM ELEGPATRO '  +
                     ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
		                  '       IDPESSOA  = ' + sIdPessoa);
    qryAux.Open;

// Adiciona Tempo Servico quando afastado da Patrocinadora
    dTempoServInssAfast := qryAux.FieldByName('TEMPOINSSAFAST').AsInteger + dTempoemMeses;

// Grava em ELEGPATRO Tempo Servico quando afastado da Patrocinadora
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOINSSAFAST = ' + OraNumero(IntToStr(dTempoServInssAfast)) +
                   ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
	                  '       IDPESSOA  = ' + sIdPessoa);
    try
	     qryAux.ExecSQL;
    except
      on E:EDBEngineError do begin
	       MostrarErro(E);
	       Exit;
	     end;
    end;
  end;
end;

procedure TfrmCadHistFuncPartCS.DesfazTEMPOINSSAFAST;
var
  dTempoServInssAfast: Integer;
  wDataFinal :String;
begin
  qryAux2.Close;
  qryAux2.Sql.Clear;
  qryAux2.Sql.Add(
     ' SELECT DATAINICIO, DATAFINAL, FLGCONTATS, CODTPINSALUBRI, VINCEMPREG FROM HISTFUNCPREV ' +
		  ' WHERE IDPESSOA    = ' + sIdPessoa + ' AND ' +
		  '       SEQHISTFUNC = ' + Trim(dbedSeqHistFunc.Text) );
  qryAux2.Open;

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then begin
// Caso Data Final Vazia processa até Data Atual
    If Trim(QryAux2.FieldByName('DATAFINAL').AsString) = '' Then
      wDataFinal := DateToStr(Date)
    Else
      wDataFinal := QryAux2.FieldByName('DATAFINAL').AsString;

    dTempoDecorrido  := StrToDate(wDataFinal) -
                        StrToDate(qryAux2.FieldByName('DATAINICIO').AsString);

    wanoini := strtoint(Copy(qryAux2.FieldByName('DATAINICIO').AsString,7,4)+
                        Copy(qryAux2.FieldByName('DATAINICIO').AsString,4,2)+
                        Copy(qryAux2.FieldByName('DATAINICIO').AsString,1,2));

    wanofim := strtoint(Copy(wDataFinal,7,4)+
                        Copy(wDataFinal,4,2)+
                        Copy(wDataFinal,1,2));

    wanomesdia := inttostr(wanofim - wanoini);

    CalcAnoMesDia;

    dTempoemMeses      := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);

// Seleciona TEMPOINSSAFAST
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(
      ' SELECT TEMPOINSSAFAST FROM ELEGPATRO '     +
      ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
      '       IDPESSOA  = ' + sIdPessoa);

    qryAux.Open;

    // Diminui Tempo Servico quando afastado da Patrocinadora
    if qryAux.FieldByName('TEMPOINSSAFAST').AsInteger > dTempoemMeses then
       dTempoServInssAfast := qryAux.FieldByName('TEMPOINSSAFAST').AsInteger - dTempoemMeses
    else
       dTempoServInssAfast := dTempoemMeses - qryAux.FieldByName('TEMPOINSSAFAST').AsInteger;

    {Grava em ELEGPATRO Tempo Servico quando afastado da Patrocinadora}
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(
      ' UPDATE ELEGPATRO SET TEMPOINSSAFAST = ' + OraNumero(IntToStr(dTempoServInssAfast)) +
      ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
      '       IDPESSOA  = ' + sIdPessoa);
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do begin
        MostrarErro(E);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmCadHistFuncPartCS.DesfazTEMPOSERVPRIANT;
var
  dTempoServPriAnt: Integer;
begin
  qryAux2.Close;
  qryAux2.Sql.Clear;
  qryAux2.Sql.Add(' SELECT DATAINICIO, DATAFINAL, FLGCONTATS, CODTPINSALUBRI, VINCEMPREG FROM HISTFUNCPREV ' +
		  ' WHERE IDPESSOA    = ' + sIdPessoa +
                  ' AND  SEQHISTFUNC = ' + Trim(dbedSeqHistFunc.Text) );
  qryAux2.Open;

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin
	   dTempoDecorrido  := StrToDate(qryAux2.FieldByName('DATAFINAL').AsString) - StrToDate(qryAux2.FieldByName('DATAINICIO').AsString);

    wanoini := strtoint(copy(qryAux2.FieldByName('DATAINICIO').AsString,7,4)+copy(qryAux2.FieldByName('DATAINICIO').AsString,4,2)+copy(qryAux2.FieldByName('DATAINICIO').AsString,1,2));
    wanofim := strtoint(copy(qryAux2.FieldByName('DATAFINAL').AsString,7,4)+copy(qryAux2.FieldByName('DATAFINAL').AsString,4,2)+copy(qryAux2.FieldByName('DATAFINAL').AsString,1,2));
    wanomesdia := inttostr(wanofim - wanoini);

    CalcAnoMesDia;

  dTempoemMeses      := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);

	  {Seleciona TEMPOSERVPRIVANT}
	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPOSERVPRIVANT FROM ELEGPATRO '  +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                          '       IDPESSOA  = ' + sIdPessoa);
	   qryAux.Open;

	   // Diminui Tempo Servico Privado Anterior
           if qryAux.FieldByName('TEMPOSERVPRIVANT').AsInteger > dTempoemMeses then
	      dTempoServPriAnt := qryAux.FieldByName('TEMPOSERVPRIVANT').AsInteger - dTempoemMeses
           else
              dTempoServPriAnt := dTempoemMeses - qryAux.FieldByName('TEMPOSERVPRIVANT').AsInteger;

	  {Grava em ELEGPATRO Tempo Servico Privado Anterior}
	   qryAux.Close;
	   qryAux.Sql.Clear;
	   qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVPRIVANT = ' + OraNumero(IntToStr(dTempoServPriAnt)) +
                          ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                          '       IDPESSOA  = ' + sIdPessoa);
           try
              qryAux.ExecSQL;
           except
           on E:EDBEngineError do
              begin
                   MostrarErro(E);
		   Exit;
	      end;
	   end;
      end;
end;

procedure TfrmCadHistFuncPartCS.DesfazTEMPOSERVPUBLANT;
var
  dTempoServPublAnt: Integer;
begin
  qryAux2.Close;
  qryAux2.Sql.Clear;
  qryAux2.Sql.Add(' SELECT DATAINICIO, DATAFINAL, FLGCONTATS, CODTPINSALUBRI, VINCEMPREG FROM HISTFUNCPREV ' +
		  ' WHERE IDPESSOA    = ' + sIdPessoa +
                  ' AND   SEQHISTFUNC = ' + Trim(dbedSeqHistFunc.Text) );
  qryAux2.Open;

  if (Trim(dtAdmissao.Text) <> '') and (sIdPessJur <> '') then
      begin
	   dTempoDecorrido  := StrToDate(qryAux2.FieldByName('DATAFINAL').AsString) - StrToDate(qryAux2.FieldByName('DATAINICIO').AsString);

    wanoini := strtoint(copy(qryAux2.FieldByName('DATAINICIO').AsString,7,4)+copy(qryAux2.FieldByName('DATAINICIO').AsString,4,2)+copy(qryAux2.FieldByName('DATAINICIO').AsString,1,2));
    wanofim := strtoint(copy(qryAux2.FieldByName('DATAFINAL').AsString,7,4)+copy(qryAux2.FieldByName('DATAFINAL').AsString,4,2)+copy(qryAux2.FieldByName('DATAFINAL').AsString,1,2));
    wanomesdia := inttostr(wanofim - wanoini);

    CalcAnoMesDia;

    dTempoemMeses      := (strtoint(numanos)*360)+(strtoint(nummeses)*30)+strtoint(numdias);

	  {Seleciona TEMPOSERVPUBLANT}

	   qryAux.Close;
	   qryAux.SQL.Clear;
	   qryAux.SQL.Add(' SELECT TEMPOSERVPUBLANT FROM ELEGPATRO '  +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   qryAux.Open;

	   // Diminui Tempo Servico Publico Anterior
	   if qryAux.FieldByName('TEMPOSERVPUBLANT').AsInteger > dTempoemMeses then
	      dTempoServPublAnt := qryAux.FieldByName('TEMPOSERVPUBLANT').AsInteger - dTempoemMeses
	   else
	      dTempoServPublAnt := dTempoemMeses - qryAux.FieldByName('TEMPOSERVPUBLANT').AsInteger;

	  {Grava em ELEGPATRO Tempo Servico Publico Anterior}
	   qryAux.Close;
	   qryAux.Sql.Clear;
	   qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVPUBLANT = ' + OraNumero(IntToStr(dTempoServPublAnt)) +
			  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
			  '       IDPESSOA  = ' + sIdPessoa);
	   try
	      qryAux.ExecSQL;
	   except
	   on E:EDBEngineError do
	      begin
		   MostrarErro(E);
		   Exit;
	      end;
	   end;
      end;
end;

procedure TfrmCadHistFuncPartCS.Label18Click(Sender: TObject);
var wMens : string;
begin
  inherited;
  wMens := ' ';
  wMens := wValTot[strtoint(dbedSeqHistFunc.text)];
  wMens := ' Tempo total trabalhado : '+ copy(wMens,1,4) + ' ano(s), '+ copy(wMens,5,2) + ' mes(es) e '+ copy(wMens,7,2) + ' dia(s) ';
  MsgDlg(wMens,'Informação',mtInformation,[mbOk],0);
end;

procedure TfrmCadHistFuncPartCS.CalcAnoMesDia;
begin
  if length(wanomesdia) < 7 then begin
    numanos  := copy(wanomesdia,1,2);
    nummeses := copy(wanomesdia,3,2);
    numdias  := copy(wanomesdia,5,2);

    if length(wanomesdia) = 5 then begin
	  // 29999
   	 numanos  := copy(wanomesdia,1,1);
	     nummeses := copy(wanomesdia,2,2);
	     numdias  := copy(wanomesdia,4,2);
    end;

    if length(wanomesdia) = 4 then begin
	  // 9999
  	   numanos  := '00';
	     nummeses := copy(wanomesdia,1,2);
	     numdias  := copy(wanomesdia,3,2);
    end;

    if length(wanomesdia) = 3 then begin
	  // 999
	     numanos  := '00';
	     nummeses := copy(wanomesdia,1,1);
	     numdias  := copy(wanomesdia,2,2);
    end;

    if length(wanomesdia) = 2 then begin
	  // 99
	     numanos  := '00';
	     nummeses := '00';
	     numdias  := copy(wanomesdia,1,2);

	     if ( RetornaAnoMes(strtodate(dbedDataInicio.Text)) = RetornaAnoMes(strtodate(dbedDataFinal.Text)) ) then
	       if ( copy(dbedDataInicio.Text,4,2) = '02') and ( copy(dbedDataFinal.Text,4,2) = '02')  then
		       if AnoBissexto(strtoint(copy(dbedDataInicio.Text,7,4))) then begin

		         if  numdias = '28' then numdias := inttostr(strtoint(numdias) + 2);
    		   end
		     else if  numdias = '27' then
   		   numdias := inttostr(strtoint(numdias) + 3);
    end;

    if length(wanomesdia) = 1 then begin
	  // 9
	     numanos  := '0';
	     nummeses := '0';
	     numdias  := copy(wanomesdia,1,1);
    end;

  end else begin
    numanos  := copy(wanomesdia,1,3);
    nummeses := copy(wanomesdia,4,2);
    numdias  := copy(wanomesdia,6,2);
  end;

  if strtoint(numdias) > 69 then begin
    numdias  := inttostr(strtoint(numdias) - 70 + 1);
    if strtoint(numdias) > 29 then begin
	     numdias  := '00';
	     nummeses := inttostr(strtoint(nummeses) + 1);
    end;
  end;

  if strtoint(nummeses) > 80 then begin
    nummeses := inttostr(strtoint(nummeses) - 88);
    if strtoint(nummeses) > 11 then begin
	     nummeses := '00';
	     numanos  := inttostr(strtoint(numanos) + 1);
    end;
  end;

end;

procedure TfrmCadHistFuncPartCS.rgrpTipoEmpresaClick(Sender: TObject);
begin
  inherited;
  if rgrpTipoEmpresa.ItemIndex = 1 then begin
     dblkpcmbPatro.Visible  := False;
     dbedEmpresa.Visible    := True;
     lblEmpresa.Caption     := 'Empresa';
     If Qry.State in [dsInsert, dsEdit] then dblkpcmbPatro.Clear;
  end else begin
     dblkpcmbPatro.Visible  := True;
     dbedEmpresa.Visible    := False;
     lblEmpresa.Caption     := 'Patrocinadora';
     If Qry.State in [dsInsert, dsEdit] then dbedEmpresa.Clear;
  end;
end;

procedure TfrmCadHistFuncPartCS.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, iYear, iMonth, iDay);
  wData  := ColocaZeros(inttostr(iDay),2)+ColocaZeros(inttostr(iMonth),2)+inttostr(iYear);
  wData  := ColocaBarra(wData);

// Guarda dados que serão informados automaticamente
  wIdDocumento  := 0;
  wNumDocumento := '';

  qry.Close;
  qry.ParamByName('pIdPessoa').Value     := 0;
  qry.ParamByName('pSeqHistFunc').Value  := 0;
  qry.Open;

  qryTpInsalubri.Close;   qryTpInsalubri.Open;
  qryTipoDocPessoa.Close; qryTipoDocPessoa.Open;

  dbchkFlgContaTS.Checked   := True;
  dbcbVincEmp.Text := '';
  wDataMax := '01/01/1000';
  wDataMin := '31/12/5000';

  qryPatroFund.Close;
  qryPatroFund.ParamByName('IdFundacao').AsInteger := iIdFundacao;
  qryPatroFund.Open;

  sbtnInserir.Enabled :=True;
  pnlFundo.Enabled    :=True;
end;

procedure TfrmCadHistFuncPartCS.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Caso tenha selecionado algum dado
  if (MontaSelect.RetornouValor) then begin

// Guarda Dados
	   qry.Close;
	   qry.ParamByName('pIdPessoa').AsString      := MontaSelect.ValoresChave[0];
	   qry.ParamByName('pSeqHistFunc').AsString   := MontaSelect.ValoresChave[3];
	   qry.Open;

//  Guarda Dados
	   edDocumento.Text       := MontaSelect.ValoresChave[2];
	   edParticipante.Text    := MontaSelect.ValoresChave[1];
	   sIdPessoa              := MontaSelect.ValoresChave[0];

// Carrega os Dados no Funcionário
	   CarregaDados;

// Atualiza os Dados do grid
	   AtualizaGrid;

	   QryHistFuncPrev.Locate('SEQHISTFUNC',
                    MontaSelect.ValoresChave[3], [loPartialKey]);
  end;
// Habilita Botoes
  sbtnAlterar.Enabled :=True;
  sbtnApagar.Enabled  :=True;
  sbtnInserir.Enabled :=True;
  pnlFundo.Enabled    :=True;

end;

procedure TfrmCadHistFuncPartCS.FormActivate(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
end;

procedure TfrmCadHistFuncPartCS.dbgHistFuncPrevDblClick(Sender: TObject);
begin
  inherited;
// Busca Novo Registro Principal
  qry.Close;
   qry.ParamByName('pIdPessoa').AsString   := QryHistFuncPrev.FieldByName('IDPESSOA').AsString;
   qry.ParamByName('pSeqHistFunc').AsString:= QryHistFuncPrev.FieldByName('SEQHISTFUNC').AsString;
  qry.Open;
end;

end.
