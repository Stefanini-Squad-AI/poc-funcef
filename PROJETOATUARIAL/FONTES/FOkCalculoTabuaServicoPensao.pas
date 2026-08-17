///////////////////////////////
// ClaudioR - 25-04-2006
// Os Labels "Tábua de Serviço Masculina" e "Tábua de Serviço Feminina" para
// "Tábua de Serviço (eixo jx)" e "Tábua de Serviço (eixo x)"
///////////////////////////////

unit FOkCalculoTabuaServicoPensao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBClient,
  DBTables, Wwquery, uVarCalc, uFuncGerais, Math, ComCtrls;

Type TTipoTabua = (tMasculina, tFeminina);

Type TSituacao = (tsCalculando, tsCancelado, tsParado);

Type
  TfrmOkCalculoTabuaServicoPensao = class(TfrmOkCancelar)
    Label3: TLabel;
    CMDBLkpCmbTabuaServico: TCMDBLookupCombo;
    Label1: TLabel;
    CMDBLkpCmbTabuaMasculina: TCMDBLookupCombo;
    Label7: TLabel;
    EdtDescricao: TEdit;
    ClntDtStTabuaServico: TClientDataSet;
    ClntDtStTabuaServicoIR_TIPO_TABUA_SERVICO: TStringField;
    ClntDtStTabuaServicoDS_TIPO_TABUA_SERVICO: TStringField;
    QryLkpTabuaMasculina: TwwQuery;
    QryLkpTabuaFeminina: TwwQuery;
    Label2: TLabel;
    CMDBLkpCmbTabuaFeminina: TCMDBLookupCombo;
    QryLkpTabuaMasculinaSQ_VERSAO_COMUTACAO: TFloatField;
    QryLkpTabuaMasculinaCD_TABUA_ROTATIV: TFloatField;
    QryLkpTabuaMasculinaCD_TABUA_ENTRADA_INVALID: TFloatField;
    QryLkpTabuaMasculinaCD_TABUA_INVALID: TFloatField;
    QryLkpTabuaMasculinaCD_TABUA_MORTAL: TFloatField;
    QryLkpTabuaMasculinaIR_VERSAO_COMUTACAO: TStringField;
    QryLkpTabuaMasculinaDS_VERSAO_COMUTACAO: TStringField;
    QryLkpTabuaMasculinaDT_GERACAO: TDateTimeField;
    QryLkpTabuaMasculinaTRGDTINCLUSAO: TDateTimeField;
    QryLkpTabuaMasculinaTRGUSERINCLUSAO: TStringField;
    QryLkpTabuaMasculinaCD_GRUPO_FORMULA: TFloatField;
    QryLkpTabuaFemininaSQ_VERSAO_COMUTACAO: TFloatField;
    QryLkpTabuaFemininaCD_TABUA_ROTATIV: TFloatField;
    QryLkpTabuaFemininaCD_TABUA_ENTRADA_INVALID: TFloatField;
    QryLkpTabuaFemininaCD_TABUA_INVALID: TFloatField;
    QryLkpTabuaFemininaCD_TABUA_MORTAL: TFloatField;
    QryLkpTabuaFemininaIR_VERSAO_COMUTACAO: TStringField;
    QryLkpTabuaFemininaDS_VERSAO_COMUTACAO: TStringField;
    QryLkpTabuaFemininaDT_GERACAO: TDateTimeField;
    QryLkpTabuaFemininaTRGDTINCLUSAO: TDateTimeField;
    QryLkpTabuaFemininaTRGUSERINCLUSAO: TStringField;
    QryLkpTabuaFemininaCD_GRUPO_FORMULA: TFloatField;
    qryLkpRotinaCalculoTabua: TwwQuery;
    qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA: TFloatField;
    qryLkpRotinaCalculoTabuaDS_GRUPO_FORMULA: TStringField;
    qryLkpRotinaCalculoTabuaIR_GRUPO_CALCULO: TStringField;
    Label4: TLabel;
    CMDBLkpCmbRotinaCalculoTabua: TCMDBLookupCombo;
    QryInsTabuaComutacao: TwwQuery;
    QryInsOcorTabuaComutacao: TwwQuery;
    QryMaxVersao: TwwQuery;
    QryMaxVersaoMAX_COD: TFloatField;
    pbrTabServico2: TProgressBar;
    qryLkpRotinaCalculoTabuaDS_OBSERV_FORMULA: TMemoField;
    plPassos: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure Cursor_Mouse(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    lstFormulasComSomatorio: TStringList;
    variavelCalculo: TVarCalc;
    lstTabuas, lstAdvertencias: TStringList;
    tipoTabua: TTipoTabua;
    function existemCriticas: Boolean;
    function setTabuaComutacao: Integer;
    function ExecutaFormula(sVAR_INICIAL, sVAR_INICIAL2, sVAR_FINAL, sVAR_RESULT, sFORMULA: String): Extended;
    function CalculaExpressaoRecursiva(sCADEIA: String): Extended;
    function valorComutacao(sNOME_VARIAVEL: String; iIDADE: Integer; iIDADE_PENSAO: Integer = -1; bVL_PENSAO: Boolean = False): Extended;
    function getFormulasComSomatorio: String;
    procedure calculaTabuaPensao;
    procedure executaCalculoTabuaMasculina;
    procedure executaCalculoTabuaFeminina;
    procedure setValoresArquivo;
    procedure setOcorrenciasTabua(iCD_VERSAO_TABUA: Integer);

    
    procedure Prepara_Form_Calculo(Condicao:Boolean);

  public
    { Public declarations }
    Situacao:TSituacao;


  end;

var
   frmOkCalculoTabuaServicoPensao: TfrmOkCalculoTabuaServicoPensao;

   
   LogString:TStringList;
   HoraIni, HoraFim:String;

implementation

uses uGlobal, dBaseDados, uCalculoTabuaServicoPensao, uExpresCalc,
     FOkListaAdvertencias;

{$R *.DFM}

procedure TfrmOkCalculoTabuaServicoPensao.Prepara_Form_Calculo(Condicao:Boolean);
Begin
   EdtDescricao.Enabled                 := Condicao;
   CMDBLkpCmbRotinaCalculoTabua.Enabled := Condicao;
   CMDBLkpCmbTabuaMasculina.Enabled     := Condicao;
   CMDBLkpCmbTabuaFeminina.Enabled      := Condicao;
   bbtnConfirmar.Enabled                := Condicao;
   bbtnSair.Enabled                     := Condicao;
   bbtnAjuda.Enabled                    := Condicao;
   bbtnCancelar.Enabled                 := Not Condicao;

   If Condicao Then
      Situacao := tsParado
   Else
      Situacao := tsCalculando;
End;

procedure TfrmOkCalculoTabuaServicoPensao.Cursor_Mouse(Sender: TObject;
                                             Shift: TShiftState; X, Y: Integer);
Var fCursos:TCursor;
    N:Integer;
Begin
   fCursos := crDefault;

   If Situacao = tsCalculando Then fCursos := crHourGlass;

   For N:=0 to ComponentCount -1 do
   Begin
      if Components[N] is TControl then TControl(Components[N]).Cursor := fCursos;

      If (TControl(Components[N]).Name = 'bbtnCancelar') And
         (Situacao = tsCalculando) Then TControl(Components[N]).Cursor := crDefault;
   End;
End;

procedure TfrmOkCalculoTabuaServicoPensao.FormCreate(Sender: TObject);
begin
   ClntDtStTabuaServico.CreateDataSet;
   ClntDtStTabuaServico.AppendRecord(['Comutação Normal (Padrão)', 'N']);
   ClntDtStTabuaServico.AppendRecord(['Comutação Ajustada', 'A']);
   ClntDtStTabuaServico.AppendRecord(['Tábua de Pensão', 'P']);

   QryLkpTabuaMasculina.Open;
   QryLkpTabuaFeminina.Open;
   qryLkpRotinaCalculoTabua.Open;

   inherited;
end;

procedure TfrmOkCalculoTabuaServicoPensao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ClntDtStTabuaServico.Close;
   QryLkpTabuaMasculina.Close;
   QryLkpTabuaFeminina.Close;
   qryLkpRotinaCalculoTabua.Close;

   inherited;
end;

procedure TfrmOkCalculoTabuaServicoPensao.FormShow(Sender: TObject);
begin
   If ClntDtStTabuaServico.Locate('IR_TIPO_TABUA_SERVICO', 'P', []) then
      CMDBLkpCmbTabuaServico.Text := ClntDtStTabuaServicoDS_TIPO_TABUA_SERVICO.asString;

   Situacao := tsParado;   

   inherited;
end;

procedure TfrmOkCalculoTabuaServicoPensao.bbtnConfirmarClick(Sender: TObject);
begin
   Try
      lstAdvertencias := TStringList.Create;
      lstFormulasComSomatorio := TStringList.Create;
      lstFormulasComSomatorio.Sorted := True;
      lstFormulasComSomatorio.Duplicates := dupIgnore;


      frmOkCalculoTabuaServicoPensao.Cursor := crHourGlass;
      Prepara_Form_Calculo(False);


      If not existemCriticas then
         calculaTabuaPensao;

      If lstAdvertencias.Count > 0 then
         Try
            frmOkListaAdvertencias := TfrmOkListaAdvertencias.Create(nil);
            frmOkListaAdvertencias.lstAdvertencias := Self.lstAdvertencias;
            frmOkListaAdvertencias.ShowModal;
         Finally
            frmOkListaAdvertencias.Release;
            frmOkListaAdvertencias := nil;
         End;
   Finally
      
      Prepara_Form_Calculo(True);
      frmOkCalculoTabuaServicoPensao.Cursor := crDefault;

      FreeAndNil(lstFormulasComSomatorio);
   End;
end;

function TfrmOkCalculoTabuaServicoPensao.existemCriticas: Boolean;
begin
   Result := False;

   If Trim(EdtDescricao.Text) = '' then
   Begin
      MessageDlg('Favor informar a Descrição.', mtWarning, [mbOk], 0);
      EdtDescricao.SetFocus;
      Result := True;
      Exit;
   End;

   If Trim(CMDBLkpCmbTabuaMasculina.Text) = '' then
   Begin
      MessageDlg('Favor informar a Tábua de Serviço Masculina.', mtWarning, [mbOk], 0);
      CMDBLkpCmbTabuaMasculina.SetFocus;
      Result := True;
      Exit;
   End;

   If Trim(CMDBLkpCmbTabuaFeminina.Text) = '' then
   Begin
      MessageDlg('Favor informar a Tábua de Serviço Feminina.', mtWarning, [mbOk], 0);
      CMDBLkpCmbTabuaFeminina.SetFocus;
      Result := True;
      Exit;
   End;
end;

procedure TfrmOkCalculoTabuaServicoPensao.calculaTabuaPensao;
var iCD_VERSAO: Integer;
begin
   Try
      Screen.Cursor := crHourGlass;
      bbtnConfirmar.Enabled := False;
      lstTabuas := TStringList.Create;

      LogString := TStringList.Create;
      LogString.Clear;
      HoraIni := TimeToStr(Time);
      //---

      //Inicializa e cria Variáveis.
      variavelCalculo := TVarCalc.Create(Nil); // Cria rotina p/ cálculo da Fórmula.

      setConsultaFormulasRotina;
      QryFormulasRotina.Close;
      QryFormulasRotina.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
      QryFormulasRotina.Open;

      setConsultaFormulasComSomatorio;
      QryFormulasComSomatorio.Close;
      QryFormulasComSomatorio.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
      QryFormulasComSomatorio.Open;

      If (QryFormulasRotina.isEmpty) and (QryFormulasComSomatorio.isEmpty) then
      Begin
         MessageDlg('Favor cadastrar Fórmulas para a Rotina selecionada.', mtWarning, [mbOk], 0);
         Exit;
      End;

      plPassos.Caption := 'Inicializando as variáveis para o cálculo';
      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      //---

      inicializaTabuaPensao(QryLkpTabuaMasculinaSQ_VERSAO_COMUTACAO.asInteger);

      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      //---

      inicializaTabuaPensao(QryLkpTabuaFemininaSQ_VERSAO_COMUTACAO.asInteger, False);

      HoraFim := TimeToStr(Time);
      LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + 'Todas as variaveis inicializadas');
      HoraIni := TimeToStr(Time);
      LogString.SaveToFile('c:\log_de_hora.txt');
      plPassos.Caption := 'Realizando os cálculos (1/2)';
      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      //---

      tipoTabua := tMasculina;
      executaCalculoTabuaMasculina;

      HoraFim := TimeToStr(Time);
      LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + 'Calculo Masculino');
      HoraIni := TimeToStr(Time);
      LogString.SaveToFile('c:\log_de_hora.txt');

      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      //---

      SetValoresArquivo;

      plPassos.Caption := 'Gravando resultado dos cálculos';
      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      //---

      iCD_VERSAO := setTabuaComutacao;
      If iCD_VERSAO > 0 then
         setOcorrenciasTabua(iCD_VERSAO);
      //---

      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;

      HoraFim := TimeToStr(Time);
      LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + 'Gravação do Banco');
      LogString.SaveToFile('c:\log_de_hora.txt');
      //---


      MessageDlg('Cálculo realizado com Sucesso.', mtInformation, [mbOk], 0);
      ModalResult := mrOk;
   Finally
      Screen.Cursor := crDefault;
      bbtnConfirmar.Enabled := True;
      QryFormulasRotina.Close;
      QryFormulasComSomatorio.Close;

      // liberar variáveis de cálculo
      variavelCalculo.Destroy;
      FreeAndNil(lstTabuas);
   End; //Try
