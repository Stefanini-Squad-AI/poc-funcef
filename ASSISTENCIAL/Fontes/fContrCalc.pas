unit fContrCalc;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 13/11/2007
// Pendência   : ---------
// Rotina      : qryVerifContrib
// Descricao   : Acerto na qryVerifContrib.
//------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 31/10/2007
// Pendência   : 26755
// Rotina      : qry
// Descricao   : Acerto na Qry. Foram retirados os joins com a BENEFASS.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 18/05/2007
// Pendência   : 25395
// Rotina      : qryParticipante
// Descricao   : Acerto na query com inclusão de NVL.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/02/2007
// Pendência   : 24354
// Rotina      : bbtnCalcularClick
// Descricao   : Acerto na variável do mês de referência.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 04/01/2007
// Pendência   : 24097
// Rotina      : CalculoContribuicoes
// Descricao   : Acerto na consideração de nº de opções válidas.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit,
  wwdblook, MskEdDlg, ComCtrls, Db, WwDatsrc, DBTables, WwQuery, URegra,
  Wwtable, Spin, OpenArqText, Menus, TB97, TB97Tlbr, checklst, Gauges,Math,
  IvDictio, IvMulti, IvEMulti, USincronismo, FSairAjuda;

type
  TfrmContrCalc = class(TfrmSairAjuda)
    qryPatro: TwwQuery;
    qryPlanoPrev: TwwQuery;
    qryPlanAss: TwwQuery;
    Label5: TLabel;
    qryRegraIn: TwwQuery;
    qryMotivo: TwwQuery;
    regra: TRegra;
    Label17: TLabel;
    qry: TwwQuery;
    SaveDlg: TSaveDialog;
    qryInsHst: TwwQuery;
    qrySituacao: TwwQuery;
    qryBuscaDataCob: TwwQuery;
    bbtnVoltar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    bbtnSalvar: TBitBtn;
    bbtnVerResultado: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label1: TLabel;
    cmbMes: TComboBox;
    SpeAno: TSpinEdit;
    EdtMesRef: TEdit;
    EdtAnoRef: TEdit;
    pnlResult: TPanel;
    memResult: TMemo;
    pnlOpcoes: TPanel;
    Label9: TLabel;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    qryParticipante: TwwQuery;
    qryParamAssist: TwwQuery;
    Panel1: TPanel;
    pctrop: TPageControl;
    TabSheetPatro: TTabSheet;
    chklstPatro: TCheckListBox;
    Marca: TBitBtn;
    TabSheetPlanoPrev: TTabSheet;
    chklstplanoprev: TCheckListBox;
    bbtnMarcaPlanPrev: TBitBtn;
    TabSheetPlanoAssist: TTabSheet;
    chklstPlanass: TCheckListBox;
    bBtnMarcaPlanass: TBitBtn;
    TabSheetPart: TTabSheet;
    chklstParticipante: TCheckListBox;
    BbtnMarcaPart: TBitBtn;
    pnlProgresso: TPanel;
    lblMsg2: TLabel;
    lContador: TLabel;
    anCalculo: TAnimate;
    btncancelaprogress: TBitBtn;
    bbtnPreparo: TBitBtn;
    bbtnDesfazer: TBitBtn;
    qryVerifContrib: TwwQuery;
    qryAux: TwwQuery;
    qryAtualizaPartass: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure SpeAnoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  DeletaHst: boolean;
    procedure bbtnCalcularClick(Sender: TObject);
    procedure MarcaClick(Sender: TObject);
    procedure bbtnMarcaPlanPrevClick(Sender: TObject);
    procedure bBtnMarcaPlanassClick(Sender: TObject);
    procedure BbtnMarcaPartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chklstPatroClick(Sender: TObject);
    procedure chklstplanoprevClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);

  private
    { Private declarations }
    bCancelaCalculo: Boolean;
    strPlanAss, strPlanoPrev, strPatro, strParticipante: string;
    procedure CriaLista(chkListX: TCheckListBox; qryLista: TwwQuery);
    procedure PreparaRestricoesQry;
    procedure VerificaContribAssoc;
    procedure ApresStatus(vS: string);
    function  GravaErro(TipoErro: word; MsgErro: Exception): Boolean;
    function  CalculoContribuicoes: Boolean;
    procedure VerificaMudanca(piIdpessoa, piIdplanass, piNumOpcao : Integer; psResultadoRegra : String);
  public
    { Public declarations }
    contador: Integer;
    bErro: Boolean;
    sAnoCobranca,
    sMesCobranca,
    sDataRef,
    AnoMesCobranca,
    AnoMesReferencia: string;
    iAnoCobranca, iMesCobranca: Integer;
    DataCobranca: string;
  end;

var frmContrCalc: TfrmContrCalc;

implementation

uses UMensErro, ULancContab, UAutorizacao, UAdmAss, DBaseDados, UDataBase, uFuncoesUteis,
  fAguarde;

{$R *.DFM}

const
  linhaSep = '-----------------------------------------------------';

procedure TfrmContrCalc.FormCreate(Sender: TObject);
begin
  inherited;
  qrySituacao.Prepare;
  qryPatro.Open;
  CriaLista(chklstPatro, qryPatro);
  qryPlanoPrev.Open;
  CriaLista(chklstplanoprev, qryplanoprev);
  qryPlanAss.Open;
  CriaLista(chklstPlanAss, qryPlanAss);
  qryParticipante.Open;
  CriaLista(chklstParticipante, qryParticipante);
  qryParamAssist.Open;
  (* Função da UAdmAss que preenche o combobox do Mês e o SpinEdit do Ano com o mês e ano corrente *)
  RetornaDataCorr(cmbMes, SpeAno);
  cmbMesChange(Sender);
  SpeAnoChange(Sender);
  pctrop.ActivePage:=TabSheetPatro;
end;

procedure TfrmContrCalc.cmbMesChange(Sender: TObject);
var sMes: string[3];
begin
  inherited;
  sMes := Copy(UpperCase(cmbMes.Text),1,3);

  (* Fundação que não adota o pré-pagamento de contribuições *)
  If Not qryParamAssist.Active then qryParamAssist.Open;
  If Not qryParamAssist.IsEmpty then
  begin
    If qryParamAssist.FieldByName('FlgPrePag').AsString<>'1' then
      EdtMesRef.Text:=Copy(sMes,1,1)+Copy(LowerCase(cmbMes.Text),2,Length(cmbMes.Text))
    else
    (* Se FlgPrePag='1' então Mês de Referência será o mês seguinte ao Mês de Cobrança *)
    begin
      EdtAnoRef.Text := IntToStr(SpeAno.Value);
      If sMes = 'JAN' then EdtMesRef.Text := 'Fevereiro'
      else if sMes = 'FEV' then EdtMesRef.Text := 'Março'
      else if sMes = 'MAR' then EdtMesRef.Text := 'Abril'
      else if sMes = 'ABR' then EdtMesRef.Text := 'Maio'
      else if sMes = 'MAI' then EdtMesRef.Text := 'Junho'
      else if sMes = 'JUN' then EdtMesRef.Text := 'Julho'
      else if sMes = 'JUL' then EdtMesRef.Text := 'Agosto'
      else if sMes = 'AGO' then EdtMesRef.Text := 'Setembro'
      else if sMes = 'SET' then EdtMesRef.Text := 'Outubro'
      else if sMes = 'OUT' then EdtMesRef.Text := 'Novembro'
      else if sMes = 'NOV' then EdtMesRef.Text := 'Dezembro'
      else if sMes = 'DEZ' then
      begin
        EdtMesRef.Text := 'Janeiro';
        EdtAnoRef.Text := IntToStr(SpeAno.Value + 1);
      end
      else
      begin
        MsgDlg('Mês de Referência Inválido!','Erro',mtError,[mbOK],0);
        Exit;
      end;
    end;
  end
  else
  begin
    MsgDlg('Parametro não encontrado!','Erro',mtError,[mbOK],0);
    Exit;
  end;