end;

procedure TfrmOkCalculoTabuaServicoPensao.executaCalculoTabuaMasculina;
var i, j, iPENSAO, iFORMULA, ContaFormula: Integer;
    fResultado: Extended;
begin
   HoraIni := TimeToStr(Time);
   pbrTabServico2.Position := 0;
   pbrTabServico2.Max := iIDADE_MAXIMA;

   //Inicializa fórmulas na memória para otimizar o processo.
   setListaFormulas;

   //Executa Fórmulas que não possuem variável de Somatório.
   For i := iIDADE_MINIMA to iIDADE_MAXIMA do
   Begin
      For iPENSAO := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);
         QryFormulasRotina.First;

         //Loop das Fórmulas da Rotina selecionada.
         For iFORMULA := 1 to High(formulas) do
         Begin
            If formulas[iFORMULA].iCD_FORMULA <= 0 then
               Break;

            If i = iIDADE_MINIMA then
            Begin
               If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                 (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                 (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               End;

               If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  
                  pbrTabServico2.StepBy(1);
                  Application.ProcessMessages;
                  If Situacao = tsCancelado Then Exit;
                  

                  Continue;
               End;
            End; //if

            variavelCalculo.SetVarValue('x', i);
            variavelCalculo.SetVarValue('jx', iPENSAO);

            fResultado := ExecutaFormula(formulas[iFORMULA].sNO_VARIAVEL_INICIAL,
               formulas[iFORMULA].sNO_VARIAVEL_INICIAL2, formulas[iFORMULA].sNO_VARIAVEL_FINAL,
               formulas[iFORMULA].sNO_VARIAVEL_FINAL, formulas[iFORMULA].sDS_FORMULA);

            If formulas[iFORMULA].sIR_TABUA = 'S' then
            Begin
               setValorIdadePensao(iPENSAO,i , formulas[iFORMULA].sNO_VARIAVEL_RESULT, fResultado);
               setValorIdadePensao(iPENSAO,i , formulas[iFORMULA].sNO_VARIAVEL_RESULT, fResultado, True);
            End;

            
            If fResultado < 0 then
            Begin
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, idade pensão: %s, valor: %s',
                  [QuotedStr(formulas[iFORMULA].sNO_VARIAVEL_RESULT),
                   IntToStr(i), IntToStr(iPENSAO),
                   FormatFloaT('#,###,###,##0.000000000', fResultado)]));
            End;
            //---

            Application.ProcessMessages;
            If Situacao = tsCancelado Then Exit;
         End; //while
      End; //for

      
      pbrTabServico2.StepBy(1);
      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      

   End; //for

   //Executa Fórmulas com variável de Somatório.
   //Loop das Fórmulas da Rotina selecionada.

   //Inicializa fórmulas na memória para otimizar o processo.

   setListaformulasComSomatorio(qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger);

   //Verifica Quantas Formulas exixstem no formulasComSomatorio
   For iFORMULA := 1 to High(formulasComSomatorio) do
      If formulasComSomatorio[iFORMULA].sDS_FORMULA <> '' then Inc(ContaFormula);

   
   HoraIni := TimeToStr(Time);
   pbrTabServico2.Position := 0;
   pbrTabServico2.Max := ContaFormula * iIDADE_MAXIMA;

   plPassos.Caption := 'Realizando os cálculos (2/2)';
   Application.ProcessMessages;

   For iFORMULA := 1 to High(formulasComSomatorio) do
   Begin
      If formulasComSomatorio[iFORMULA].iCD_FORMULA <= 0 then
         Break;

      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         For iPENSAO := iIDADE_MINIMA to iIDADE_MAXIMA do
         Begin
            variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);

            If i = iIDADE_MINIMA then
            Begin
               If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               End;

               If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  
                  pbrTabServico2.StepBy(1);
                  Application.ProcessMessages;
                  If Situacao = tsCancelado Then Exit;
                  

                  Continue;
               End;
            End; //if

            variavelCalculo.SetVarValue('x', i);
            variavelCalculo.SetVarValue('jx', iPENSAO);

            fResultado := ExecutaFormula(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL,
               formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL2, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_FINAL,
               formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, formulasComSomatorio[iFORMULA].sDS_FORMULA);

            If formulasComSomatorio[iFORMULA].sIR_TABUA = 'S' then
            Begin
               setValorIdadePensao(iPENSAO,i , formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, fResultado);
               setValorIdadePensao(iPENSAO,i , formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, fResultado, True);
            End;

            
            If fResultado < 0 then
            Begin
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, idade pensão: %s, valor: %s',
                  [QuotedStr(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT),
                   IntToStr(i), IntToStr(iPENSAO),
                   FormatFloaT('#,###,###,##0.000000000', fResultado)]));
            End;
            //---

            Application.ProcessMessages;
            If Situacao = tsCancelado Then Exit;
         End; //for

         
         pbrTabServico2.StepBy(1);
         Application.ProcessMessages;
         If Situacao = tsCancelado Then Exit;
         

      End; //for
   End; //For
End;

procedure TfrmOkCalculoTabuaServicoPensao.executaCalculoTabuaFeminina;
var i, j, iPENSAO, iFORMULA: Integer;
    fResultado: Extended;
begin
   
   HoraIni := TimeToStr(Time);
   pbrTabServico2.Position := 0;
   pbrTabServico2.Max := iIDADE_MAXIMA;

   //Inicializa fórmulas na memória para otimizar o processo.
   setListaFormulas;

   //Executa Fórmulas que não possuem variável de Somatório.
   For i := iIDADE_MINIMA to iIDADE_MAXIMA do
   Begin
      For iPENSAO := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);
         QryFormulasRotina.First;

         //Loop das Fórmulas da Rotina selecionada.
         For iFORMULA := 1 to High(formulas) do
         Begin
            If formulas[iFORMULA].iCD_FORMULA <= 0 then
             Break;

            If i = iIDADE_MINIMA then
            Begin
               If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               End;

               If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  Continue;
               End;
            End; //if

            variavelCalculo.SetVarValue('x', i);
            variavelCalculo.SetVarValue('jx', iPENSAO);

            fResultado := ExecutaFormula(formulas[iFORMULA].sNO_VARIAVEL_INICIAL,
               formulas[iFORMULA].sNO_VARIAVEL_INICIAL2, formulas[iFORMULA].sNO_VARIAVEL_FINAL,
               formulas[iFORMULA].sNO_VARIAVEL_RESULT, formulas[iFORMULA].sDS_FORMULA);

            If formulas[iFORMULA].sIR_TABUA = 'S' then
              setValorIdadePensao(i, iPENSAO, formulas[iFORMULA].sNO_VARIAVEL_RESULT, fResultado, True);

            
            If fResultado < 0 then
            Begin
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, idade pensão: %s, valor pensão: %s',
                  [QuotedStr(formulas[iFORMULA].sNO_VARIAVEL_RESULT),
                  IntToStr(i), IntToStr(iPENSAO),
                  FormatFloaT('#,###,###,##0.000000000', fResultado)]));
            End;
            //---

            Application.ProcessMessages;
            If Situacao = tsCancelado Then Exit;
         End; //for
      End; //for

      
      pbrTabServico2.StepBy(1);
      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
      
   End; //for                     

   //Executa Fórmulas com variável de Somatório.
   //Loop das Fórmulas da Rotina selecionada.

   
   HoraIni := TimeToStr(Time);
   pbrTabServico2.Position := 0;
   pbrTabServico2.Max := (iIDADE_MAXIMA * High(formulasComSomatorio));

   //Inicializa fórmulas na memória para otimizar o processo.
   setListaformulasComSomatorio(qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger);
   For iFORMULA := 1 to High(formulasComSomatorio) do
   Begin
      If formulasComSomatorio[iFORMULA].iCD_FORMULA <= 0 then
      Begin
         Break;
         pbrTabServico2.StepBy(iIDADE_MAXIMA);
         Application.ProcessMessages;
         If Situacao = tsCancelado Then Exit;
      End;

      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         For iPENSAO := iIDADE_MINIMA to iIDADE_MAXIMA do
         Begin
            variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);

            If i = iIDADE_MINIMA then
            Begin
               If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               End;

               If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  Continue;
               End;
            End; //if


            variavelCalculo.SetVarValue('x', i);
            variavelCalculo.SetVarValue('jx', iPENSAO);

            fResultado := ExecutaFormula(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL,
               formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL2, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_FINAL,
               formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, formulasComSomatorio[iFORMULA].sDS_FORMULA);

            If formulasComSomatorio[iFORMULA].sIR_TABUA = 'S' then
              setValorIdadePensao(i, iPENSAO, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, fResultado, True);

            If fResultado < 0 then
            Begin
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, idade pensão: %s, valor pensão: %s',
                  [QuotedStr(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT),
                   IntToStr(i), IntToStr(iPENSAO),
                   FormatFloaT('#,###,###,##0.000000000', fResultado)]));
            End;

            Application.ProcessMessages;
            If Situacao = tsCancelado Then Exit;
         End; //for

         
         pbrTabServico2.StepBy(1);
         Application.ProcessMessages;
         If Situacao = tsCancelado Then Exit;
         

      End; //for

      Application.ProcessMessages;
      If Situacao = tsCancelado Then Exit;
   End; //for