end;

procedure TfrmContrCalc.SpeAnoChange(Sender: TObject);
begin
  inherited;
  EdtAnoRef.Text := SpeAno.Text;
  cmbMesChange(Sender);
end;

function  TfrmContrCalc.CalculoContribuicoes: Boolean;
var sTotal, sSituacao, sPortadorForma: String;
    idPatro, iContador: Integer;
    iOpcoes : Integer;
    valorEsperado: double;
{Sub}
    Procedure RegistraErro(Ms:String;Fg:Char);
    begin
      bErro:=True;
      Case Fg Of
        '0': begin
               memResult.Lines.Add(linhaSep);
               memResult.Lines.Add('ASSISTENCIAL - LISTA DE ERROS DE CÁLCULO DE CONTRIBUIÇÕES');
               memResult.Lines.Add(Ms);
             end;
        '1': begin
               memResult.Lines.Add(Ms);
               memResult.Lines.Add(' Inscrição: '+ qry.FieldByName('INSCRICAONUMERO').AsString+'.');
               memResult.Lines.Add(' Titular  : '+ Trim(qry.FieldByName('TIT').AsString)+'.');
               memResult.Lines.Add(LinhaSep);
               qry.Next;
             end;
      end; {Case}
    end; {RegistraErro}

{Sub}
    Procedure CobrancaBoleto;
    begin
      qryInsHst.ParamByName('FLGCOBCARNE').Value := 1;
      If StrToIntDef(sPortadorForma,0)=0 then
        sPortadorForma:=qry.FieldByName('PORTFORMABOLETO').AsString;

      If StrToIntDef(sPortadorForma,0)=0 then
      begin
        bErro:=True;
        memResult.Lines.Add('==================================================');
        memResult.Lines.Add('Erro no portador forma de pagamento:');
        memResult.Lines.Add(' Inscrição: '+ qry.FieldByName('INSCRICAONUMERO').AsString +'.');
        memResult.Lines.Add(' Titular  : '+ Trim(qry.FieldByName('TIT').AsString)            +'.');
        memResult.Lines.Add('==================================================');
      end;
      qryInsHst.ParamByName('CODPORTFORMA').Value := StrToIntDef(sPortadorForma,0);
    end; {CobrancaBoleto}

begin
  ApresStatus('Calculando contribuições ...');
  Application.ProcessMessages;
  Result := False;
  (* Inicializa variáveis *)
  iContador     :=  0;
  valorEsperado :=  0;
  sTotal := ' / ' + IntToStr(qry.RecordCount);

  (* Habilita o botão para permitir o cancelamento da operação *)
  btncancelaprogress.Visible := True;
  btncancelaprogress.Enabled := True;
  If (btncancelaprogress.Visible) And (btncancelaprogress.Enabled) then
   btncancelaprogress.SetFocus;
  if bCancelaCalculo then Exit;

  (* Primeiro registro selecionado para o Cálculo *)
  qry.First;
  While not qry.EOF do
  begin
    (* Atualiza o label do Contador *)
    iContador := iContador + 1;
    lContador.Caption := IntToStr(iContador) + sTotal;
    If Not anCalculo.Active Then anCalculo.Active := True;
    pnlProgresso.Update;
    Application.ProcessMessages;

    if bCancelaCalculo then Exit;