End;

procedure TfrmOkCalculoTabuaServicoPensao.setValoresArquivo;
begin
end;

function TfrmOkCalculoTabuaServicoPensao.setTabuaComutacao: Integer;
begin
   With QryInsTabuaComutacao do
   Begin
      QryMaxVersao.Open;
      ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryMaxVersaoMAX_COD.asInteger + 1;
      QryMaxVersao.Close;

      ParamByName('CD_TABUA_ROTATIV').Clear;

      ParamByName('CD_TABUA_ENTRADA_INVALID').Clear;

      ParamByName('CD_TABUA_INVALID').Clear;

      ParamByName('CD_TABUA_MORTAL').Clear;

      If Trim(CMDBLkpCmbRotinaCalculoTabua.Text) <> '' then
         ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger
      Else
         ParamByName('CD_GRUPO_FORMULA').Clear;

      ParamByName('IR_VERSAO_COMUTACAO').asString := ClntDtStTabuaServicoIR_TIPO_TABUA_SERVICO.asString;
      ParamByName('DS_VERSAO_COMUTACAO').asString := EdtDescricao.Text;
      ParamByName('DT_GERACAO').asDateTime := Now;

      ParamByName('SQ_VERSAO_COMUTACAO_MASC').AsInteger := QryLkpTabuaMasculinaSQ_VERSAO_COMUTACAO.AsInteger;
      ParamByName('SQ_VERSAO_COMUTACAO_FEM').AsInteger  := QryLkpTabuaFemininaSQ_VERSAO_COMUTACAO.AsInteger;

      Try
         Result := ParamByName('SQ_VERSAO_COMUTACAO').asInteger;
         ExecSQL;
      Except
         Result := -1;
      End;
   end; //with
end;

procedure TfrmOkCalculoTabuaServicoPensao.setOcorrenciasTabua(iCD_VERSAO_TABUA: Integer);
var i, j, iPENSAO: Integer;
begin
   
   HoraIni := TimeToStr(Time);
   pbrTabServico2.Position := 0;
   pbrTabServico2.Max := iIDADE_MAXIMA * iIDADE_MAXIMA;

   With QryInsOcorTabuaComutacao do
   Begin
      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         ParamByName('NR_IDADE').asInteger := i;
         ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iCD_VERSAO_TABUA;

         For iPENSAO := iIDADE_MINIMA to High(Tabua_Servico[i]) do
         Begin
            For j := 1 to High(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL) do
            Begin
               ParamByName('NO_VARIAVEL').asString := Tabua_Servico[i][iPENSAO].sNO_VARIAVEL[j];
               ParamByName('VL_FATOR_COMUTACAO').asFloat := Tabua_Servico[i][iPENSAO].fVL_CALCULO[j];
               ParamByName('NR_IDADE_PENSAO').asInteger := iPENSAO;
               ParamByName('VL_FATOR_PENSAO').asFloat := Tabua_Servico[i][iPENSAO].fVL_PENSAO[j];

               Try
                  If ParamByName('VL_FATOR_PENSAO').asFloat <> 0 Then   
                     If Trim(ParamByName('NO_VARIAVEL').asString) <> '' then
                        ExecSQL;
               Except End;

               Application.ProcessMessages;
               If Situacao = tsCancelado Then Exit;
            End; //for

            
            pbrTabServico2.StepBy(1);
            Application.ProcessMessages;
            If Situacao = tsCancelado Then Exit;
            

         End; //for
      End; //for
   End; //with