//*** tavares
    idPatro := qry.FieldByName('IDPESSJUR').AsInteger;
    (* Sincronismo: Verificar se o envio do CCP para a patrocinadora já foi encerrado
       Se sim, dar a possibilidade de enviar para o próximo mês *)


    (* Verifica qual a situação do participante *)
    (* se for dependente e não tiver situação busca a situação do titular *)

    if qry.FieldByName('FLGINTERNO').AsString = '' then
    begin
      qrySituacao.Close;
      qrySituacao.ParamByName('IDPESSOA').AsInteger    := qry.FieldByName('IDTITULAR').AsInteger;
      qrySituacao.ParamByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
      qrySituacao.Open;
      sSituacao := qrySituacao.FieldByName('FLGINTERNO').AsString;
    end
    else sSituacao := qry.FieldByName('FLGINTERNO').AsString;

    try
     (* ==========================================================================
        função da unit UAdmAss que monta uma consulta em cima de uma query passada
        como parâmetro e retorna a Data de cobrança da Contribuição
        ========================================================================== *)
{diniz}
      DataCobranca := CriticaDataCobrancaAssist(qryBuscaDataCob,                         (* query usada para receber o SQL*)
                                                qry.FieldByName('IDPESSJUR').AsString,   (* Patrocinadora *)
                                                qry.FieldByName('IDPLANOPREV').AsString, (* Plano Previdenciário *)
                                                sSituacao,                               (* Situação do Participante*)
                                                qry.FieldByName('IDPLANASS').AsString,   (* Plano Assistencial *)
                                                'N',                                     (* Cobrança Normal *)
                                                sMesCobranca,                            (* Mês Cobrança *)
                                                sAnoCobranca)                            (* Ano Cobrança *);
{diniz}
    except
      on E:Exception do
        Result := GravaErro(1,E);
    end;(* try..except *)

    if bCancelaCalculo then Exit;

    if Trim(qry.FieldByName('IDREGRA').AsString) = '' then
    begin
      Result := GravaErro(4,Exception.Create('Regra de Cálculo não Cadastrada.'));
      qry.Next;
      Continue;
    end;(* if Trim *)

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT NUMOPCOES');
    qryAux.SQL.Add('FROM PLANASS');
    qryAux.SQL.Add('WHERE IDPLANASS = '+qry.FieldByName('IDPLANASS').AsString);
    qryAux.Open;

    iOpcoes := qryAux.FieldByName('NUMOPCOES').AsInteger;

    For iOpcoes := 1 to qryAux.FieldByName('NUMOPCOES').AsInteger do // Gleyber - 04/01/2007 - Pendência 24097
     Begin

       qryRegraIn.Close;
       qryRegraIn.ParamByName('NUMOPCAO').Value     := iOpcoes;
       qryRegraIn.ParamByName('IDTITULAR').Value    := qry.FieldByName('IDTITULAR').AsInteger;
       qryRegraIn.ParamByName('IDDEPENDENTE').Value := qry.FieldByName('IDDEPENDENTE').AsInteger;
       qryRegraIn.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
       qryRegraIn.ParamByName('IDPLANOPREV').Value  := qry.FieldByName('IDPLANOPREV').AsInteger;
       qryRegraIn.ParamByName('IDPLANASS').Value    := qry.FieldByName('IDPLANASS').AsInteger;
       qryRegrain.ParamByName('MESREF').Value       := AnoMesReferencia;
       qryRegrain.ParamByName('DATAREF').AsDate     := StrToDate(sDataRef);

       try
         qryRegraIn.Open;
       except
         on E:Exception do
           Result := GravaErro(2,E);
       end; {try..except}

       regra.RuleName := qry.FieldByName('IDREGRA').AsString;
       try
         regra.Execute;
       except
         on E:Exception do
         begin
           Result := GravaErro(5,E);
           qry.Next;
           Continue;
         end; {on}
       end; {try..except}

       If UpperCase(regra.Result) <> 'FALSE'
        Then Begin
             VerificaMudanca(qry.FieldByName('IDTITULAR').AsInteger,
                             qry.FieldByName('IDPLANASS').AsInteger,
                             iOpcoes,
                             regra.Result);
             Try
               valorEsperado := StrToFloat(ClienteNumero(regra.Result));
             Except
               On E:Exception do begin
                 Result := GravaErro(3,E);
                 bErro:=True;
                 qry.Next;
                 Continue;
               End;
             End;
        End;

     End;

    pnlProgresso.Update;
    Application.ProcessMessages;
    if bCancelaCalculo then Exit;

    If ValorEsperado = 0 then
    begin
      RegistraErro('Erro, valor do cálculo igual a zero:','0');
      RegistraErro(' Verifique Contribuição e situação do titular.','1');
      Continue;
    end;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4,');
    qryAux.SQL.Add('       VALORBASE5, VALORBASE6, VALORBASE7, VALORBASE8 ');
    qryAux.SQL.Add('FROM PARTASS');
    qryAux.SQL.Add('WHERE IDPESSOA  = '+qry.FieldByName('IDTITULAR').AsString);
    qryAux.SQL.Add('  AND IDPLANASS = '+qry.FieldByName('IDPLANASS').AsString);
    qryAux.Open;

    qryInsHst.ParamByName('MES').Value            := AnoMesReferencia;
    qryInsHst.ParamByName('MESCOBRANCA').Value    := AnoMesCobranca;
    qryInsHst.ParamByName('IDMOTIVO').Value       := prmIdMotivoCalcAs;
    qryInsHst.ParamByName('IDTITULAR').Value      := qry.FieldByName ('IDTITULAR').AsInteger;
    qryInsHst.ParamByName('IDDEPENDENTE').Value   := qry.FieldByName('IDDEPENDENTE').AsInteger;
    qryInsHst.ParamByName('IDPLANOPREV').Value    := qry.FieldByName ('IDPLANOPREV').AsInteger;
    qryInsHst.ParamByName('IDPLANASS').Value      := qry.FieldByName('IDPLANASS').AsInteger;
    qryInsHst.ParamByName('IDPESSJUR').Value      := idPatro;
    qryInsHst.ParamByName('IDCONTASS').Value      := qry.FieldByName('IDCONTASS').AsInteger;
    qryInsHst.ParamByName('VALORESPERADO').Value  := Arredonda(VALORESPERADO,2);
    qryInsHst.ParamByName('VALORRECEBIDO').Value  := 0;
    qryInsHst.ParamByName('IDPAGADOR').Value      := qry.FieldByName('IDPAGADOR').AsInteger;
    qryInsHst.ParamByName('IDREGRA').Value        := qry.FieldByName('IDREGRA').AsInteger;
    qryInsHst.ParamByName('SITRECEBIMENTO').Value := '0';
    qryInsHst.ParamByName('NUMRECEBIMENTO').AsInteger := LeUltRegistro(nil, 'HSTCONTRIBASS');
    qryInsHst.ParamByName('DATAPREVISAO').Value   := StrToDate(DataCobranca);

    qryInsHst.ParamByName('VALORBASE1').Value     := qryAux.FieldByName('VALORBASE1').AsFloat;
    qryInsHst.ParamByName('VALORBASE2').Value     := qryAux.FieldByName('VALORBASE2').AsFloat;
    qryInsHst.ParamByName('VALORBASE3').Value     := qryAux.FieldByName('VALORBASE3').AsFloat;
    qryInsHst.ParamByName('VALORBASE4').Value     := qryAux.FieldByName('VALORBASE4').AsFloat;
    qryInsHst.ParamByName('VALORBASE5').Value     := qryAux.FieldByName('VALORBASE5').AsFloat;
    qryInsHst.ParamByName('VALORBASE6').Value     := qryAux.FieldByName('VALORBASE6').AsFloat;
    qryInsHst.ParamByName('VALORBASE7').Value     := qryAux.FieldByName('VALORBASE7').AsFloat;
    qryInsHst.ParamByName('VALORBASE8').Value     := qryAux.FieldByName('VALORBASE8').AsFloat;
    (* "N" - Rubrica Normal *)
    qryInsHst.ParamByName('IDTIPO').Value         := 'N';
    (* -------------------- *)


    sPortadorForma := Trim(qry.FieldByName('CODPORTFORMA').AsString);

    If StrToIntDef(sPortadorForma,0)=0 then sPortadorForma:='';

    if sPortadorForma <> '' then
      qryInsHst.ParamByName('CODPORTFORMA').Value := StrToIntDef(sPortadorForma,0)
    else qryInsHst.ParamByName('CODPORTFORMA').Clear;
    {OBS: }
    {'MS' - DO SITPART, MANUTENÇÃO DE SALDO DE CONTA}
    {'CA' - DO SITPART, CANCELADO NA PATROCINADORA}
    { NÃO PASSA MAIS POR AQUI, CAI NA LISTA DE ERROS}

    qryInsHst.ParamByName('FLGCOBCARNE').AsInteger := qry.FieldByName('FLGCOBCARNE').AsInteger;
    If qry.FieldByName('FLGCOBCARNE').AsInteger = 1
     Then CobrancaBoleto
     Else qryInsHst.ParamByName('CODPORTFORMA').Clear;

    try
      qryInsHst.ExecSQL;
      contador := contador + 1;

    except
      on E:Exception do
        Result := GravaErro(6,E);
    end;

    pnlProgresso.Update;
    Application.ProcessMessages;
    if bCancelaCalculo then Exit;

    (* Próximo registro *)
    qry.next;
  end;(* while *)
  Result:=Not bErro;
end;

procedure TfrmContrCalc.PreparaRestricoesQry;
var i: integer;
    desmarcou: boolean;
begin
  strpatro        := '';
  strPlanAss      := '';
  strplanoprev    := '';
  strParticipante := '';
  (* Preenche patrocinadoras selecionadas *)
  desmarcou := False;
  for i := 0 to chklstPatro.Items.Count - 1 do begin
    if chklstPatro.checked[i] then begin
      (* Adicionar plano a string de planos *)
      if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey]) then
        strPatro := strPatro + qryPatro.FieldByName('IDPESSOA').AsString + ', ';
    end
    else desmarcou := True;
  end; {for}
  if Trim(strPatro) <> '' then
  begin
    if desmarcou then strPatro := Copy(strPatro, 1, Length(strPatro) - 2)
    else              strPatro := '';
  end;

  (* Preenche planos previdenciários *)
  desmarcou := False;
  for i := 0 to chklstPlanoPrev.Items.Count - 1 do
  begin
    if chklstPlanoPrev.checked[i] then
    begin
      (* Adicionar plano a string de planos *)
      if qryPlanoPrev.Locate('Nome',chklstPlanoPrev.Items[i],[loCaseInsensitive,loPartialKey]) then
        strPlanoPrev := strPlanoPrev + qryPlanoPrev.FieldByName('IDPLANOPREV').AsString + ', ';
    end
    else desmarcou := True;
  end; {for}

  if Trim(strplanoprev) <> '' then
  begin
    if desmarcou then strPlanoPrev := Copy(strPlanoPrev, 1, Length(strPlanoPrev) - 2)
    else              strPlanoPrev := '';
  end;

  (* Preenche planos assistenciais *)
  desmarcou := False;
  for i := 0 to chklstPlanAss.Items.Count - 1 do begin
    if chklstPlanAss.checked[i] then begin
      (* Adicionar plano a string de planos *)
      if qryPlanAss.Locate('Nome',chklstPlanAss.Items[i],[loCaseInsensitive,loPartialKey]) then
        strPlanAss := strPlanAss + qryPlanAss.FieldByName('IDPLANASS').AsString+ ', ';
    end
    else desmarcou := True;
  end; {for}
  if Trim(strPlanAss) <> '' then
  begin
    if desmarcou then strPlanAss := Copy(strPlanAss, 1, Length(strPlanAss) - 2)
    else              strPlanAss := '';
  end;

  (* Preenche participantes *)
  desmarcou := False;
  for i := 0 to chklstParticipante.Items.Count - 1 do begin
    if chklstParticipante.checked[i] then begin
      (* Adicionar plano a string de planos *)
      if qryParticipante.Locate('Nome',chklstParticipante.Items[i],[loCaseInsensitive,loPartialKey]) then
        strParticipante := strParticipante + qryParticipante.FieldByName('IDPESSOA').AsString+ ', ';
    end
    else begin
      desmarcou := True;
    end;
  end; {for}
  if Trim(strParticipante) <> '' then
  begin
    if desmarcou then strParticipante := Copy(strParticipante, 1, Length(strParticipante) - 2)
    else              strParticipante := '';
  end;