End;

function TfrmOkCalculoTabuaServicoPensao.ExecutaFormula(sVAR_INICIAL, sVAR_INICIAL2, sVAR_FINAL, sVAR_RESULT, sFORMULA: String): Extended;
var i, iValorInicial, iValorFinal, iVALOR_INICIAL1, iVALOR_INICIAL2: Integer;
    bINDEXADA: Boolean;
begin
   Result := 0;

   bINDEXADA := (Trim(sVAR_INICIAL) <> '') and
        (Trim(sVAR_INICIAL2) <> '');
   If bINDEXADA then
   Begin
      iVALOR_INICIAL1 := variavelCalculo.GetVarValue(sVAR_INICIAL);
      iVALOR_INICIAL2 := variavelCalculo.GetVarValue(sVAR_INICIAL2);

      If iVALOR_INICIAL2 > iVALOR_INICIAL1 then
         iValorInicial := iVALOR_INICIAL2
      Else
         iValorInicial := iVALOR_INICIAL1;
   End
   //Verifica Parâmetros do Somatório.
   Else If sVAR_INICIAL = '' then
           iValorInicial := 0
        Else
           iValorInicial := variavelCalculo.GetVarValue(sVAR_INICIAL);

   If sVAR_FINAL = '' then
      iValorFinal := 0
   Else
      iValorFinal := variavelCalculo.GetVarValue(sVAR_FINAL);

   //Executa Somatório da Fórmula.
   If iValorInicial <= iValorFinal then
      For i := iValorInicial to iValorFinal do
      Begin
         //Atualiza Variável Indexada do Somatório.
         If sVAR_INICIAL <> '' then
         Begin
            If bINDEXADA then
            Begin
               variavelCalculo.SetVarValue(sVAR_INICIAL, iVALOR_INICIAL1);
               variavelCalculo.SetVarValue(sVAR_INICIAL2, iVALOR_INICIAL2);

               Inc(iVALOR_INICIAL1);
               Inc(iVALOR_INICIAL2);
            End
            Else
               variavelCalculo.SetVarValue(sVAR_INICIAL, i);

            variavelCalculo.SetVarValue(sVAR_RESULT, Result);
         End;
         //Executa Fórmula.
         Result := Result + CalculaExpressaoRecursiva(sFORMULA);
      End
      Else
         For i := iValorFinal to iValorInicial do
         Begin
            //Atualiza Variável Indexada do Somatório.
            If sVAR_INICIAL <> '' then
            Begin
               If bINDEXADA then
               Begin
                  variavelCalculo.SetVarValue(sVAR_INICIAL, iVALOR_INICIAL1);
                  variavelCalculo.SetVarValue(sVAR_INICIAL2, iVALOR_INICIAL2);

                  Dec(iVALOR_INICIAL1);
                  Dec(iVALOR_INICIAL2);
               End
               Else
                  variavelCalculo.SetVarValue(sVAR_INICIAL, i);

               variavelCalculo.SetVarValue(sVAR_RESULT, Result);
            End;

            //Executa Fórmula.
            Result := Result + CalculaExpressaoRecursiva(sFORMULA);
         End;

      //Atualiza Somatório na Variável de Resultado.
      variavelCalculo.SetVarValue(sVAR_RESULT, Result);
end;

function TfrmOkCalculoTabuaServicoPensao.CalculaExpressaoRecursiva(sCADEIA: String): Extended;
var Expressao: TExpresCalc;
    variavelIndexada: Variant;       // Variável Alias correspondente à Var. Original Ex: Var1;
    sVariavelIndexadaOrigem: String; // Variável indexada - Texto original ex: N_x[1+2];
    sIndice, sNOME_VARIAVEL: String;
    fValor, fResultadoIndice: Extended;
    
    lstINDICE: TStringList;
    fINDICE, fINDICE_PENSAO, fIDADE: Extended;
begin
   Try
      lstINDICE := TStringList.Create;

      Expressao := TExpresCalc.Create; // Cria instância de TExpressao
      Expressao.FVarCalcList := @variavelCalculo;

      If sCADEIA = '' Then
      Begin
         MessageDlg('Fórmula não informada. Verifique o cadastro de Fórmulas.', mtWarning, [mbOk], 0);
         Exit;
      End
      Else
      Begin
         // Estrutura e valida expressao - Primeira chamada
         If Expressao.Expressao_Valida(sCADEIA) Then
         Begin
            // W_VarIndexada = null, caso não existe variável indexada na fórmula
            Expressao.Prepara_Expressao(sCADEIA);

            variavelIndexada := Expressao.Variavel_Indexada;

            While variavelIndexada <> Null Do
            Begin
               // Recuperar a variável indexada original -> GetIndexedVar
               sVariavelIndexadaOrigem := Expressao.GetIndexedVar(variavelIndexada);

               // Recupera apenas o índice da variável indexada
               sIndice := copy(sVariavelIndexadaOrigem, pos('[', sVariavelIndexadaOrigem) + 1,
                  Length(sVariavelIndexadaOrigem) - (pos('[', sVariavelIndexadaOrigem) + 1));

               //Variável Indexada.
               If pos(':', sIndice) > 0 then
               Begin
                  ExtractStrings([':'], [' '], PChar(sIndice), lstINDICE);

                  // Calcula expressão da variável indexada recursivamente
                  fINDICE := CalculaExpressaoRecursiva(lstINDICE[0]);
                  fINDICE_PENSAO := CalculaExpressaoRecursiva(lstINDICE[1]);

                  // Recupera nome da variavel indexada
                  sNOME_VARIAVEL := copy(sVariavelIndexadaOrigem, 1, pos('[', sVariavelIndexadaOrigem) - 1);

                  // Recupera Valor na tabela de comutação
                  If pos('jx', lstINDICE[0]) > 0 then
                     fValor := valorComutacao(sNOME_VARIAVEL, Floor(fINDICE), Floor(fINDICE_PENSAO), (tipoTabua = tMasculina))
                  Else If pos('x', lstINDICE[0]) > 0 then
                          fValor := valorComutacao(sNOME_VARIAVEL, Floor(fINDICE), Floor(fINDICE_PENSAO), (not (tipoTabua = tMasculina)));

                  Expressao.SetIndexedVarValue(variavelIndexada, fValor);

                  // Verifica se existe outra variável indexada
                  variavelIndexada := Expressao.Variavel_Indexada;
               End
               Else
               Begin
               //---
                  // Calcula expressão da variável indexada recursivamente
                  fResultadoIndice := CalculaExpressaoRecursiva(sIndice);

                  // Recupera nome da variavel indexada
                  sNOME_VARIAVEL := copy(sVariavelIndexadaOrigem, 1, pos('[', sVariavelIndexadaOrigem) - 1);

                  // Recupera Valor na tabela de comutação
                  If pos('jx', sIndice) > 0 then
                     fValor := valorComutacao(sNOME_VARIAVEL, Floor(fResultadoIndice), -1, (not (tipoTabua = tMasculina)))
                  Else If pos('x', sIndice) > 0  then
                       Begin
                          fValor := valorComutacao(sNOME_VARIAVEL, Floor(fResultadoIndice), -1, (tipoTabua = tMasculina));
                       End;

                  Expressao.SetIndexedVarValue(variavelIndexada, fValor);

                  // Verifica se existe outra variável indexada
                  variavelIndexada := Expressao.Variavel_Indexada;
               End;
            End; //while

            // Calcula expressão final
            Result := Expressao.Calcula_Expressao;
         End //if
         Else
         Begin
            MessageDlg('Erro Fatal - Expressão com erro de sintaxe', mtError, [mbOk], 0);
            Exit;
         End; //else
      End; //else
   Finally
      FreeAndNil(lstINDICE);
      Expressao.Destroy;
   End;