end;

function TfrmContrCalc.DeletaHst: boolean;
var sSql: string;
begin
  ApresStatus('Excluindo contribuições geradas anteriormente ...');
  Application.ProcessMessages;
  Result := False;
  sSql := ' DELETE'         +
              '  HSTCONTRIBASS' +
          ' WHERE'+
              (* FILTRO DO MÊS DE COBRANÇA *)
              '  (MESCOBRANCA = ' +chr(39)+ AnoMesCobranca   +chr(39)+ ') AND' +
              (* FILTRO DO MÊS DE REFERÊNCIA *)
              '  (MES         = ' +chr(39)+ AnoMesReferencia +chr(39)+ ') AND' +
              (* FILTRO DO MOTIVO *)
              '  (IDMOTIVO    = ' + IntToStr(prmIdMotivoCalcAs) + ') AND' +
              (* FILTRO DA SITUAÇÃO DO RECEBIMENTO - 0 = CALCULADO E NÃO ENVIADO *)
              '  ((SITRECEBIMENTO = 0) OR (SITRECEBIMENTO IS NULL))';
   (* FILTRO DO PLANO PREVIDENCIARIO *)
   if Trim(strPlanoPrev) <> '' then
     sSql := sSql + ' AND (IDPLANOPREV IN (' +strPlanoPrev+ '))';
   (* FILTRO DO PLANO ASSISTENCIAL *)
   if Trim(strPlanAss) <> '' then
     sSql := sSql + ' AND (IDPLANASS   IN (' +strPlanAss+ '))';
   (* FILTRO DA PATROCINADORA *)
   if Trim(strpatro) <> '' then
     sSql := sSql + ' AND (IDPESSJUR   IN (' +strPatro+ '))';
   (* FILTRO DO PARTICIPANTE *)
   if Trim(strParticipante) <> '' then
     sSql := sSql + ' AND (IDTITULAR   IN (' +strParticipante+ '))';
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.ExecSQL;
  except
    Result := True;
  end; {try..except}
end;

procedure TfrmContrCalc.CriaLista(chkListX: TCheckListBox; qryLista: TwwQuery);
begin
  chkListX.Items.Clear;
  while not qryLista.EOF do
  begin
    chkListX.Items.Add(qryLista.FieldByName('NOME').AsString);
    qryLista.Next;
  end; {while}
end;