end;

function TfrmOkCalculoTabuaServicoPensao.valorComutacao(sNOME_VARIAVEL: String; iIDADE: Integer;
  iIDADE_PENSAO: Integer = -1; bVL_PENSAO: Boolean = False): Extended;
begin
   If iIDADE_PENSAO = -1 then
   Begin
      If iIDADE < iIDADE_MINIMA then
        Result := getValorIdade(iIDADE_MINIMA, sNOME_VARIAVEL)
      Else If iIDADE > iIDADE_MAXIMA then
              Result := getValorIdade(iIDADE_MAXIMA, sNOME_VARIAVEL)
           Else
              Result := getValorIdade(iIDADE, sNOME_VARIAVEL, bVL_PENSAO);
   End
  //Pensão
   Else
   Begin
      If iIDADE < iIDADE_MINIMA then
         iIDADE := iIDADE_MINIMA
      Else If iIDADE > iIDADE_MAXIMA then
              iIDADE := iIDADE_MAXIMA;

      If iIDADE_PENSAO < iIDADE_MINIMA then
         iIDADE_PENSAO := iIDADE_MINIMA
      Else If iIDADE_PENSAO > iIDADE_MAXIMA then
              iIDADE_PENSAO := iIDADE_MAXIMA;

      Result := getValorIdadePensao(iIDADE, iIDADE_PENSAO, sNOME_VARIAVEL);
   End;
End;

procedure TfrmOkCalculoTabuaServicoPensao.bbtnCancelarClick(Sender: TObject);
begin
   If Application.MessageBox('Deseja cancelar o processamento?', 'Cálculo Atuarial', MB_ICONQUESTION +
       MB_YESNO) = IDYES then
      Situacao := tsCancelado;
end;

function TfrmOkCalculoTabuaServicoPensao.getFormulasComSomatorio: String;
var i: Integer;
begin
   Result := '0';
   For i := 0 to lstFormulasComSomatorio.Count - 1 do
      Result := Result + ', ' + lstFormulasComSomatorio.Strings[i];
end;

end.