procedure TfrmContrCalc.btncancelaprogressClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if MsgDlg('Confirma o cancelamento?', 'Atenção', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
  begin
    bCancelaCalculo      := True;
    pnlopcoes.Enabled    := True;
    bbtnPreparo.Enabled  := True;
    pnlProgresso.Visible := False;
    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
  end; {if MsgDlg}
end;

procedure TfrmContrCalc.bbtnVerResultadoClick(Sender: TObject);
begin
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
  bbtnPreparo.Enabled     := False;
  bbtnVerResultado.Enabled:= False;
  bbtnSalvar.Enabled      := True;
  bbtnVoltar.Enabled      := True;
end;

procedure TfrmContrCalc.bbtnVoltarClick(Sender: TObject);
begin
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnPreparo.Enabled    := True;
  bbtnVerResultado.Enabled:= True;
  bbtnSalvar.Enabled      := False;
  bbtnVoltar.Enabled      := False;
end;

procedure TfrmContrCalc.bbtnSalvarClick(Sender: TObject);
begin
  (* salva o conteúdo do memo em um arquivo *)
  if SaveDlg.Execute then memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmContrCalc.ApresStatus(vS: string);
begin
  lblMsg2.Caption := vS;
  Application.ProcessMessages;
end;

function TfrmContrCalc.GravaErro(TipoErro: word; MsgErro: Exception): Boolean;
var MostraParticipante : boolean;
begin
  MostraParticipante := True;
  bErro:=True;
  memResult.Lines.Add(linhaSep);
  memResult.Lines.Add('Patrocinadora: '           + qry.FieldByName('PESSJUR').AsString);
  memResult.Lines.Add(' - Plano Previdenciário: ' + qry.FieldByName('PLANPREV').AsString);
  memResult.Lines.Add(' - Plano Assistencial: '   + qry.FieldByName('PLANASS').AsString);
  memResult.Lines.Add(' - Contribuição: '         + qry.FieldByName('CONTRIBUICAO').AsString);
  Case TipoErro of
    0: begin
         memResult.Lines.Add('      Erro na consulta das contribuições a serem cobradas.');
         MostraParticipante := False;
       end; (* Erro tipo 0 *)
    1: begin
         memResult.Lines.Add('      Erro no cálculo da data de cobrança da contribuição.');
         MostraParticipante := False;
       end; (* Erro tipo 1 *)
    2: begin
         memResult.Lines.Add('      Erro na consulta de entrada para regra de cálculo.');
       end; (* Erro tipo 2 *)
    3: begin
         memResult.Lines.Add('      Valor do resultado da regra inválido -> ['+regra.result+'].');
       end; (* Erro tipo 3 *)
    4: begin
         memResult.Lines.Add('      Regra de Cálculo não Cadastrada.');
       end; (* Erro tipo 4 *)
    5: begin
         memResult.Lines.Add('      Erro na execução regra de cálculo.');
       end; (* Erro tipo 5 *)
    6: begin
         memResult.Lines.Add('      Erro na inserção no histórico de Contribuições Assistenciais.');
       end; (* Erro tipo 6 *)
  end;
  If MostraParticipante then
  begin
    memResult.Lines.Add('      Inscrição: '  +      qry.FieldByName('INSCRICAONUMERO').AsString +'.');
    memResult.Lines.Add('      Titular: '    + Trim(qry.FieldByName('TIT').AsString)            +'.');
    memResult.Lines.Add('      Dependente: ' + Trim(qry.FieldByName('PART').AsString)           +'.');
  end; {if MostraParticipante}
  If Copy(MsgErro.Message,1,13)='Key violation' then
   memResult.Lines.Add('ERRO: CHAVE JÁ EXISTE.')
  else memResult.Lines.Add('ERRO: '+ MsgErro.Message);
  memResult.Lines.Add('');
  Result := True;
end;

procedure TfrmContrCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryPlanAss.Close;
  qryPlanoPrev.Close;
  qryPatro.Close;
  qryParticipante.Close;
  qryParamAssist.Close;
  qryMotivo.Close;
  inherited;
  Action := caFree;
end;

procedure TfrmContrCalc.bbtnCalcularClick(Sender: TObject);
var sSql,sDataEntrada: string;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  (* Inicializa Variáveis *)
  bErro               := False;
  bCancelaCalculo     := False;
  bbtnPreparo.Enabled := False;
  lContador.Caption   := '';
  contador            := 0;

  (* Verificar se o Parametro de Motivo default está preenchido *)
  if (prmIdMotivoCalcAs <= 0) then
  begin
    MsgDlg('O Motivo[default] para Cobrança de Contribuições Assistenciais deverá ser preenchido. Utilize a tela de Parâmetros do Sistema.',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  If Not AnoValido(SpeAno.Text,'Ano de Cobrança Inválido!') then Exit;
  If Not MesValido(RetornaMes(cmbMes.Text),'Mês de Cobrança Inválido!') then Exit;

  (* ============================================================================
     Como o Serpros trabalha com o Pré-pagamento significa que quando o usuário
     escolhe fazer o cálculo,
     o mês escolhido será gravado na HSTCONTRIBASS como MESCOBRANCA e
     o mês de referência será o próximo mês e será gravado no campo MES.
     ============================================================================ *)
  (* Inicializa as variáveis com o Mês de Cobrança e Referência *)
  AnoMesCobranca   := RetornaMesAno(cmbMes.Text,    SpeAno.Value );
  AnoMesReferencia := RetornaMesAno(EdtMesRef.Text, StrToIntDef(EdtAnoRef.Text,0));

  If cmbMes.ItemIndex < 8
   Then sDataRef   := '01/0'+intToStr(cmbMes.ItemIndex+1)+ '/' + EdtAnoRef.Text // Gleyber - 02/02/2007 - Pendência 24354
   Else sDataRef   := '01/'+intToStr(cmbMes.ItemIndex+1)+ '/' + EdtAnoRef.Text; // Gleyber - 02/02/2007 - Pendência 24354

  (* Fundação que não adota o pré-pagamento de contribuições *)
  If Not qryParamAssist.Active then qryParamAssist.Open;
  If Not qryParamAssist.IsEmpty then
  begin
    If qryParamAssist.FieldByName('FlgPrePag').AsString<>'1' then
    begin
      iAnoCobranca := SpeAno.Value;
      sAnoCobranca := IntToStr(iAnoCobranca);
      iMesCobranca := StrToIntDef(RetornaMes(cmbMes.Text),0);
      sMesCobranca := RetornaMes(EdtMesRef.Text);
    end
    else
    begin
      (* Se FlgPrePag='1' - Fundação adota pré-pagamento de contribuições. *)
      (* Verifica se o mês escolhido pelo usuário é Dezembro pois o próximo mês
         será Janeiro do ano Seguinte *)
      if RetornaMes(cmbMes.Text) = '12' then
      begin
        iAnoCobranca := SpeAno.Value + 1;
        sAnoCobranca := IntToStr(iAnoCobranca);
        iMesCobranca :=   1 ; (* 1 - Janeiro *)
        sMesCobranca := '01'; (* 1 - Janeiro *)
      end
      else
      begin
        iAnoCobranca := SpeAno.Value;
        sAnoCobranca := IntToStr(iAnoCobranca);
        iMesCobranca := StrToIntDef(RetornaMes(cmbMes.Text),0) + 1;
        sMesCobranca := RetornaMes(EdtMesRef.Text);
      end; {if Dezembro}
    end; {FlgPrePag<>'1'}
  end
  else
  begin
    MsgDlg('Parametro não encontrado!','Erro',mtError,[mbOK],0);
    Exit;
  end;
   (* O cálculo deve selecionar todos os participantes que tem data de entrada
      até o último dia do mês de referência, isto é, o mês seguinte ao escolhido
      pelo usuário para a realização do cálculo.
      Somando 1 a função UltDiaMes teremos o Primeiro dia do mês seguinte ao mês
      de referência  *)
  sDataEntrada := DateToStr(UltDiaMes(iAnoCobranca,iMesCobranca) + 1);
  (* Verifica se existe algum participante que esteja cancelado no Previdenciário
      que ainda não foi cancelado no Assistencial *)

  (* Preenche os CheckListBox - prepara restrições do usuário *)
  PreparaRestricoesQry;

  If Not SincronPrevAss(true, strParticipante, strPatro, strPlanoPrev)
   Then Begin
    MsgDlg('Erro na operação de sincronização!! Operação de preparo cancelada!!','Erro',mtError,[mbOK],0);
    Exit;
   End;

  frmAguarde.Mostra('Processando...');
  Application.ProcessMessages;

  memResult.Lines.Clear;
  memResult.Lines.Add('Cálculo de Cobrança Assistencial - DATA: '+DateToStr(Date)+'  Lista de Exceções ');
  memResult.Lines.Add('Mês de Cobrança  : '+ AnoMesCobranca );
  memResult.Lines.Add('Mês de Referência: '+ AnoMesReferencia );
  memResult.Lines.Add(linhaSep);

  if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;

  frmAguarde.Apaga;
  frmAguarde.Mostra('Verificando contribuições já geradas ...');
  Application.ProcessMessages;



  sSql := ' SELECT IDTITULAR   ' +
          ' FROM HSTCONTRIBASS ' +
          ' WHERE (MESCOBRANCA = ' +chr(39)+ AnoMesCobranca   +chr(39)+ ') AND' +
          '  (MES         = ' +chr(39)+ AnoMesReferencia +chr(39)+ ') AND' +
          '  (IDMOTIVO    = ' + IntToStr(prmIdMotivoCalcAs) + ') AND' +
          '  ((SITRECEBIMENTO = 0) OR (SITRECEBIMENTO IS NULL)) AND' +
          '  (ROWNUM < 2)';

  if Trim(strPlanoPrev) <> '' then
    sSql := sSql + ' AND (IDPLANOPREV IN (' +strPlanoPrev+ '))';

  if Trim(strPlanAss) <> '' then
    sSql := sSql + ' AND (IDPLANASS   IN (' +strPlanAss+ '))';

  if Trim(strpatro) <> '' then
    sSql := sSql + ' AND (IDPESSJUR   IN (' +strPatro+ '))';

  if Trim(strParticipante) <> '' then
    sSql := sSql + ' AND (IDTITULAR   IN (' +strParticipante+ '))';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    frmAguarde.Apaga;
    MsgDlg('Erro no acesso ao Banco de Dados.','Erro',mtError,[mbOk],0);
    Exit;
  end; {try..except}

  if not qry.IsEmpty then
  begin
    frmAguarde.Apaga;
    if MsgDlg('Algumas Contribuições deste mês de Cobrança já foram geradas e ainda não enviadas. Deseja refazer ?',
             'Assistencial',mtconfirmation ,[mbyes,mbabort],0) = mrYes then
    begin
      (* Usuário confirmou o desejo de refazer o Cálculo
         Serão deletados da HSTCONTRIBASS as contribuições não enviadas *)
      if DeletaHst() then bErro := True (* erro na exclusão dos registros *)
    end
    else
    begin
      (* Usuário NÃO deseja refazer o Cálculo, será abortada a operação *)
      btncancelaprogressClick(Self);
      Exit;
    end; {else if MsgDlg}
  end; {if qry.IsEmpty}

  sSql := 'SELECT SI.FLGINTERNO,      PP.INSCRICAONUMERO,     CO.IDTITULAR, '+#13+#10+ //Hugo Luna - 31/10/2007
          '       CO.IDDEPENDENTE,    CO.IDPLANASS,           CO.IDPESSJUR, '+#13+#10+ //Hugo Luna - 31/10/2007
          '       CO.IDPLANOPREV,     CO.IDCONTASS,           CO.IDPAGADOR, '+#13+#10+
          '       CO.CODPORTFORMA,    NVL(CO.FLGCOBCARNE, CT.FLGCOBCARNE) FLGCOBCARNE, '+#13+#10+
          '       NVL(CO.CODPORTFORMA, CT.CODPORTFORMA) AS PORTFORMABOLETO, '+#13+#10+
          '       CT.IDREGRA,         CT.PAGADOR,             CB.NOME CONTRIBUICAO, '+#13+#10+
          '       PV.NOME PLANPREV,   PL.NOME PLANASS,        PD.NOME PART, '+#13+#10+
          '       PJ.NOME PESSJUR,    PT.NOME TIT '+#13+#10+
          'FROM PARTASS      PA, '+#13+#10+
          '     PLANASS      PL, '+#13+#10+
          '     PARTPREVPLAN PP, '+#13+#10+
          //'     BENEFASS     BE, '+#13+#10+  //Hugo Luna - 31/10/2007
          '     CONTASS      CO, '+#13+#10+
          '     PESSOA       PT, '+#13+#10+
          '     PESSOA       PD, '+#13+#10+
          '     PESSOA       PJ, '+#13+#10+
          '     CONTRIBASS   CT, '+#13+#10+
          '     SITPART      SI, '+#13+#10+
          '     CONTRIBUICAO CB, '+#13+#10+
          '     PLANPREV     PV  '+#13+#10+
          'WHERE (PA.IDPESSOA                = CO.IDTITULAR) '+#13+#10+ //Hugo Luna - 31/10/2007
          '  AND (PA.IDPESSJUR               = CO.IDPESSJUR) '+#13+#10+ //Hugo Luna - 31/10/2007
          '  AND (PA.IDPLANASS               = CO.IDPLANASS) '+#13+#10+ //Hugo Luna - 31/10/2007
          '  AND (NVL(PA.FLGINSCRICAOCANC,0) = 0) '+#13+#10+
          '  AND (PL.IDPLANASS               = PA.IDPLANASS) '+#13+#10+
          '  AND (PP.IDPESSJUR               = PA.IDPESSJUR) '+#13+#10+
          '  AND (PP.IDPLANOPREV             = PA.IDPLANOPREV) '+#13+#10+
          '  AND (PP.IDPESSOA                = PA.IDPESSOA) '+#13+#10+
          '  AND (PP.SEQPROPOSTA             = PA.SEQPROPOSTA) '+#13+#10+
          '  AND (PP.FLGDESATIVADO           = 0) '+#13+#10+
          '  AND (SI.IDSITPART               = PP.IDSITPART) '+#13+#10+
          '  AND (PV.IDPLANOPREV             = PP.IDPLANOPREV) '+#13+#10+
          '  AND (CO.IDTITULAR               = PA.IDPESSOA) '+#13+#10+ //Hugo Luna - 31/10/2007
          '  AND (CO.IDPLANASS               = PA.IDPLANASS) '+#13+#10+ //Hugo Luna - 31/10/2007
          //'  AND (BE.IDDEPENDENTE            = BE.IDDEPENDENTE) '+#13+#10+  //Hugo Luna - 31/10/2007
          //'  AND (BE.FLGATIVO                = 1) '+#13+#10+  //Hugo Luna - 31/10/2007
          '  AND (PT.IDPESSOA                = PA.IDPESSOA) '+#13+#10+
          '  AND (PD.IDPESSOA                = CO.IDDEPENDENTE) '+#13+#10+ //Hugo Luna - 31/10/2007
          '  AND (PJ.IDPESSOA                = PA.IDPESSJUR) '+#13+#10+
          '  AND (CO.IDPLANASS               = PA.IDPLANASS) '+#13+#10+
          '  AND (CO.IDTITULAR               = PA.IDPESSOA) '+#13+#10+
          //'  AND (CO.IDDEPENDENTE            = BE.IDDEPENDENTE) '+#13+#10+  //Hugo Luna - 31/10/2007
          '  AND (CO.IDCONTASS               = CB.IDCONTRIBUICAO) '+#13+#10+
          '  AND (NVL(CO.FLGATIVO,0)         = 1) '+#13+#10+
          '  AND (CT.IDPLANASS               = CO.IDPLANASS) '+#13+#10+
          '  AND (CT.IDCONTASS               = CO.IDCONTASS) '+#13+#10;


  (* FILTRO DA DATA DE INSCRIÇÃO NO PLANO ASSISTENCIAL *)
//  sSql := sSql + ' AND (BE.DATAENTRADA < TO_DATE(' +chr(39)+ sDataEntrada + chr(39) + ',' + chr(39) + 'DD/MM/YYYY' + chr(39) + '))';

  (* adiciona restrições escolhidas pelo usuário
     Filtro do Plano Previdenciário *)
  if Trim(strplanoprev) <> '' then
   sSql := sSql + ' AND (PP.IDPLANOPREV IN (' +strPlanoPrev+ '))';
  (* Filtro dos Planos Assistenciais *)
  if Trim(strPlanAss)   <> '' then
    sSql := sSql + ' AND (PA.IDPLANASS   IN (' +strPlanAss+ '))';
  (* Filtro das Patrocinadoras *)
  if Trim(strpatro)     <> '' then
    sSql := sSql + ' AND (PA.IDPESSJUR   IN (' +strPatro+ '))';
   (* Filtro do Participante *)
  if Trim(strParticipante) <> '' then
    sSql := sSql + ' AND (PA.IDPESSOA   IN (' +strParticipante+ '))';
  (* Ordenação *)
  sSql := sSql + '  ORDER BY CO.IDPESSJUR, CO.IDPLANOPREV, CO.IDPLANASS, PT.NOME, PD.NOME'; //Hugo Luna - 31/10/2007

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);


  (* NÃO houve o erro até esta linha - INÍCIO do cálculo *)
  if not bErro then
  begin
    frmAguarde.Apaga;
    frmAguarde.Mostra('Buscando informações para cálculo das contribuições ...');
    Application.ProcessMessages;
    try
      qry.Open;
      if qry.IsEmpty then
      begin
        frmAguarde.Apaga;
        MsgDlg('Não existem contribuições a calcular.', 'Assistencial', mtconfirmation ,[mbOK],0);
        btnCancelaProgressClick(self);
        Exit;
      end; {IsEmpty}
    except
      on E:Exception do GravaErro(0,E);
    end; {try..except}
  end; {if not bErro}

  pnlProgresso.Visible := True;
  pnlProgresso.BringToFront;

  // Executa segunda rotina de sincronização para verificar

  frmAguarde.Apaga;
  frmAguarde.Mostra('Verificando alterações na situação do participante na fundação...');
  VerificaContribAssoc;

  frmAguarde.Apaga;
  If bErro
   Then Begin
    pnlProgresso.Visible := False;
    pnlProgresso.SendToBack;
    If MsgDlg('Houve erros ao associar novas contribuições para participantes que tenham'+#13+#10+
              'mudado de situação no plano previdenciário. Deseja cancelar o preparo?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrYes
     Then Begin
       bbtnVerResultadoClick(Self);
       dtmBaseDados.dbBaseDados.Rollback;
       Exit;
     End;
   End;

  pnlProgresso.Visible := True;
  pnlProgresso.BringToFront;

  (* =============================== *)
  (* CÁLCULO NORMAL de CONTRIBUIÇÕES *)
  (* =============================== *)

  frmAguarde.Apaga;

  bErro := Not CalculoContribuicoes;

  (* Término do Cálculo *)
  anCalculo.Active := False;
  pnlProgresso.Visible := False;
  pnlProgresso.SendToBack;
  pnlopcoes.Enabled    := True;
  bbtnPreparo.Enabled  := True;

  if not bCancelaCalculo then
  begin
    if bErro then
    begin
      (* Houve erros no Cálculo *)
       bbtnVoltar.Enabled := True;
       pnlOpcoes.SendToBack;
       pnlResult.BringToFront;
       If MsgDlg('HOUVE ERRO NO CÁLCULO, '+#13+
                 'DESEJA SALVAR LISTA DE ERROS?','Erro', mtConfirmation, [mbYes,mbNo,mbHelp], 0)=mrYes then
        If SaveDlg.Execute then memResult.Lines.SaveToFile(SaveDlg.FileName);

       if MsgDlg('Cálculo de Cobranças efetuado com erros. Deseja efetivar as cobranças que '+
                  'obtiveram sucesso ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
         (* DESFAZ TODO o processo *)
         dtmBaseDados.dbBaseDados.RollBack
            (* COMMIT *)
       else dtmBaseDados.dbBaseDados.Commit;
    end
    else
    begin
      (* NÃO Houve erros no Cálculo *)
      if contador = 0 then
      begin
        MsgDlg('Nenhum processo foi realizado.','Informação',mtInformation,[mbok],0);
        dtmBaseDados.dbBaseDados.Rollback;
      end
      Else Begin
        If MsgDlg('Cálculo de cobranças concluída com sucesso!'+#13+#10+
                  'Confirma a operação realizada?',
               'Validação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
         Then Begin
           dtmBaseDados.dbBaseDados.Commit;
           MsgDlg('Operação CONFIRMADA!!',
                  'Aviso', mtInformation, [mbOk], 0);
         End
         Else Begin
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Operação CANCELADA!!',
                  'Aviso', mtInformation, [mbOk], 0);
         End;
         bbtnVerResultadoClick(Self);
      End;

    end; {if bErro}
  end; {if not bCancelaCalculo}
  If dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmContrCalc.MarcaClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chkLstPatro.Items.Count - 1 do
    chkLstPatro.Checked[i] := not chkLstPatro.Checked[i];
end;

procedure TfrmContrCalc.bbtnMarcaPlanPrevClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chklstplanoprev.Items.Count - 1 do
    chklstplanoprev.Checked[i] := not chklstplanoprev.Checked[i];
end;

procedure TfrmContrCalc.bBtnMarcaPlanassClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chklstPlanass.Items.Count - 1 do
    chklstPlanass.Checked[i] := not chklstPlanass.Checked[i];
end;


procedure TfrmContrCalc.BbtnMarcaPartClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chklstParticipante.Items.Count - 1 do
    chklstParticipante.Checked[i] := not chklstParticipante.Checked[i];
end;


procedure TfrmContrCalc.FormShow(Sender: TObject);
begin
  inherited;
  TabSheetPatro.TabVisible       := True;
  TabSheetPlanoPrev.TabVisible   := False;
  TabSheetPlanoAssist.TabVisible := False;
  TabSheetPart.TabVisible        := False;
end;

procedure TfrmContrCalc.chklstPatroClick(Sender: TObject);
Var
 iQuant : Integer;
begin
  inherited;
  For iQuant := 0 to chklstPatro.Items.Count-1 do
   Begin
     If chklstPatro.Checked[iQuant]
      Then Begin
        TabSheetPlanoPrev.TabVisible   := True;
        TabSheetPlanoAssist.TabVisible := True;
        Exit;
      End;
   End;
end;

procedure TfrmContrCalc.chklstplanoprevClick(Sender: TObject);
Var
 sSqlFiltro,
 sSqlFiltro1,
 sSqlFiltro2,
 sSqlFiltro3 : String;
 iQuant      : Integer;
begin
  inherited;

  // Inicialização das variáveis
  sSqlFiltro  := '';
  sSqlFiltro1 := '';
  sSqlFiltro2 := '';
  sSqlFiltro3 := '';

  For iQuant := 0 to chklstplanoprev.Items.Count-1 do
   Begin
     If chklstplanoprev.Checked[iQuant]
      Then Begin
        If qryPlanoPrev.Locate('NOME',chklstplanoprev.Items[iQuant],[loPartialKey])
         Then sSqlFiltro1 := sSqlFiltro1 + '(IDPLANOPREV = ' + qryPlanoPrev.FieldByName('IDPLANOPREV').AsString + ') OR ';
      End;
   End;

  For iQuant := 0 to chklstPlanass.Items.Count-1 do
   Begin
     If chklstPlanass.Checked[iQuant]
      Then Begin
        If qryPlanAss.Locate('NOME',chklstPlanass.Items[iQuant],[loPartialKey])
         Then sSqlFiltro2 := sSqlFiltro2 + '(IDPLANASS = ' + qryPlanAss.FieldByName('IDPLANASS').AsString + ') OR ';
      End;
   End;

  For iQuant := 0 to chklstPatro.Items.Count-1 do
   Begin
     If chklstPatro.Checked[iQuant]
      Then Begin
        If qryPatro.Locate('NOME',chklstPatro.Items[iQuant],[loPartialKey])
         Then sSqlFiltro3 := sSqlFiltro3 + '(IDPESSJUR = ' + qryPatro.FieldByName('IDPESSOA').AsString + ') OR ';
      End;
   End;

  If (Trim(sSqlFiltro1) = '') And (Trim(sSqlFiltro2) = '') And (Trim(sSqlFiltro3) = '')
   Then Exit;

  If Trim(sSqlFiltro1) <> ''
   Then sSqlFiltro1 := Copy(sSqlFiltro1, 1, Length(sSqlFiltro1)-3);

  If Trim(sSqlFiltro2) <> ''
   Then sSqlFiltro2 := Copy(sSqlFiltro2, 1, Length(sSqlFiltro2)-3);

  If Trim(sSqlFiltro3) <> ''
   Then sSqlFiltro3 := Copy(sSqlFiltro3, 1, Length(sSqlFiltro3)-3);

  If Trim(sSqlFiltro1) <> ''
   Then sSqlFiltro := '('+sSqlFiltro1+')';

  If Trim(sSqlFiltro2) <> ''
   Then Begin
     If Trim(sSqlFiltro) <> ''
      Then sSqlFiltro := sSqlFiltro + ' AND ';

     sSqlFiltro := sSqlFiltro + '('+sSqlFiltro2+')';
   End;

  If Trim(sSqlFiltro3) <> ''
   Then Begin
     If Trim(sSqlFiltro) <> ''
      Then sSqlFiltro := sSqlFiltro + ' AND ';

     sSqlFiltro := sSqlFiltro + '('+sSqlFiltro3+')';
   End;

   TabSheetPart.TabVisible := True;

   If Not qryParticipante.Active
    Then qryParticipante.Open;

   qryParticipante.Filtered := False;
   qryParticipante.Filter   := sSqlFiltro;
   qryParticipante.Filtered := True;
   qryParticipante.First;

   CriaLista(chklstParticipante, qryParticipante);
end;

procedure TfrmContrCalc.VerificaContribAssoc;
Var
 sSql : String;
begin
  qry.First;
  While Not qry.Eof do
   Begin
     qryVerifContrib.Close;
     qryVerifContrib.ParamByName('IDTITULAR').AsInteger := qry.FieldByName('IDTITULAR').AsInteger;
     qryVerifContrib.Open;

     If Not qryVerifContrib.IsEmpty
      Then Begin
        // Executa query para ASSOCIAR novas contribuições;
        sSql := 'SELECT 1 FROM CONTASS WHERE IDTITULAR = '+ qry.FieldByName('IDTITULAR').AsString +
                '  AND IDPLANASS = '+ qry.FieldByName('IDPLANASS').AsString +
                '  AND IDCONTASS = '+qryVerifContrib.FieldByName('CONTRIB_NOVA').AsString;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        qryAux.Open;

        If qryAux.IsEmpty
         Then sSql := 'INSERT INTO CONTASS (IDPLANASS, IDTITULAR, IDDEPENDENTE, IDPLANOPREV, IDPESSJUR,'+#13+#10+
                      '                     IDCONTASS, FLGATIVO, RECPAG, IDPAGADOR, SEQPROPOSTA)'+#13+#10+
                      'SELECT PA.IDPLANASS, PA.IDPESSOA IDTITULAR, CO.IDDEPENDENTE, PA.IDPLANOPREV, PA.IDPESSJUR,'+#13+#10+
                      '       '+ qryVerifContrib.FieldByName('CONTRIB_NOVA').AsString +' AS IDCONTASS,'+#13+#10+
                      '       CO.FLGATIVO, ''R'' AS RECPAG, PA.IDPESSOA IDPAGADOR, PA.SEQPROPOSTA'+#13+#10+
                      'FROM PARTASS PA, CONTASS CO'+#13+#10+
                      'WHERE PA.IDPESSOA = '+ qry.FieldByName('IDTITULAR').AsString + #13+#10+
                      '   AND PA.IDPLANASS = '+ qry.FieldByName('IDPLANASS').AsString + #13+#10+
                      '   AND CO.IDPLANASS = PA.IDPLANASS'+#13+#10+
                      '   AND CO.IDTITULAR = PA.IDPESSOA'+#13+#10+
                      '   AND CO.FLGATIVO = 1'
         Else sSql := 'UPDATE CONTASS '+#13+#10+
                      '  SET FLGATIVO = 1 '+#13+#10+
                      'WHERE IDTITULAR = '+ qry.FieldByName('IDTITULAR').AsString + #13+#10+
                      '  AND IDPLANASS = '+ qry.FieldByName('IDPLANASS').AsString + #13+#10+
                      '  AND IDCONTASS = '+ qryVerifContrib.FieldByName('CONTRIB_NOVA').AsString + #13+#10+
                      '  AND FLGATIVO  = 0';


        Try
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSql);

         qryAux.ExecSQL;
        Except
         memResult.Lines.Add('* Erro na associação de nova contribuição (nova situação no plano previdenciário):');
         memResult.Lines.Add('  Inscrição: '+qry.FieldByName('INSCRICAONUMERO').AsString);
         memResult.Lines.Add('  Contribuição a associar: '+qryVerifContrib.FieldByName('NOME_NOVA').AsString);
         bErro := True;
        End;

        // Executa query para DESSASSOCIAR novas contribuições;
        ssql := 'UPDATE CONTASS '+#13+#10+
                '  SET FLGATIVO = 0 '+#13+#10+
                'WHERE IDTITULAR = '+ qry.FieldByName('IDTITULAR').AsString + #13+#10+
                '  AND IDPLANASS = '+ qry.FieldByName('IDPLANASS').AsString + #13+#10+
                '  AND IDCONTASS = '+ qryVerifContrib.FieldByName('CONTRIB_ATUAL').AsString + #13+#10+
                '  AND FLGATIVO  = 1';
        Try
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSql);

         qryAux.ExecSQL;
         memResult.Lines.Add('- Alteração de contribuição por conta de troca de situação no plano previdenciário:');
         memResult.Lines.Add('  Inscrição: '+qry.FieldByName('INSCRICAONUMERO').AsString);
         memResult.Lines.Add('  Contribuição Desassociada: '+qryVerifContrib.FieldByName('NOME_ATUAL').AsString);
         memResult.Lines.Add('  Contribuição Associada: '+qryVerifContrib.FieldByName('NOME_NOVA').AsString);
        Except
         memResult.Lines.Add('* Erro na desassociação de contribuição (nova situação no plano previdenciário):');
         memResult.Lines.Add('  Inscrição: '+qry.FieldByName('INSCRICAONUMERO').AsString);
         memResult.Lines.Add('  Contribuição a desassociar: '+qryVerifContrib.FieldByName('NOME_ATUAL').AsString);
         bErro := True;
        End;
      End; // If qry.IsEmpty

     qry.Next;
   End; // While Not qry.Eof do

  qry.Close;
  qry.Open;
end;

procedure TfrmContrCalc.bbtnDesfazerClick(Sender: TObject);
begin
  inherited;
  AnoMesCobranca   := RetornaMesAno(cmbMes.Text,    SpeAno.Value );
  AnoMesReferencia := RetornaMesAno(EdtMesRef.Text, StrToIntDef(EdtAnoRef.Text,0));

  PreparaRestricoesQry;

  If Trim(strPlanAss + strPlanoPrev + strPatro + strParticipante) = ''
   Then If MsgDlg('Nenhuma seleção foi realizada. Deseja desfazer todo o preparo para o mês selecionado?',
                  'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo
         Then Begin
            MsgDlg('Operação de desfazer preparo cancelada.',
                  'Aviso', mtInformation, [mbOk], 0);
            Exit;
         End;

  frmAguarde.Mostra('Apagando contribuições que ainda não foram enviadas...');

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('DELETE FROM HSTCONTRIBASS');
  qry.SQL.Add('WHERE SITRECEBIMENTO = 0');
  qry.SQL.Add('  AND MES = '+QuotedStr(AnoMesReferencia));
  qry.SQL.Add('  AND MESCOBRANCA = '+QuotedStr(AnoMesCobranca));

  If Trim(strPlanAss) <> ''
   Then qry.SQL.Add('  AND IDPLANASS IN ('+strPlanAss+')');

  If Trim(strPlanoPrev) <> ''
   Then qry.SQL.Add('  AND IDPLANOPREV IN ('+strPlanoPrev+')');

  If Trim(strPatro) <> ''
   Then qry.SQL.Add('  AND IDPESSJUR IN ('+strPatro+')');

  If Trim(strParticipante) <> ''
   Then qry.SQL.Add('  AND IDTITULAR IN ('+strParticipante+')');

  If Not dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.StartTransaction;

  Try
    qry.ExecSQL;
    frmAguarde.Apaga;
    If MsgDlg('Operação de DESFAZER PREPARO concluída!'+#13+#10+
              'Confirma a operação de desfazer realizada?',
           'Validação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
     Then Begin
       dtmBaseDados.dbBaseDados.Commit;
       MsgDlg('Operação de desfazer EFETUADA!!',
              'Aviso', mtInformation, [mbOk], 0);
     End
     Else Begin
       dtmBaseDados.dbBaseDados.Rollback;
       MsgDlg('Operação de desfazer CANCELADA!!',
              'Aviso', mtInformation, [mbOk], 0);
     End;
  Except
    frmAguarde.Apaga;
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Erro durante a operação de DESFAZER PREPARO! Operação Cancelada!',
           'Erro', mtError, [mbOk], 0);
  End;
end;

procedure TfrmContrCalc.VerificaMudanca(piIdpessoa, piIdplanass, piNumOpcao: Integer;
  psResultadoRegra: String);
begin
  If StrToFloat(clientenumero(psResultadoRegra)) = 0
   Then Exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  Case piNumOpcao Of
    1 : qryAux.SQL.Add('SELECT VALORBASE1 AS VALOR');
    2 : qryAux.SQL.Add('SELECT VALORBASE2 AS VALOR');
    3 : qryAux.SQL.Add('SELECT VALORBASE3 AS VALOR');
    4 : qryAux.SQL.Add('SELECT VALORBASE4 AS VALOR');                                        
    5 : qryAux.SQL.Add('SELECT VALORBASE5 AS VALOR');
    6 : qryAux.SQL.Add('SELECT VALORBASE6 AS VALOR');
    7 : qryAux.SQL.Add('SELECT VALORBASE7 AS VALOR');
    8 : qryAux.SQL.Add('SELECT VALORBASE8 AS VALOR');
  End;
  qryAux.SQL.Add('FROM PARTASS');
  qryAux.SQL.Add('WHERE IDPESSOA  = '+IntToStr(piIdpessoa));
  qryAux.SQL.Add('  AND IDPLANASS = '+IntToStr(piIdplanass));
  qryAux.Open;

  If qryAux.FieldByName('VALOR').AsFloat < StrToFloat(clientenumero(psResultadoRegra))
   Then Begin
     qryAtualizaPartass.Close;
     qryAtualizaPartass.SQL.Clear;
     qryAtualizaPartass.SQL.Add('UPDATE PARTASS');
     Case piNumOpcao Of
       1 : qryAtualizaPartass.SQL.Add('SET VALORBASE1 = '+OraNumero(psResultadoRegra));
       2 : qryAtualizaPartass.SQL.Add('SET VALORBASE2 = '+OraNumero(psResultadoRegra));
       3 : qryAtualizaPartass.SQL.Add('SET VALORBASE3 = '+OraNumero(psResultadoRegra));
       4 : qryAtualizaPartass.SQL.Add('SET VALORBASE4 = '+OraNumero(psResultadoRegra));
       5 : qryAtualizaPartass.SQL.Add('SET VALORBASE5 = '+OraNumero(psResultadoRegra));
       6 : qryAtualizaPartass.SQL.Add('SET VALORBASE6 = '+OraNumero(psResultadoRegra));
       7 : qryAtualizaPartass.SQL.Add('SET VALORBASE7 = '+OraNumero(psResultadoRegra));
       8 : qryAtualizaPartass.SQL.Add('SET VALORBASE8 = '+OraNumero(psResultadoRegra));
     End;
     qryAtualizaPartass.SQL.Add('WHERE IDPESSOA  = '+IntToStr(piIdpessoa));
     qryAtualizaPartass.SQL.Add('  AND IDPLANASS = '+IntToStr(piIdplanass));

     Try
       qryAtualizaPartass.ExecSQL;
     Except
       memResult.Lines.Add('      Erro na gravação da opção '+ IntToStr(piNumOpcao)+' do participante.');
     End;
   End;
end;

end.

