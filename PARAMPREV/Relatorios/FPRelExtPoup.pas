// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Gleyber
// Data        : 24/04/2006
// Pendencia   : 22266
// Alteração   : Ajuste de posicionamento no sequencial.
//---------------------------------------------------------------------------------
// Rotina      : CAMPO edObs2 NA TELA
// Autor(a)    : Gleyber
// Data        : 24/04/2006
// Pendencia   : 22136
// Alteração   : Inclusão do telefone 0800 no segundo campo de observação. 
//---------------------------------------------------------------------------------
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Gleyber
// Data        : 24/04/2006
// Pendencia   : 22093
// Alteração   : Ajuste de campos no layout.
//---------------------------------------------------------------------------------
// Rotina      : qrySaldoAnterior2 e ProcessaLayOutTipo2
// Autor(a)    : Gleyber
// Data        : 07/07/2005
// Pendencia   : 19542
// Alteração   : Acerto na qrySaldoAnterior2 para distinção de índices idênticos e
//               e comparação do valor do campo de mes de referência para linha nº 2.
//---------------------------------------------------------------------------------
// Rotina      : qrySaldoAnterior2
// Autor(a)    : Gleyber
// Data        : 04/07/2005
// Pendencia   : 19542
// Alteração   : Acertos na query para trazer o valor do índice correto.
//---------------------------------------------------------------------------------
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Gleyber
// Data        : 24/06/2005
// Pendencia   : 19498 e 19524
// Alteração   : Acertos na query de busca
//---------------------------------------------------------------------------------
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Camille
// Data        : 01.06.2004
// Pendencia   : 16914
// Alteração   : Acertos em geral
//---------------------------------------------------------------------------------
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Gleyber
// Data        : 27/05/2004
// Pendencia   : 16896
// Alteração   : Retira o subselect para melhorar a performance da rotina. Incluida
//               varíavel para trabalhar a data de inscrição no plano
//---------------------------------------------------------------------------------
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Gleyber
// Data        : 14/05/2004
// Pendencia   : 16783
// Alteração   : Alteração a query do relatório para evitar extrato em duplicidade
//               nos casos em que participante foram transferidos de uma fundação
//               para outra
//---------------------------------------------------------------------------------
// Rotina      : ProcessaLayOutTipo2
// Autor(a)    : Flavio Dias
// Data        : 06.05.2004
// Pendencia   : 16739
// Alteração   : Só estava gerando o extrato para quem se inscreveu no Plano antes
//               do Mes/Ano inicial da tela. Passei a usar o Mes/Ano Final
//---------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 28.04.2004
// Pendencia   : 16678
// Alteração   : So gerar o extrato para entradas/saidas de contribuicao/beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 05.08.2003
// Alteração   : So gerar o extrato para entradas/saidas de contribuicao/beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : ---
// Autor(a)  : Camille
// Data      : 19.05.2003
// Alteração : Se a pessoan não tiver reserva patronal, trazer zerado
// *****************************************************************************
// Rotina    : ---
// Autor(a)  : Camille
// Data      : 08.05.2003
// Alteração : Não está pegando as contribuicoes do participante antes de migrar
//             de patrocinadora
// *****************************************************************************
// Rotina    : qryContaTransferencia.
// Autor(a)  : Carlos Guedes
// Data      : 29/04/2003
// Alteração : GRAVÍSSIMO: Esta qry estava com com o campo INDICEREAJUSTA CRAVADA EM 140
//              quando o correto era buscar 138. Não sei de onde vem este valor mas,
//              para atender era cravei o valor 138 tb!!!
// *****************************************************************************
// Rotina    : --
// Autor(a)  : Augusto
// Data      : 26/02/2003
// Alteração : Inclusão com controle de Situações do Participante
// *****************************************************************************
// Rotina    : --
// Autor(a)  : Camille - 07.02.2003
// Data      : 17/06/2002:
// Alteração : Buscar saldo anterior
// *****************************************************************************
// Rotina    : --
// Autor(a)  : Carlos Guedes
// Data      : 17/06/2002:
// Alteração : Permitir emissão do extrato individualmente.
// *****************************************************************************

// fdias - 13.02.2003 - refer - no object inspector, colocar enable = false para:
// edMatricula, edInscr e edParticipante

{leorefer - 1701

tirei a cláusula abaixo da qrymovreservapart.
AND   ((TO_CHAR(COT.COTDATA,'YYYY/MM') = HSM.MESREFERENCIA) OR
   	 (TO_CHAR(COT.COTDATA,'YYYY')||'/13' = HSM.MESREFERENCIA))

acrescentei:
AND   (TO_CHAR(COT.COTDATA,'YYYY/MM') = TO_CHAR(HSM.DATAALIMENTACAO,'YYYY/MM')   )
         }

{*********************
  Lise
  Alteração do nome da tabela de RESEVAPART para RESERVAPART na qryContaTransferencia .
  Retirada da qryHistContrib  TO_CHAR(TO_DATE(HSM.MESREFERENCIA,'YYYY MM'),'MON/YY') AS MESANO.
***********************}

unit FPRelExtPoup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Mask,
  wwdbedit, Wwdbspin,ComCtrls,wwdblook, Spin,MontaSelect, Wwdatsrc,FAguarde,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPRelExtPoup = class(TfrmOkCancelar)
    qryHistReserva: TwwQuery;
    SaveDialog: TSaveDialog;
    qryDadosParticip1: TwwQuery;
    qryExtratos: TwwQuery;
    qryCotMoed: TwwQuery;
    qryAux: TwwQuery;
    qryPlanos: TwwQuery;
    updPlanos: TUpdateSQL;
    dsPlanos: TwwDataSource;
    qryHistMovParticipante: TwwQuery;
    pgctrlExtReserva: TPageControl;
    tbsParamGeral: TTabSheet;
    tbsParamTXT: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbseano: TwwDBSpinEdit;
    cbmes: TComboBox;
    cbmes1: TComboBox;
    dbseano1: TwwDBSpinEdit;
    GroupBox3: TGroupBox;
    dbgrdPlanos: TwwDBGrid;
    GroupBox2: TGroupBox;
    RichEdit1: TRichEdit;
    Label3: TLabel;
    edCabecalho: TEdit;
    Label4: TLabel;
    dtEmissao: TCMDateTimePicker;
    qryContaTransferencia: TwwQuery;
    GroupBox4: TGroupBox;
    edObs1: TEdit;
    edObs2: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    edObs3: TEdit;
    Label8: TLabel;
    edObs4: TEdit;
    qryEndPess: TwwQuery;
    qryDadosParticip2: TwwQuery;
    qryHistContrib: TwwQuery;
    TabSheet1: TTabSheet;
    rgrpLayOut: TRadioGroup;
    rgrpOrigem: TRadioGroup;
    lblConsulta: TLabel;
    edConsulta: TEdit;
    sbtnConsulta: TSpeedButton;
    MSDataView: TMontaSelect;
    qrySaldoAnterior: TwwQuery;
    tsSegundaVia: TTabSheet;
    GroupBox5: TGroupBox;
    edMatricula: TEdit;
    Label9: TLabel;
    edInscr: TEdit;
    Label10: TLabel;
    bbtnProcurar: TBitBtn;
    Label11: TLabel;
    edParticipante: TEdit;
    MontaSelect1: TMontaSelect;
    qrySaldoAnterior2: TwwQuery;
    chkInclui13: TCheckBox;
    edAno13: TwwDBSpinEdit;
    GroupBox6: TGroupBox;
    DbGrdSituacoes: TwwDBGrid;
    QrySituacao: TwwQuery;
    DsSituacao: TwwDataSource;
    UpdSituacao: TUpdateSQL;
    lblInicio: TLabel;
    lblTermino: TLabel;
    ToolbarSep972: TToolbarSep97;
    bbtnCompara: TBitBtn;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnConsultaClick(Sender: TObject);
    procedure rgrpOrigemClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnComparaClick(Sender: TObject);
  private
    { Private declarations }
    wImpCab1,
    wImpCab2       : boolean;

    wDia,wMes,wAno : word;

    sSituacoes : string;
    DiaMesAno,
    wMesAnoInicio,
    wMesAnoFinal,
    sIdPessoa   : string;

    function Replicate(aTexto:string;NumVezes:Integer):string;
    function CompStr( a : string; tam:integer;letra:char;direcao : boolean):string;
    function LeftPad(Texto:string;Tam:byte):string;   {margeia o texto pela esquerda}
    function RightPad(Texto:string;Tam:byte):string;  {margeia o texto pela direita}
    function VerificaSeTemTipo1 ( wMesAnoIni, wMesAnoFim : string; piIdPlanoPrev : longint) : boolean;

    // CAMILLE - 19.02.2001
    // OS LAY-OUTS DOS ARQUIVOS, POR ENQUANTO SAO OS FORNECIDOS PELO SERPROS E PELA REFER
    // APOS O CUMPRIMENTO DO PRAZO, IREMOS ALTERAR A ROTINA PARA TER UM LAY-OUT PARAMETRIZADO
    // TXT no formato original da empresa INFORME para o plano do SERPROS, a principio
    function ProcessaLayOutTipo1 : Boolean;
    function GeraTxtLayOut1(REdit: TRichEdit; FileName, mesano: string ): Boolean;

    // TXT no formato original da empresa INFORME para o plano da REFER, a principio
    function ProcessaLayOutTipo2 (piIdPlanoPrev : longint ) : Boolean;

    function ProcessaConsultaPropria :  boolean;

    // CGUEDES - 26/02/2002: Pega o saldo do mês imediatamente inferiro ao mês inicial
    // Retorna a linha a ser inserida com identação completa.
    function ProcSaldAnterior(FlgTitular: Char; var dValorSaldoCota: Double): String;
    function AchaIndiceVarPatr(piIdpessjur: Integer; psIndice :String): String;

  public
    { Public declarations }
  end;

var
  frmPRelExtPoup     : TfrmPRelExtPoup;

implementation

uses UMensErro, UAdmPrev, UFuncoesUteis,UDatabase, UMovReserva, USistema;

{$R *.DFM}

function TfrmPRelExtPoup.Replicate(aTexto:string;NumVezes:Integer):string;
var
  I:Integer;
  Temp:string;
begin
  Temp:='';
  for I:=1 to NumVezes do
    Temp:=Temp+aTexto;
  Result:=Temp;
end;

function TfrmPRelExtPoup.CompStr( a : string; tam:integer;letra:char;direcao : boolean):string;
var
i : integer;
b : string;
begin
   b:= '';
   if tam > length(a) then for i := 1 to abs(tam - length(a)) do b:=b+letra;
   if direcao then b := b+a else b := a+b;
   result := b;
end;

function TfrmPRelExtPoup.LeftPad(Texto:string;Tam:byte):string;
begin
  Texto    := trim(Copy(Texto,1,Tam));
  Texto    := Texto + Replicate(' ',Tam-Length(Texto));
  LeftPad  := Texto;
end;

function TfrmPRelExtPoup.RightPad(Texto:string;Tam:byte):string;
begin
  Texto    := trim(Copy(Texto,1,Tam));
  Texto    := Replicate(' ',Tam-Length(Texto)) + Texto;
  RightPad := Texto;
end;

procedure TfrmPRelExtPoup.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex  := wMes - 1;
  dbseAno.Value    := wAno;
  edAno13.Value    := wAno;
  cbMes1.ItemIndex := wMes - 1;
  dbseAno1.Value   := wAno;
  RichEdit1.Clear;
end;

procedure TfrmPRelExtPoup.FormShow(Sender: TObject);
begin
  inherited;
  lblInicio.Visible := False; // CAMILLE - 27.05.2004
  lblTermino.Visible := False; // CAMILLE - 27.05.2004
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex  := wMes - 1;
  dbseAno.Value    := wAno;
  edAno13.Value    := wAno;
  cbMes1.ItemIndex := wMes - 1;
  dbseAno1.Value   := wAno;
  if wMes <= 9 then
     DiaMesAno := inttostr(wDia)+'/0'+inttostr(wMes)+'/'+Copy(inttostr(wAno),3,2)
  else
     DiaMesAno := inttostr(wDia)+'/'+inttostr(wMes)+'/'+Copy(inttostr(wAno),3,2);

  dtEmissao.Text := DateToStr(date);
  qryPlanos.Close;
  qryPlanos.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 23.06.2003
  qryPlanos.Open;
  QrySituacao.Close;
  QrySituacao.Open;

  rgrpOrigem.ItemIndex := 0;
  rgrpLayOut.Visible   := False;
  lblConsulta.Visible  := True;
  edConsulta.Visible   := True;
  sbtnConsulta.Visible := True;
  pgctrlExtReserva.ActivePage := tbsParamGeral;
end;

procedure TfrmPRelExtPoup.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if  cbMes.ItemIndex = -1 then
  begin
    MsgDlg('Mês de Referência Inicial não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    cbMes.SetFocus;
  end
  else if dbseAno.Value = 0 then
  begin
    MsgDlg('Ano de Referência Inicial não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    dbseAno.Value := wAno;
    dbseano.SetFocus;
  end
  else if  cbMes1.ItemIndex = -1 then
  begin
    MsgDlg('Mês de Referência Final não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    cbMes1.SetFocus;
  end
  else if dbseAno1.Value = 0 then
  begin
    MsgDlg('Ano de Referência Final não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    dbseAno1.Value := wAno;
    dbseano1.SetFocus;
  end;

  // CAMILLE - 27.05.2004 - INICIO
  pgctrlExtReserva.ActivePage := tbsParamGeral;
  lblInicio.Visible           := True;
  lblTermino.Visible          := True;
  lblInicio.Caption           := 'Início : '+DateTimeToStr(now);
  lblTermino.Caption          := 'Término : ';
  // CAMILLE - 27.05.2004 - FIM

  if rgrpOrigem.ItemIndex = 0 then
  begin
     if not ProcessaConsultaPropria then
     begin
        frmAguarde.Apaga;
        MsgDlg('Erro ao gerar arquivo de saída. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;
  end
  else begin
     if rgrpLayOut.ItemIndex = 0 then
       ProcessaLayOutTipo1
     else
     begin
        // CAMILLE - 05.08.2003
        // Acerto para quando o usuario selecionar o processamento individual, executar uma única vez
        if Trim(edMatricula.Text) <> '' // processamento individual
        then begin
           frmAguarde.Mostra('Matrícula : '+edMatricula.Text);
           ProcessaLayOutTipo2( StrToInt(MontaSelect1.ValoresChave[4]) );
        end
        else begin
           qryPlanos.First;
           while not qryPlanos.Eof do
           begin
              if qryPlanos.FieldByName('FlgConsidera').AsInteger = 1 then
              begin
                 frmAguarde.Mostra(qryPlanos.FieldByName('Nome').AsString );
                 ProcessaLayOutTipo2( qryPlanos.FieldByName('IdPlanoPrev').AsInteger );
              end;
              qryPlanos.Next;
           end;
        end;
     end;
  end;
    // cguedes - 19/12/2002
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
  // CAMILLE - 27.05.2004
  lblTermino.Caption := 'Término : '+DateTimeToStr(now);

  frmAguarde.Apaga;
  MsgDlg('Processo terminado com sucesso. ', 'Infomação', mtInformation,[mbOk],0);

end;

function TfrmPRelExtPoup.ProcessaLayOutTipo1 : Boolean;
Var
  sSQL : String;
begin
  Result := False;

  if (cbMes.ItemIndex+1) <= 9
  then  wMesAnoInicio:= Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
  else  wMesAnoInicio:= Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

  if (cbMes1.ItemIndex+1) <= 9
  then wMesAnoFinal := Trim(dbseano1.Text)+'/0'+IntToStr(cbMes1.ItemIndex+1)
  else wMesAnoFinal := Trim(dbseano1.Text)+'/'+IntToStr(cbMes1.ItemIndex+1);

  { Inicio Augusto 26/02/2003 - Monta String com as situações }
  QrySituacao.First;
  sSituacoes := '' ;
  while not QrySituacao.Eof do begin
     If QrySituacao.FieldByName('FLGCONSIDERA').AsInteger = 1 Then Begin // CAMILLE - PENDENCIA 16914 - 01.06.2004
       if Trim(sSituacoes) = '' then
         sSituacoes := QrySituacao.FieldByName('IDSITPART').AsString
       else
         sSituacoes := sSituacoes+','+QrySituacao.FieldByName('IDSITPART').AsString;
     End;
     QrySituacao.Next;
  end;

  // CAMILLE - 27.05.2004
  SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
  if not SaveDialog.Execute then Exit;

  qryExtratos.Close;
  //qryExtratos.ParamByName('MESREFATU').AsString    := wMesAnoInicio;
  //qryExtratos.ParamByName('MESREFFUT').AsString    := wMesAnoFinal;
  qryExtratos.SQL.Clear;
  sSQL := 'SELECT '+
          '  HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.SEQPROPOSTA, HSM.IDPESSOA, '+
          '  MAX(HSM.MESREFERENCIA) AS MAIORMES, '+
          '  MIN(HSM.MESREFERENCIA) AS MENORMES  '+
          'FROM  '+
          '  PATRO PT, RESERVAXPLANO R, HISTMOVRESERVA HSM, PARTPREVPLAN PPP '+
          'WHERE '+
          '  (HSM.MESREFERENCIA >= '+QuotedStr(wMesAnoInicio)+
          '  AND HSM.MESREFERENCIA <= '+QuotedStr(wMesAnoFinal)+') '+
          '  AND   (R.FLGCOLETIVA     = 0) '+
          '  AND   (R.FLGCONTROLE     = 0) '+
          ' AND    (PT.IDPESSOA       = PPP.IDPESSJUR) '+ // CAMILLE - 23.06.2003
          ' AND    (PT.IDFUNDACAO     = '+IntToStr(iIdFundacao)+')'+// CAMILLE - 23.06.2003
          '  AND   (PPP.FLGDESATIVADO = 0) ';

  if (Trim(sSituacoes) <> '') then begin
    sSQL := sSQL + 'AND PPP.IDSITPART IN ('+sSituacoes+')';
  end;

  sSQL := sSQL +
          '  AND   (HSM.IDPLANOPREV   = R.IDPLANOPREV)   '+
          '  AND   (HSM.IDTIPORESERVA = R.IDTIPORESERVA) '+
          '  AND   (HSM.IDPESSJUR     = PPP.IDPESSJUR)   '+
          '  AND   (HSM.IDPESSOA      = PPP.IDPESSOA)    '+
          '  AND   (HSM.IDPLANOPREV   = PPP.IDPLANOPREV) '+
          'GROUP BY '+
          '  HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.SEQPROPOSTA, HSM.IDPESSOA '+
          'ORDER BY '+
          '  HSM.IDPESSOA ';

  qryExtratos.SQL.Add(sSQL);
  qryExtratos.Open;
  { Fim Augusto 26/03/2003 }

  qryAux.Close;
  qryAux.ParamByName('MESREFATU').AsString := wMesAnoInicio;
  qryAux.ParamByName('MESREFFUT').AsString := wMesAnoFinal;
  qryAux.Open;

  frmAguarde.max := qryAux.fieldbyname('TOT').asinteger;
  frmAguarde.min := 0;

  // CAMILLE - 27.05.2004 - PEDIR ARQUIVO ANTES DE ABRIR A QUERY
//  SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
//  if SaveDialog.Execute then
//  begin
    frmAguarde.Mostra('Aguarde gravando arquivo ...');
    if GeraTxtLayOut1( RichEdit1,SaveDialog.FileName,wMesAnoInicio) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Arquivo gerado com sucesso.', 'Informação',mtInformation, [mbOk], 0);
      Result := True;
      Close;
    end
    else begin
       frmAguarde.Apaga;
       MsgDlg('Erro ao gerar arquivo.', 'Erro',mtError,  [mbOk], 0);
       Result := False;
    end;
//  end;
end; // ProcessaLayOutTipo1

function TfrmPRelExtPoup.GeraTxtLayOut1(REdit: TRichEdit; FileName, mesano: string ): Boolean;
const
  VetMes : Array [1..12] of String [3]= ('JAN','FEV','MAR','ABR','MAI','JUN','JUL','AGO','SET','OUT','NOV','DEZ');
var
  arq, arq2: TextFile;
  i,numext,numl, numreg, tipinsc : integer;
  iIdParticipAtual,
  iIdPessJur1,
  iIdPlano1,
  iIdParticip1,
  iIdPessJur2,
  iIdPlano2,
  iIdParticip2        : longint;
  wcateg,wMAnoCot,sSQL,setor,MesPost,sMes,sAno,sMesAno : string;
begin
  Result := False;
  AssignFile(arq,FileName);
  Rewrite(arq);
  writeln(arq,'+ DJDE JDE=JOB1,JDL=KSWP01,END;');
  while not qryExtratos.EOF do
  begin
     wImpCab1 := false; wImpCab2 := false;

     // Guardar o id do participante atual para, depois dos locates, poder voltar
     // para linha original
     iIdParticipAtual := qryExtratos.fieldbyname('IDPESSOA').AsInteger;

     qryDadosParticip1.Close;
     qryDadosParticip1.ParamByName('IDPESSOA').value := qryExtratos.fieldbyname('IDPESSOA').asstring;
     qryDadosParticip1.Open;
     if not qryDadosParticip1.IsEmpty
     then begin
        iIdPessJur1  := qryExtratos.fieldbyname('IDPESSJUR').AsInteger;
        iIdPlano1    := qryExtratos.fieldbyname('IDPLANOPREV').AsInteger;
        iIdParticip1 := qryExtratos.fieldbyname('IDPESSOA').AsInteger;
     end
     else begin
        iIdPessJur1  := -1;
        iIdPlano1    := -1;
        iIdParticip1 := -1;
     end;

     qryExtratos.Next;

     qryDadosParticip2.Close;
     qryDadosParticip2.ParamByName('IDPESSOA').value := qryExtratos.fieldbyname('IDPESSOA').asstring;
     qryDadosParticip2.Open;
     if not qryDadosParticip2.IsEmpty
     then begin
        iIdPessJur2  := qryExtratos.fieldbyname('IDPESSJUR').AsInteger;
        iIdPlano2    := qryExtratos.fieldbyname('IDPLANOPREV').AsInteger;
        iIdParticip2 := qryExtratos.fieldbyname('IDPESSOA').AsInteger;
     end
     else begin
        iIdPessJur2  := -1;
        iIdPlano2    := -1;
        iIdParticip2 := -1;
     end;

     // Gravar dados do participante 1
     if iIdParticip1 > 0
     then begin
	inc(numext);
	writeln(arq,'11  '+LeftPad(qryDadosParticip1.fieldbyname('NOMEFUNC').asstring,43)+
		    LeftPad(qryDadosParticip1.fieldbyname('MATRICULA').AsString,9));
	writeln(arq,'01     '+LeftPad(qryDadosParticip1.fieldbyname('LOGRADOURO').asstring,32)+', '+
		    LeftPad(qryDadosParticip1.fieldbyname('NUMERO').asstring,8)+','+
		    LeftPad(qryDadosParticip1.fieldbyname('BAIRRO').asstring,20));
	writeln(arq,'01     '+LeftPad(qryDadosParticip1.fieldbyname('CIDADE').asstring,31)+
		    LeftPad(qryDadosParticip1.fieldbyname('UF').asstring,3)+
		    LeftPad(qryDadosParticip1.fieldbyname('CEP').asstring,8));
	writeln(arq,'01                                             '+
		    RightPad(FormatFloat('######',numext),6));
	wImpCab1 := true;
     end;

     // gravar dados do participante 2
     if iIdParticip2 > 0
     then begin
	inc(NumExt);
	writeln(arq,'11  '+LeftPad(qryDadosParticip2.fieldbyname('NOMEFUNC').asstring,43)+
		    LeftPad(qryDadosParticip2.fieldbyname('MATRICULA').AsString,9));
	writeln(arq,'01     '+LeftPad(qryDadosParticip2.fieldbyname('LOGRADOURO').asstring,32)+', '+
		    LeftPad(qryDadosParticip2.fieldbyname('NUMERO').asstring,8)+','+
		    LeftPad(qryDadosParticip2.fieldbyname('BAIRRO').asstring,20));
	writeln(arq,'01     '+LeftPad(qryDadosParticip2.fieldbyname('CIDADE').asstring,31)+
		    LeftPad(qryDadosParticip2.fieldbyname('UF').asstring,3)+
		    LeftPad(qryDadosParticip2.fieldbyname('CEP').asstring,8));
	writeln(arq,'01                                             '+
		    RightPad(FormatFloat('######',numext),6));
	wImpCab2 := true;
     end;

     qryExtratos.First;
     qryExtratos.Locate('IDPESSOA',iIdParticip1,[]);

     // Gravar proximos dados do participante 1
     if (iIdParticip1 > 0) and
        (qryExtratos.FieldByName('IDPESSOA').AsInteger = iIdParticip1) // and (wImpCab1)
     then begin
          // Impressao interna do extrato 1
          writeln(arq,'22NOME   : '+LeftPad(qryDadosParticip1.fieldbyname('NOMEFUNC').asstring,46)+
                      'MATRICULA :'+RightPad(qryDadosParticip1.fieldbyname('MATRICULA').AsString,9));
          writeln(arq,' 2LOTACAO: '+LeftPad(qryDadosParticip1.fieldbyname('LOTACAO').asstring,46)+
                      'N. EXTRATO:'+RightPad(inttostr(Numext-1),9));
          writeln(arq,' 2         '+LeftPad(Setor,46)+'DT EMISSAO:  '+LeftPad(DiaMesAno,8));
          writeln(arq,' 2');
          writeln(arq,' 2');

          if qryDadosParticip1.fieldbyname('INSCRICAOTIPO').asstring = '0'
          then wcateg := 'FUNDADOR'
          else wcateg := 'NAO FUNDADOR';

          writeln(arq,' 2  INSCRICAO   CATEGORIA    DT INSCR   DT ADMISSAO   DT NASCIM      C P F');
          writeln(arq,' 2   '+LeftPad(FormatFloat('#####-#',qryDadosParticip1.fieldbyname('INSCRICAONUMERO').asfloat),7)
                      +'    '+LeftPad(wcateg,13)+
                      LeftPad(qryDadosParticip1.fieldbyname('INSCRICAODATA').asstring,8)+'     '+
                      LeftPad(qryDadosParticip1.fieldbyname('DATAADMISSAO').asstring,8)+'     '+
                      LeftPad(qryDadosParticip1.fieldbyname('DATANASC').asstring,8)+'   '+
                      LeftPad(FormatFloat('#########-##',qryDadosParticip1.fieldbyname('CPF').asfloat),12));
          writeln(arq,' 2');
          writeln(arq,' 2');

          qryHistReserva.Close;
          qryHistReserva.ParamByName('MESREFERENCIA').value := qryExtratos.FieldByName('MENORMES').AsString;
          qryHistReserva.ParamByName('IDPESSOA').value      := iIdParticip1;
          qryHistReserva.ParamByName('IDPESSJUR').value     := iIdPessJur1;
          qryHistReserva.ParamByName('IDPLANOPREV').value   := iIdPlano1;
          qryHistReserva.ParamByName('SEQPROPOSTA').value   := 1;
          qryHistReserva.Open;

          writeln(arq,' 2             POSICAO EM           COTAS       RESERVA DE POUPANCA');
          writeln(arq,' 2              '+LeftPad(qryHistReserva.fieldbyname('DATAALIMENTACAO').AsString,8)+
                      '         '+LeftPad(FormatFloat('#,###,##0.0000',qryHistReserva.fieldbyname('COTAS').asfloat),14)+
                      '         '+LeftPad(FormatFloat('###,##0.00',qryHistReserva.fieldbyname('RESERVAPOUP').asfloat),12));
          writeln(arq,' 2');
          writeln(arq,' 2');

          writeln(arq,' 2   MES/ANO    VALOR CONTRIBUICAO    FATOR DE ATUALIZACAO    COTAS CREDITADAS');

          qryHistContrib.Close;
          qryHistContrib.ParamByName('MESREFATU').AsString    := wMesAnoInicio;
          qryHistContrib.ParamByName('MESREFFUT').AsString    := wMesAnoFinal;
          qryHistContrib.ParamByName('IDPESSOA').value        := iIdParticip1;
          qryHistContrib.ParamByName('IDPESSJUR').value       := iIdPessJur1;
          qryHistContrib.ParamByName('IDPLANOPREV').value     := iIdPlano1;
          qryHistContrib.ParamByName('SEQPROPOSTA').value     := 1;
          qryHistContrib.Open;

          //Lise

          sMes := VetMes[StrToInt(Copy(qryHistContrib.fieldbyname('MESREFERENCIA').AsString,6,2))];

          sAno:= Copy(qryHistContrib.fieldbyname('MESREFERENCIA').AsString,1,4);

          sMesAno := sMes + '/' + sAno;

          while not qryHistContrib.Eof do
          begin
//              qryCotMoed.Close;
//              qryCotMoed.ParamByName('MESREFCOT').value := qryHistContrib.fieldbyname('MESANO1').AsString;
//              qryCotMoed.ParamByName('INDIC').value     := qryHistContrib.fieldbyname('INDICEREAJUSTE').asstring;
//              qryCotMoed.ParamByName('DTCOT').value     := qryHistContrib.fieldbyname('DATAALIMENTACAO').asstring;
//              qryCotMoed.Open;

              //writeln(arq,' 2    '+LeftPad(qryHistContrib.fieldbyname('MESANO').asstring,7)
              writeln(arq,' 2    '+LeftPad(sMesAno,7)
                          +RightPad(FormatFloat('###,##0.00',qryHistContrib.fieldbyname('VALCONTRIB').asfloat),21)
                          +RightPad(FormatFloat('####0.00000',qryHistContrib.fieldbyname('VALORINDICE').asfloat),23)
                          +RightPad(FormatFloat('#####0.0000',qryHistContrib.fieldbyname('COTASCREDIT').asfloat),20));
              qryHistContrib.next;
          end;

          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');

          qryHistReserva.Close;
          qryHistReserva.ParamByName('MESREFERENCIA').value := qryExtratos.FieldByName('MAIORMES').AsString;
          qryHistReserva.ParamByName('IDPESSOA').value      := iIdParticip1;
          qryHistReserva.ParamByName('IDPESSJUR').value     := iIdPessJur1;
          qryHistReserva.ParamByName('IDPLANOPREV').value   := iIdPlano1;
          qryHistReserva.ParamByName('SEQPROPOSTA').value   := 1;
          qryHistReserva.Open;

          writeln(arq,' 2             POSICAO EM           COTAS       RESERVA DE POUPANCA');
          writeln(arq,' 2              '+LeftPad(qryHistReserva.fieldbyname('DATAALIMENTACAO').AsString,8)+
                      '         '+LeftPad(FormatFloat('#,###,##0.0000',qryHistReserva.fieldbyname('COTAS').asfloat),14)+
                      '         '+LeftPad(FormatFloat('###,##0.00',qryHistReserva.fieldbyname('RESERVAPOUP').asfloat),12));
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');

          for i := 0 to REdit.Lines.Count do
              writeln(arq,' 2               '+LeftPad(REdit.Lines.Strings[i],71));

          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' 2');
          writeln(arq,' ');
     end; // fim da gravacao dos dados do participante  1

     // Gravar proximos dados do participante 2
     qryExtratos.First;
     qryExtratos.Locate('IDPESSOA',iIdParticip2,[]);
     if (iIdParticip2 > 0) and
        (qryExtratos.FieldByName('IDPESSOA').AsInteger = iIdParticip2) // and (wImpCab2)
     then begin
         // Impressao interna do extrato 2
         writeln(arq,'22NOME   : '+LeftPad(qryDadosParticip2.fieldbyname('NOMEFUNC').asstring,46)+
                     'MATRICULA :'+RightPad(qryDadosParticip2.fieldbyname('MATRICULA').AsString,9));
         writeln(arq,' 2LOTACAO: '+LeftPad(qryDadosParticip2.fieldbyname('LOTACAO').asstring,46)+
                     'N. EXTRATO:'+RightPad(inttostr(Numext),9));
         writeln(arq,' 2         '+LeftPad(Setor,46)+'DT EMISSAO:  '+LeftPad(DiaMesAno,8));
         writeln(arq,' 2');
         writeln(arq,' 2');

         if qryDadosParticip2.fieldbyname('INSCRICAOTIPO').asstring = '0'
         then wcateg := 'FUNDADOR'
         else wcateg := 'NAO FUNDADOR';

         writeln(arq,' 2  INSCRICAO   CATEGORIA    DT INSCR   DT ADMISSAO   DT NASCIM      C P F');
         writeln(arq,' 2   '+LeftPad(FormatFloat('#####-#',qryDadosParticip2.fieldbyname('INSCRICAONUMERO').asfloat),7)
                     +'    '+LeftPad(wcateg,13)+
                     LeftPad(qryDadosParticip2.fieldbyname('INSCRICAODATA').asstring,8)+'     '+
                     LeftPad(qryDadosParticip2.fieldbyname('DATAADMISSAO').asstring,8)+'     '+
                     LeftPad(qryDadosParticip2.fieldbyname('DATANASC').asstring,8)+'   '+
                     LeftPad(FormatFloat('#########-##',qryDadosParticip2.fieldbyname('CPF').asfloat),12));
         writeln(arq,' 2');
         writeln(arq,' 2');

         qryHistReserva.Close;
         qryHistReserva.ParamByName('MESREFERENCIA').value := qryExtratos.FieldByName('MENORMES').AsString;
         qryHistReserva.ParamByName('IDPESSOA').value      := iIdParticip2;
         qryHistReserva.ParamByName('IDPESSJUR').value     := iIdPessJur2;
         qryHistReserva.ParamByName('IDPLANOPREV').value   := iIdPlano2;
         qryHistReserva.ParamByName('SEQPROPOSTA').value   := 1;
         qryHistReserva.Open;

         writeln(arq,' 2             POSICAO EM           COTAS       RESERVA DE POUPANCA');
         writeln(arq,' 2              '+LeftPad(qryHistReserva.fieldbyname('DATAALIMENTACAO').AsString,8)+
                     '         '+LeftPad(FormatFloat('#,###,##0.0000',qryHistReserva.fieldbyname('COTAS').asfloat),14)+
                     '         '+LeftPad(FormatFloat('###,##0.00',qryHistReserva.fieldbyname('RESERVAPOUP').asfloat),12));
         writeln(arq,' 2');
         writeln(arq,' 2');

         writeln(arq,' 2   MES/ANO    VALOR CONTRIBUICAO    FATOR DE ATUALIZACAO    COTAS CREDITADAS');
         qryHistContrib.Close;
         qryHistContrib.ParamByName('MESREFATU').AsString    := wMesAnoInicio;
         qryHistContrib.ParamByName('MESREFFUT').AsString    := wMesAnoFinal;
         qryHistContrib.ParamByName('IDPESSOA').value        := iIdParticip2;
         qryHistContrib.ParamByName('IDPESSJUR').value       := iIdPessJur2;
         qryHistContrib.ParamByName('IDPLANOPREV').value     := iIdPlano2;
         qryHistContrib.ParamByName('SEQPROPOSTA').value     := 1;
         qryHistContrib.Open;

         while not qryHistContrib.Eof do
         begin
//            qryCotMoed.Close;
//            qryCotMoed.ParamByName('MESREFCOT').value := qryHistContrib.fieldbyname('MESANO1').AsString;
//            qryCotMoed.ParamByName('INDIC').value     := qryHistContrib.fieldbyname('INDICEREAJUSTE').asstring;
//            qryCotMoed.ParamByName('DTCOT').value     := qryHistContrib.fieldbyname('DATAALIMENTACAO').asstring;
//            qryCotMoed.Open;

          //  writeln(arq,' 2    '+LeftPad(qryHistContrib.fieldbyname('MESANO').asstring,7)
              writeln(arq,' 2    '+LeftPad(sMesAno,7)
                        +RightPad(FormatFloat('###,##0.00',qryHistContrib.fieldbyname('VALCONTRIB').asfloat),21)
                        +RightPad(FormatFloat('####0.00000',qryHistContrib.fieldbyname('VALORINDICE').asfloat),23)
                        +RightPad(FormatFloat('#####0.0000',qryHistContrib.fieldbyname('COTASCREDIT').asfloat),20));
            qryHistContrib.next;
         end;

         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');


         qryHistReserva.Close;
         qryHistReserva.ParamByName('MESREFERENCIA').value := qryExtratos.FieldByName('MAIORMES').AsString;
         qryHistReserva.ParamByName('IDPESSOA').value      := iIdParticip2;
         qryHistReserva.ParamByName('IDPESSJUR').value     := iIdPessJur2;
         qryHistReserva.ParamByName('IDPLANOPREV').value   := iIdPlano2;
         qryHistReserva.ParamByName('SEQPROPOSTA').value   := 1;
         qryHistReserva.Open;

         writeln(arq,' 2             POSICAO EM           COTAS       RESERVA DE POUPANCA');
         writeln(arq,' 2              '+LeftPad(qryHistReserva.fieldbyname('DATAALIMENTACAO').AsString,8)+
                     '         '+LeftPad(FormatFloat('#,###,##0.0000',qryHistReserva.fieldbyname('COTAS').asfloat),14)+
                     '         '+LeftPad(FormatFloat('###,##0.00',qryHistReserva.fieldbyname('RESERVAPOUP').asfloat),12));
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');


         for i := 0 to REdit.Lines.Count do
             writeln(arq,' 2               '+LeftPad(REdit.Lines.Strings[i],71));

         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' 2');
         writeln(arq,' ');
     end;

     inc(numreg);
     frmAguarde.pos  := numreg;
     qryExtratos.First;
     qryExtratos.Locate('IDPESSOA',iIdParticipAtual,[]);
     // Pular os dois participantes já processados
     for i := 1 to 2 do qryExtratos.Next;
  end;
  CloseFile(arq);
  Result := True;
end;

function TfrmPRelExtPoup.ProcessaLayOutTipo2 (piIdPlanoPrev : longint ): Boolean;
type
   TVetTotal = record
                   sMesAno             : string;
                   dTotalEmReal        : double;
                   dTotalEmCotas       : double;
                   dValorDaCota        : double;
                   dSaldoAnterior      : double;
                   iIndiceReajuste     : integer;
               end;
var
  // Vetor com as informacoes :
  // * Na posicao 1 - conta do participante : MesAno, Qtde.deCotas, ValorDaCota, ValorEmReal
  // * Na posicao 2 - conta da patrocinadora: MesAno, Qtde.deCotas, ValorDaCota, ValorEmReal
  // * Na posicao 3 - conta de transferencia do participante : MesAno, Qtde.deCotas, ValorDaCota, ValorEmReal
  // * Na posicao 4 - conta de transferencia da patrocinadora: MesAno, Qtde.deCotas, ValorDaCota, ValorEmReal
  VetTotais    : array[1..4] of TVetTotal;

  i            : integer;

  wMesAnoIni,
  wMesAnoFim,
  sLinha       : string;

  iSequencial,
  iContReserva,
  iIdPessoaAtual,
  iIdPlanoPrev    : longint;
  F               : TextFile;
  iUltDiaMes      : integer;
  sIdTitularidade,
  sDataBuscaCota,
  sAnoMesAnteriorAux,
  sAnoMesAtual,
  sAnoMesDisplay, // CGUEDES-Utilizado para alternar entre sAnoMesAtual e anterior.
  sFatorDisplay,  // mesmo caso acima só que com o fator = 1 para saldo anterior
  sEndereco       : string;

  dValorDaCota,
  dValorUltCota,
  dValorUltCotaAux,
  dValorSaldoCota,
  dValorAtualizado,
  dTotalAtualizado,
  rSdTransParticipante,
  rSdTransPatrocinadora  : double;

  // cguedes 08/01/2002
  iIdEndereco   : Integer;
  sParticipante     : String;

  // CGUEDES - 20/02/2002: VARIAVEL PROVISÓRIA!!!
  sAnoMesDisplayAUX,
  sCotMesRef : String;
  sDataInicioPlano : String; // Gleyber - 27/05/2004 - Pendência 16896
  sDataREFER : string; // CAMILLE - PENDENCIA 16914 - 01.06.2004
  bImprimiuLinha : boolean;
  bPossuiTipo1 : boolean;
  sIndice  : String; // Gleyber - 22/06/2004 - Pendência 17056
  sIdSitPartMA : String; // Gleyber - 30/06/2005 - Pendência 19498
begin
   Result := False;


   SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
   SaveDialog.Title := 'Extrato Patrocinadora '+qryPlanos.FieldByName('NOME').AsString;
   if not SaveDialog.Execute then Exit;

   // Data Início
   if (cbMes.ItemIndex+1) <= 9 then
     wMesAnoIni := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
   else  wMesAnoIni := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

   // Data Fim.
   if (cbMes1.ItemIndex+1) <= 9 then
   Begin
     wMesAnoFim := Trim(dbseano1.Text)+'/0'+IntToStr(cbMes1.ItemIndex+1);
     sCotMesRef := '0'+IntToStr(cbMes1.ItemIndex+1) + Trim(dbseano1.Text);
   End else
   Begin
     wMesAnoFim := Trim(dbseano1.Text)+'/'+IntToStr(cbMes1.ItemIndex+1);
     sCotMesRef := IntToStr(cbMes1.ItemIndex+1) + Trim(dbseano1.Text);
   End;


   // Zerar vetor de totois
   for i := 1 to 4 do
   begin
      vetTotais[i].sMesAno         := ''; // ultimo ano/mes em que houve entrada de reserva
      vetTotais[i].dTotalEmReal    := 0;
      vetTotais[i].dTotalEmCotas   := 0;
      vetTotais[i].dValorDaCota    := 0;
      vetTotais[i].iIndiceReajuste := 0;
      vetTotais[i].dSaldoAnterior   := 0;
   end;

   { Inicio Augusto 26/02/2003 - Monta String com as situações }
   QrySituacao.First;
   sSituacoes := '' ;
   sIdSitPartMA := '';
   while not QrySituacao.Eof do begin
     If QrySituacao.FieldByName('FLGCONSIDERA').AsInteger = 1 Then Begin // CAMILLE - PENDENCIA 16914 - 01.06.2004
        if Trim(sSituacoes) = '' then
          sSituacoes := QrySituacao.FieldByName('IDSITPART').AsString
        else
          sSituacoes := sSituacoes+','+QrySituacao.FieldByName('IDSITPART').AsString;
      End;
     // Gleyber - 30/06/2005 - Pendência 19498 - Início
     If qrySituacao.FieldByName('FLGINTERNO').AsString = 'MA'
      Then If Trim(sIdSitPartMA)= ''
            Then sIdSitPartMA := QrySituacao.FieldByName('IDSITPART').AsString
            Else sIdSitPartMA := sIdSitPartMA + ',' + QrySituacao.FieldByName('IDSITPART').AsString;
     // Gleyber - 30/06/2005 - Pendência 19498 - Fim
     QrySituacao.Next;
   end;
   { Fim Augusto 26/03/2003 }

   // cguedes - 17/06/2002: Permitindo gerar extrato para apenas uma pessoa.
   with qryHistMovParticipante do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 AS TIPO, HSM.IDPESSJUR,      HSM.IDPLANOPREV,                                           '+ // CAMILLE - 01.06.2004
             '        HSM.IDPESSOA,       HSM.SEQPROPOSTA,            PAT.NOME AS PATROCINADORA,     '+
             '        EL.MATRICULA,       P.NOME   AS PARTICIPANTE,   P.NUMDOCUMENTO AS CPF,         '+
             '        PL.NOME AS TIPOPLANO, P.IDENDCORRESP,           R.CODHIERARQUIA,               '+
             '        R.NOME,               R.INDICEREAJUSTE,         '+
             // CAMILLE - 28.04.2004 - PORQUE USAR O VALOR INDICE DA TABELA DE COTACAO SE TEM NA HISTMOVRESERVA ?
             // COT.COTVALOR VALORINDICE,      '+
             '        HSM.VALORINDICE,         '+
             '        R.FLGTITULARCOLET,    HSM.MESREFERENCIA,        R.IDTIPORESERVA,               '+
             // Gleyber - 27/05/2004 - Comentada - Pendência 16896
             //'        INICIOPLANO.INSCRICAODATA AS DATAINICIOPLANO,                                  '+
             '        SUBSTR(HSM.MESREFERENCIA,6,2)||''/''||SUBSTR(HSM.MESREFERENCIA,1,4) AS MESANO, '+
             '        SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRREAL, -HSM.VLRREAL)) AS VALORREAL,        '+
             '        SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOTAS)) AS VALORCOTAS      '+
             'FROM   PESSOA PAT, PESSOA P, PATRO PT, PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PPP,    '+
             '       RESERVAXPLANO R, HISTMOVRESERVA HSM                                             ');// CAMILLE - 28.04.2004 - COTACAOMOEDA COT,                          '+
             // Gleyber - 27/05/2004  - Pendência 16896
             { Comentada a subquery por problemas de performance
             '        ( SELECT PP.IDPESSOA, INSC.INSCRICAODATA                                       '+ // CAMILLE - 19.05.2003
             '         FROM   PARTPREVPLAN PP, PLANPREVPATRO PLP,                                    '+
             '                (SELECT PART.IDPESSOA, MAX(PART.INSCRICAODATA) AS INSCRICAODATA        '+
             '                 FROM   PARTPREVPLAN PART                                              '+
//             '                 WHERE  TO_CHAR(PART.INSCRICAODATA,''YYYY/MM'') <= '''+wMesAnoIni+'''  '+      FDias - 06.05.2004 - 16739
             '                 WHERE  TO_CHAR(PART.INSCRICAODATA,''YYYY/MM'') <= '''+wMesAnoFim+'''  '+  // Gleyber - 14/05/2004 - Pendência 16783
             '                 GROUP BY PART.IDPESSOA ) INSC                                         '+
             '         WHERE  PLP.IDPESSJUR = PP.IDPESSJUR                                           '+
             '         AND    PLP.IDPLANOPREV = PP.IDPLANOPREV                                       '+
             '         AND    PP.IDPESSOA = INSC.IDPESSOA                                            '+
             '         AND    PP.INSCRICAODATA = INSC.INSCRICAODATA ) INICIOPLANO                    ');}

     if not chkInclui13.Checked
     then SQL.Add('WHERE (HSM.MESREFERENCIA >= '''+wMesAnoIni+''')                                       '+
                  'AND   (HSM.MESREFERENCIA <= '''+wMesAnoFim+''')                                       '+
                  'AND   (PPP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+')'                               ) // CAMILLE - 08.05.2003
     else SQL.Add('WHERE ( '+
                  '        ( (HSM.MESREFERENCIA >= '''+wMesAnoIni+''') AND   (HSM.MESREFERENCIA <= '''+wMesAnoFim+''') ) OR  '+
                  '        ( (HSM.MESREFERENCIA = '''+edAno13.Text+'/13'') )                  '+
                  '       )                                                                   '+
                  'AND   (PPP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+')' );

     // CAMILLE 07.02.2003
     if (Trim(edMatricula.Text) <> '') then begin
        SQL.Add('AND PPP.IDPESSOA = '+sIdPessoa );
     end;

     { Augusto 26/02/2003 }
     if (Trim(sSituacoes) <> '') then begin
        SQL.Add('AND PPP.IDSITPART IN ('+sSituacoes+')' );
     end;

     SQL.Add(' AND   (HSM.IDPESSOA       = PPP.IDPESSOA)                                             '+
//           ' AND   (HSM.IDCONTRIBUICAO IS NOT NULL OR HSM.IDBENEFICIO IS NOT NULL)                 '+ // CAMILLE - 05.08.2003
             ' AND   (HSM.IDCONTRIBUICAO IS NOT NULL OR HSM.IDBENEFICIO IS NOT NULL OR (R.CODHIERARQUIA IN (''10104'',''10103'') ) ) '+ // CAMILLE - 02.06.2004
             ' AND    (PT.IDPESSOA       = PPP.IDPESSJUR)                                            '+ // CAMILLE - 23.06.2003
             ' AND    (PT.IDFUNDACAO     = '+IntToStr(iIdFundacao)+')                                '+ // CAMILLE - 23.06.2003
// CAMILLE - 28.04.2004
//     SQL.Add('AND   (COT.MOECODIGO      = R.INDICEREAJUSTE)                                         '+
//             'AND   (TO_CHAR(COT.COTDATA,''YYYY/MM'') = TO_CHAR(HSM.DATAALIMENTACAO,''YYYY/MM'') )  '+
//             'AND   (TO_CHAR(COT.COTDATA,''YYYY/MM'') = TO_CHAR(HSM.DATAINDICE''YYYY/MM'') )        '+
             'AND   (PL.IDPLANOPREV  = PPP.IDPLANOPREV )                                            '+
             'AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)                                             '+
             'AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)                                           '+
             'AND   (R.FLGCOLETIVA     = 0)                                                         '+
             'AND   (R.FLGCONTROLE     = 0)                                                         '+
             'AND   (R.FLGTRANSFERENCIA = 0)                                                        '+
             { Augusto 26/02/2003 }
//           'AND   (PPP.FLGDESATIVADO  = 0)                                                        '+ // CAMILLE - 08.05.2003

             'AND   (HSM.IDPESSJUR     = PPP.IDPESSJUR)                                             '+ // Gleyber - 14/05/2004 - Pendência 16783
             'AND   (PAT.IDPESSOA      = PPP.IDPESSJUR)                                             '+
             'AND   (EL.IDPESSJUR      = PPP.IDPESSJUR)                                             '+
             'AND   (EL.IDPESSOA       = PPP.IDPESSOA)                                              '+
             'AND   (P.IDPESSOA        = PPP.IDPESSOA)                                              '+

             { Augusto 26/02/2003 }
             'AND   (EL.IDPESSJUR      = PPP.IDPESSJUR)                                             '+
             'AND   (EL.IDPESSOA       = PPP.IDPESSOA)                                              '+
             // Gleyber - 27/05/2004 - Comentada - Pendência 16896
             //'AND   (INICIOPLANO.IDPESSOA = PPP.IDPESSOA )                                          '+

             'GROUP BY HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.IDPESSOA,       HSM.SEQPROPOSTA,         '+
             '       PAT.NOME,                                                                      '+
             '       P.NOME, EL.MATRICULA,                                                          '+
             '       PPP.INSCRICAODATA,                                                             '+ // Gleyber - 14/05/2004 - Pendência 16783
             '       P.NUMDOCUMENTO, P.IDENDCORRESP,                                                '+
             '       PL.NOME, R.CODHIERARQUIA, R.NOME,                                              '+
//             '       R.INDICEREAJUSTE,   COT.COTVALOR, R.FLGTITULARCOLET,                           '+
             '       R.INDICEREAJUSTE,   HSM.VALORINDICE, R.FLGTITULARCOLET,                        '+
             '       HSM.MESREFERENCIA, R.IDTIPORESERVA                                             ');
             { Augusto 26/02/2003 }
             // Gleyber - 27/05/2004 - Comentada - Pendência 16896
             //'        INICIOPLANO.INSCRICAODATA                                                     ');

             // Gleyber - 19/05/2004 - Pendência 16783 - Início
     SQL.Add('UNION '+
             'SELECT DECODE(R.FLGTRANSFERENCIA,1,3,2) AS TIPO, PPP.IDPESSJUR, PPP.IDPLANOPREV, PPP.IDPESSOA, PPP.SEQPROPOSTA, PAT.NOME AS PATROCINADORA, '+ // CAMILLE - 01.06.2004
             '       EL.MATRICULA, P.NOME AS PARTICIPANTE, P.NUMDOCUMENTO AS CPF, PL.NOME AS TIPOPLANO, '+
             '       P.IDENDCORRESP, R.CODHIERARQUIA, R.NOME, R.INDICEREAJUSTE, 0  AS VALORINDICE, R.FLGTITULARCOLET, '+
             '       ''       '' AS MESREFERENCIA, R.IDTIPORESERVA, '+
             // Gleyber - 27/05/2004 - Comentada - Pendência 16896
             //'       INICIOPLANO.INSCRICAODATA AS DATAINICIOPLANO, '+
             '       ''       '' AS MESANO, '+
             '       0 AS VALORREAL, '+
             '       0 AS VALORCOTAS '+
             'FROM   PESSOA PAT, PESSOA P, PATRO PT, PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PPP, '+
             '       RESERVAXPLANO R, RESERVAPART RE '+
             // Gleyber - 27/05/2004 - Pendência 16896
             { Comentada a subquery por problemas de performance
             {'        ( SELECT PP.IDPESSOA, INSC.INSCRICAODATA '+
             '         FROM   PARTPREVPLAN PP, PLANPREVPATRO PLP, '+
             '                (SELECT PART.IDPESSOA, MAX(PART.INSCRICAODATA) AS INSCRICAODATA '+
             '                 FROM   PARTPREVPLAN PART '+
             '                 WHERE  TO_CHAR(PART.INSCRICAODATA,''YYYY/MM'') <= '''+wMesAnoFim+'''  '+
             '                 GROUP BY PART.IDPESSOA ) INSC '+
             '         WHERE  PLP.IDPESSJUR = PP.IDPESSJUR '+
             '         AND    PLP.IDPLANOPREV = PP.IDPLANOPREV '+
             '         AND    PP.IDPESSOA = INSC.IDPESSOA '+
             '         AND    PP.INSCRICAODATA = INSC.INSCRICAODATA ) INICIOPLANO '+ }
             'WHERE (PPP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+') ');
     If (Trim(edMatricula.Text) <> '')
      Then SQL.Add('AND   (PPP.IDPESSOA = '+sIdPessoa+') ' );

     If (Trim(sSituacoes) <> '')
      Then SQL.Add('AND   (PPP.IDSITPART IN ('+sSituacoes+') )' );

     // Gleyber - 30/06/2005 - Pendência 19498 - Início
     SQL.Add('AND   (TO_CHAR(PPP.INSCRICAODATA,''YYYY/MM'') <= '''+wMesAnoFim+''') '+ // CAMILLE - 27.05.2004
             'AND   ((PPP.DATACANCELAMENTO IS NULL) OR (TO_CHAR(PPP.DATACANCELAMENTO,''YYYY/MM'') >= '''+wMesAnoIni+''')  ');
     If Trim(sIdSitPartMA) <> ''
      Then SQL.Add('OR (PPP.DATACANCELAMENTO IS NOT NULL AND PPP.IDSITPART IN ('+sIdSitPartMA+')) )')
      Else SQL.Add(')');
      // Gleyber - 30/06/2005 - Pendência 19498 - Fim
     SQL.Add('AND   (PT.IDFUNDACAO        = '+IntToStr(iIdFundacao)+') '+
             'AND   (PT.IDPESSOA          = PPP.IDPESSJUR) '+
             'AND   (PL.IDPLANOPREV       = PPP.IDPLANOPREV ) '+
             'AND   (R.IDPLANOPREV        = PPP.IDPLANOPREV) '+
             'AND   (R.FLGCOLETIVA        = 0) '+
             'AND   (R.FLGCONTROLE        = 0) '+
//             'AND   (R.FLGTRANSFERENCIA   = 0) '+ // CAMILLE - 03.06.2004
             'AND   (PAT.IDPESSOA         = PPP.IDPESSJUR) '+
             'AND   (EL.IDPESSJUR         = PPP.IDPESSJUR) '+
             'AND   (EL.IDPESSOA          = PPP.IDPESSOA) '+
             'AND   (P.IDPESSOA           = PPP.IDPESSOA) '+
             'AND   (EL.IDPESSJUR         = PPP.IDPESSJUR) '+
             'AND   (EL.IDPESSOA          = PPP.IDPESSOA) '+
             // Gleyber - 27/05/2004 - Comentada - Pendência 16896
             //'AND   (INICIOPLANO.IDPESSOA = PPP.IDPESSOA) '+
             'AND   (RE.IDPLANOPREV       = PPP.IDPLANOPREV) '+
             'AND   (RE.IDPESSJUR         = PPP.IDPESSJUR)   '+
             'AND   (RE.IDPESSOA          = PPP.IDPESSOA)    '+ // CAMILLE - PENDENCIA 16914 - 01.06.2004
             'AND   (RE.SEQPROPOSTA       = PPP.SEQPROPOSTA) '+
             'AND   (RE.VALORRESERVA      > 0) '+
             'AND   (RE.IDPLANOPREV       = R.IDPLANOPREV) '+
             'AND   (RE.IDTIPORESERVA     = R.IDTIPORESERVA) '+
             'AND   NOT EXISTS (SELECT 1 '+
             '                   FROM HISTMOVRESERVA HM '+
             '                   WHERE HM.IDPLANOPREV = RE.IDPLANOPREV '+
             '                     AND HM.IDPESSJUR = RE.IDPESSJUR '+
             // Gleyber - 24/06/2005 - Pendência 19498
             //Retirado o comentário da linha abaixo
             '                     AND HM.IDTIPORESERVA = RE.IDTIPORESERVA '+    // CAMILLE - 02/06/2004
             '                     AND HM.IDPESSOA = RE.IDPESSOA '+
             '                     AND HM.SEQPROPOSTA = RE.SEQPROPOSTA '+
             '                     AND (( '+
             '                           (HM.MESREFERENCIA >= '''+wMesAnoIni+''') AND '+
             '                           (HM.MESREFERENCIA <= '''+wMesAnoFim+''') '+
             '                           ) OR  '+
             '                           (HM.MESREFERENCIA = '''+edAno13.Text+'/13'') '+
             '                         ) '+ // CAMILLE - PENDENCIA 16914 - 01.06.2004
             '                 ) '+
             'GROUP BY PPP.IDPESSJUR, PPP.IDPLANOPREV, PPP.IDPESSOA, '+
             '         PPP.SEQPROPOSTA, PAT.NOME, P.NOME, EL.MATRICULA, '+
             '         PPP.INSCRICAODATA, P.NUMDOCUMENTO, P.IDENDCORRESP, '+
             '         PL.NOME, R.CODHIERARQUIA, R.NOME, R.INDICEREAJUSTE, '+
             '         R.FLGTITULARCOLET, R.IDTIPORESERVA, R.FLGTRANSFERENCIA ');



     SQL.Add('ORDER BY MATRICULA, '+
             // Gleyber - 27/05/2004 - Comentada - Pendência 16896
             //        DATAINICIOPLANO, '+
             '         FLGTITULARCOLET DESC, '+
             '         MESREFERENCIA ASC, '+
             '         NOME DESC ');


//     SQL.Add('ORDER BY EL.MATRICULA, '+
//             ' PPP.INSCRICAODATA, '+ // Gleyber - 14/05/2004 - Pendência 16783
//             ' R.FLGTITULARCOLET DESC, HSM.MESREFERENCIA ASC, R.NOME DESC     ');
             // Gleyber - 19/05/2004 - Pendência 16783 - Início

     // SQL.SaveToFile('C:\qryExtrato.txt');
     Open;
   end;


   if qryHistMovParticipante.IsEmpty
   then begin
//     MsgDlg('Não foi encontrado nenhum movimento de reserva para o perído informado.','Informação',mtInformation,[mbOk],0);
     Exit;
   end;
   frmAguarde.Apaga;

   // CAMILLE - 27.05.2004 - CHAMAR ARQUIVO ANTES DE ABRIR QUERY
//   SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
//   SaveDialog.Title := 'Extrato Patrocinadora '+qryPlanos.FieldByName('NOME').AsString;
//   if not SaveDialog.Execute then Exit;

   AssignFile(F, SaveDialog.FileName);
   Rewrite(F);

   // Inserir linha de cabecalho
   if Trim(edCabecalho.Text) <> ''
   then begin
      sLinha := PreparaStr(edCabecalho.Text,111);
      Writeln(F,sLinha);
   end;

   // Posicionar variaveis
   qryHistMovParticipante.First;
   iSequencial    := 1;

   iIdEndereco   := -1;
   sParticipante := '';

   while not qryHistMovParticipante.Eof do
   begin
     // Gleyber - 27/05/2004 - Pendência 16896 - Início
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT PP.IDPESSOA, INSC.INSCRICAODATA ');
     qryAux.SQL.Add('FROM   PARTPREVPLAN PP, PLANPREVPATRO PLP, ');
     qryAux.SQL.Add('       (SELECT PART.IDPESSOA, MAX(PART.INSCRICAODATA) AS INSCRICAODATA ');
     qryAux.SQL.Add('         FROM   PARTPREVPLAN PART ');
     qryAux.SQL.Add('         WHERE  TO_CHAR(PART.INSCRICAODATA,''YYYY/MM'') <= '''+wMesAnoFim+'''   ');
     qryAux.SQL.Add('           AND  PART.IDPESSOA = '+qryHistMovParticipante.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('         GROUP BY PART.IDPESSOA ) INSC ');
     qryAux.SQL.Add('WHERE  PLP.IDPESSJUR = PP.IDPESSJUR  ');
     qryAux.SQL.Add('AND    PLP.IDPLANOPREV = PP.IDPLANOPREV  ');
     qryAux.SQL.Add('AND    PP.IDPESSOA = INSC.IDPESSOA ');
     qryAux.SQL.Add('AND    PP.INSCRICAODATA = INSC.INSCRICAODATA ');
     qryAux.Open;

     sDataInicioPlano := qryAux.FieldByName('INSCRICAODATA').AsString;

     // Gleyber - 27/05/2004 - Pendência 16896 - Fim

     // Zerar vetor de totois
     for i := 1 to 4 do
     begin
        vetTotais[i].sMesAno         := '';
        vetTotais[i].dTotalEmReal    := 0;
        vetTotais[i].dTotalEmCotas   := 0;
        vetTotais[i].dValorDaCota    := 0;
        vetTotais[i].iIndiceReajuste := 0;
        vetTotais[i].dSaldoAnterior   := 0;
     end;
      frmAguarde.Mostra(qryPlanos.FieldByName('Nome').AsString + ' - '+IntToStr(iSequencial));
      Application.ProcessMessages;
      iIdPessoaAtual := qryHistMovParticipante.FieldByName('IDPESSOA').AsInteger;
      iIdEndereco    := qryHistMovParticipante.FieldByName('IDENDCORRESP').AsInteger;
      sParticipante  := qryHistMovParticipante.FieldByName('PARTICIPANTE').AsString;
      iIdPlanoPrev   := qryHistMovParticipante.FieldByname('IdPlanoPrev').AsInteger;

      rSdTransParticipante   := 0;
      rSdTransPatrocinadora  := 0;
      dTotalAtualizado       := 0;

      // 2a. linha : Patrocinadora
      sLinha := '12'+ PreparaStr(' ',72)+'CD'+
                PreparaStr(' ',15)+
                PreparaStr(qryHistMovParticipante.FieldByname('PATROCINADORA').AsString,10);
      Writeln(F,sLinha);


      // 3a. linha : Participante Matricula
      sLinha := '-2'+ PreparaStr(' ',3)+
                PreparaStr(qryHistMovParticipante.FieldByname('Participante').AsString,60)+
                PreparaStr(' ',1)+
                PreparaStr(qryHistMovParticipante.FieldByname('Matricula').AsString,10)+
                ' '+
                PreparaStr(qryHistMovParticipante.FieldByname('CPF').AsString,12)+
                PreparaStr(Trim(dtEmissao.Text),10);
      Writeln(F,sLinha);

      dValorUltCota := 0;
      dValorUltCotaAux := 0;

      while (iIdPessoaAtual = qryHistMovParticipante.FieldByName('IdPessoa').AsInteger) and
            (not qryHistMovParticipante.Eof) do
      begin

         bPossuiTipo1 := VerificaSeTemTipo1(wMesAnoIni, wMesAnoFim, piIdPlanoPrev);
         // RESERVAS DO PARTICIPANTE
         iContReserva := 1;
         while (qryHistMovParticipante.FieldByName('FLGTITULARCOLET').AsString = 'T') and
               (not qryHistMovParticipante.Eof) and
               (iIdPessoaAtual = qryHistMovParticipante.FieldByName('IdPessoa').AsInteger) do  // fdias - 13.02.2003 - refer
         begin
            if iContReserva = 1 then
            Begin
              qrySaldoAnterior2.Close;
              qrySaldoAnterior2.ParamByName('IDPESSOA').AsInteger    := qryHistMovParticipante.FieldByname('IDPESSOA').AsInteger;
              qrySaldoAnterior2.ParamByName('SEQPROPOSTA').AsInteger := qryHistMovParticipante.FieldByname('SEQPROPOSTA').AsInteger;
              qrySaldoAnterior2.ParamByName('IDPESSJUR').AsInteger   := qryHistMovParticipante.FieldByname('IDPESSJUR').AsInteger;
              qrySaldoAnterior2.ParamByName('IDPLANOPREV').AsInteger   := qryHistMovParticipante.FieldByname('IDPLANOPREV').AsInteger;
              qrySaldoAnterior2.ParamByName('ANOMESINI').AsString    := wMesAnoIni;
              qrySaldoAnterior2.ParamByName('FLGTITULAR').AsString    := 'T';
              qrySaldoAnterior2.Open;

              if qrySaldoAnterior2.IsEmpty
              then sLinha := '22          Saldo Anterior                                      0,0000000  0,000000000            0,00'
              else begin
                 // CAMILLE - PENDENCIA 16914 - ITEM 6
                 // SE A PESSOA NÃO TEVE ALIMENTACAO DE RESERVA NO ANO, O INDICE
                 // A SER UTILIZADO DEVE SER O MESMO DO MES FINAL
                 if qryHistMovParticipante.FieldByName('TIPO').AsInteger = 1
                 then sLinha := '22  '+
                                  PreparaStr(' ',8)+
                                  PreparaStr('Saldo Anterior',40)+
                                  PreparaStr(' ',10)+
                                  PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat),11),11)+
                                  PreparaStr(' ',2)+
                                  PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',qrySaldoAnterior2.FieldByname('VALORINDICE').AsFloat),11),11)+
                                  PreparaStr(' ',6)+
                                  PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qrySaldoAnterior2.FieldByname('SALDOREAL').AsFloat),10),10)
                 else begin
                    sAnoMesAnteriorAux  := SAnoMesAnterior(wMesAnoIni);
                    sDataBuscaCota := IntToStr(TrazUltDiaMes(StrToInt(Copy(sAnoMesAnteriorAux,6,2)),StrToInt(Copy(sAnoMesAnteriorAux,1,4))))+'/'+
                                      Copy(sAnoMesAnteriorAux,6,2)+'/'+
                                      Copy(sAnoMesAnteriorAux,1,4);

                    // Gleyber - 22/06/2004 - Pendência 17056 - Início
                    sIndice := AchaIndiceVarPatr(qryHistMovParticipante.FieldByname('IDPESSJUR').AsInteger,
                                                 qryHistMovParticipante.FieldByname('IndiceReajuste').AsString);
                    // Gleyber - 22/06/2004 - Pendência 17056 - Fim

                    dValorDaCota    := VoltaValorCotacao( qryAux,
                                                          //qryHistMovParticipante.FieldByname('IndiceReajuste').AsString,
                                                          sIndice,
                                                          qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                                          qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                                          sDataBuscaCota);
                    sLinha := '22  '+
                                  PreparaStr(' ',8)+
                                  PreparaStr('Saldo Anterior',40)+
                                  PreparaStr(' ',10)+
                                  PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat),11),11)+
                                  PreparaStr(' ',2)+
                                  PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',dValorDaCota),11),11)+
                                  PreparaStr(' ',6)+
                                  PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat*dValorDaCota),10),10);
                    end;
              end;
              Writeln(F,sLinha);

              sLinha := ' 2  '+
                             PreparaStr(qryHistMovParticipante.FieldByname('MesAno').AsString,8)+
                             PreparaStr(qryHistMovParticipante.FieldByname('Nome').AsString,40)+
                             PreparaStr(' ',10)+
                             PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qryHistMovParticipante.FieldByname('VALORCOTAS').AsFloat),11),11)+
                             PreparaStr(' ',2)+ // cguedes - 16/01/2002: anterior era 3
                             PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',qryHistMovParticipante.FieldByname('VALORINDICE').AsFloat),11),11)+
                             PreparaStr(' ',6)+ // anterior era 8
                             PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryHistMovParticipante.FieldByname('VALORREAL').AsFloat),10),10);
            End else sLinha := ' 2  '+
                           PreparaStr(qryHistMovParticipante.FieldByname('MesAno').AsString,8)+
                           PreparaStr(qryHistMovParticipante.FieldByname('Nome').AsString,40)+
                           PreparaStr(' ',10)+
                           PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qryHistMovParticipante.FieldByname('VALORCOTAS').AsFloat),11),11)+
                           PreparaStr(' ',2)+ // cguedes - 16/01/2002: anterior era 3
                           PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',qryHistMovParticipante.FieldByname('VALORINDICE').AsFloat),11),11)+
                           PreparaStr(' ',6)+ // anterior era 8
                           PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryHistMovParticipante.FieldByname('VALORREAL').AsFloat),10),10);

            // CAMILLE - 03.06.2004
            // TIPO 3 = RESERVA DE TRANSFERENCIA -> NAO IMPRIMIR NESSE MOMENTO

            if (qryHistMovParticipante.FieldByname('TIPO').AsString <> '3') and (bPossuiTipo1)
                And (Trim(qryHistMovParticipante.FieldByname('MESANO').AsString) <> '') // Gleyber - 08/07/2005 - Pendência 18542
            then begin
               Writeln(F,sLinha);
            end;

            vetTotais[1].sMesAno          := qryHistMovParticipante.FieldByname('MesAno').AsString;
            vetTotais[1].dTotalEmCotas    := vetTotais[1].dTotalEmCotas   + qryHistMovParticipante.FieldByname('VALORCOTAS').AsFloat;

            // Gleyber - 22/06/2004 - Pendência 17056 - Início
            If qryHistMovParticipante.FieldByName('TIPO').AsInteger <> 1
             Then sIndice := AchaIndiceVarPatr(qryHistMovParticipante.FieldByname('IDPESSJUR').AsInteger,
                                               qryHistMovParticipante.FieldByname('IndiceReajuste').AsString)
             Else sIndice := qryHistMovParticipante.FieldByname('IndiceReajuste').AsString;
            //vetTotais[1].iIndiceReajuste  := qryHistMovParticipante.FieldByname('INDICEREAJUSTE').AsInteger;
            vetTotais[1].iIndiceReajuste  := StrToInt(sIndice);
            // Gleyber - 22/06/2004 - Pendência 17056 - Fim

            if qrySaldoAnterior2.IsEmpty
            then vetTotais[1].dSaldoAnterior := 0
            else vetTotais[1].dSaldoAnterior := qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat;

            dValorUltCotaAux := qryHistMovParticipante.FieldByname('VALORINDICE').AsFloat;

            inc(iContReserva);


            qryHistMovParticipante.Next;

            // pega o último índice
            If (qryHistMovParticipante.FieldByName('FLGTITULARCOLET').AsString <> 'T') and
               (qryHistMovParticipante.FieldByname('TIPO').AsString <> '3') AND // CAMILLE - 03.06.2004
               (not qryHistMovParticipante.Eof)
            Then dValorUltCota := dValorUltCotaAux;
         end;

         // RODAPE DAS RESERVAS DO PARTICIPANTE
         // Buscar valor atual da cota
         sDataBuscaCota := IntToStr(TrazUltDiaMes(StrToInt(Copy(wMesAnoFim,6,2)),StrToInt(Copy(wMesAnoFim,1,4))))+'/'+
                           Copy(wMesAnoFim,6,2)+'/'+
                           Copy(wMesAnoFim,1,4);

         dValorDaCota    := VoltaValorCotacao( qryAux,
                                               IntToStr(vetTotais[1].iIndiceReajuste) ,
                                               qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                               qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                               sDataBuscaCota);
         vetTotais[1].dTotalEmCotas   := vetTotais[1].dTotalEmCotas + vetTotais[1].dSaldoAnterior;
//         vetTotais[1].dTotalEmReal    := vetTotais[1].dTotalEmCotas * dValorDaCota;
         // CAMILLE - PENDENCIA 16914 - 01.06.2004
         // No item 3 da pendencia está descrito que o total na linha 32 está truncado e na
         // linha 52 está arredondado. Assim, igualei os critérios
         // O da linha 52 é    -> vetTotais[2].dTotalEmReal    := vetTotais[2].dTotalEmCotas * dValorDaCota;
         // Na linha 32 estava -> vetTotais[1].dTotalEmReal    := (Trunc(100*(vetTotais[1].dTotalEmCotas * dValorDaCota))) / 100;
         vetTotais[1].dTotalEmReal    := vetTotais[1].dTotalEmCotas * dValorDaCota;
         vetTotais[1].dValorDaCota    := dValorDaCota;
         // (Trunc(100*(vetTotais[i].dTotalEmCotas * dValorDaCota))) / 100;
         sLinha := '32'+ PreparaStr(' ',34)+
                         PreparaStr(Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4),7)+
                         PreparaStr(' ',4)+
                         PreparaStr(FormatFloat('#0.000000000',vetTotais[1].dTotalEmCotas),14)+
                         PreparaStr(' ',7)+
                         PreparaStr(FormatFloat('#0.000000000',vetTotais[1].dValorDaCota),11)+
                         PreparaStr(' ',11)+
                         PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',vetTotais[1].dTotalEmReal),12),12);
         Writeln(F,sLinha);

         // RESERVAS DA PATROCINADORA
         iContReserva := 1;
         bImprimiuLinha := False;
         while (qryHistMovParticipante.FieldByName('FLGTITULARCOLET').AsString = 'P') and
               (not qryHistMovParticipante.Eof) and
               (iIdPessoaAtual = qryHistMovParticipante.FieldByName('IdPessoa').AsInteger) do  // fdias - 13.02.2003 - refer
         begin
            bImprimiuLinha := True;
            if iContReserva = 1 then
            Begin
//              If iIdPlanoPrev = 3 Then
//                // pegar o saldo anterior
//                sLinha := ProcSaldAnterior('P',dValorSaldoCota)
//              Else begin
                // CAMILLE - 07.02.2003
                // BUSCAR SALDO NO MES ANTERIOR AO MES DE INICIO
                qrySaldoAnterior2.Close;
                qrySaldoAnterior2.ParamByName('IDPESSOA').AsInteger    := qryHistMovParticipante.FieldByname('IDPESSOA').AsInteger;
                qrySaldoAnterior2.ParamByName('SEQPROPOSTA').AsInteger := qryHistMovParticipante.FieldByname('SEQPROPOSTA').AsInteger;
                qrySaldoAnterior2.ParamByName('IDPESSJUR').AsInteger   := qryHistMovParticipante.FieldByname('IDPESSJUR').AsInteger;
                qrySaldoAnterior2.ParamByName('IDPLANOPREV').AsInteger := qryHistMovParticipante.FieldByname('IDPLANOPREV').AsInteger;
                qrySaldoAnterior2.ParamByName('ANOMESINI').AsString    := wMesAnoIni;
                qrySaldoAnterior2.ParamByName('FLGTITULAR').AsString   := 'P'; // CGUEDES - 29/04/2003, ANTES ERA 'T'
                qrySaldoAnterior2.Open;


                if qrySaldoAnterior2.IsEmpty
                then sLinha := '42          Saldo Anterior                                      0,0000000  0,000000000            0,00'
                else begin
                   // CAMILLE - PENDENCIA 16914 - ITEM 6
                   // SE A PESSOA NÃO TEVE ALIMENTACAO DE RESERVA NO ANO, O INDICE
                   // A SER UTILIZADO DEVE SER O MESMO DO MES FINAL
                   if qryHistMovParticipante.FieldByName('TIPO').AsInteger = 1
                   then sLinha := '42  '+
                                    PreparaStr(' ',8)+
                                    PreparaStr('Saldo Anterior',40)+
                                    PreparaStr(' ',10)+
                                    PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat),11),11)+
                                    PreparaStr(' ',2)+
                                    PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',qrySaldoAnterior2.FieldByname('VALORINDICE').AsFloat),11),11)+
                                    PreparaStr(' ',6)+
                                    PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qrySaldoAnterior2.FieldByname('SALDOREAL').AsFloat),10),10)
                   else begin
                      sAnoMesAnteriorAux  := SAnoMesAnterior(wMesAnoIni);
                      sDataBuscaCota := IntToStr(TrazUltDiaMes(StrToInt(Copy(sAnoMesAnteriorAux,6,2)),StrToInt(Copy(sAnoMesAnteriorAux,1,4))))+'/'+
                                        Copy(sAnoMesAnteriorAux,6,2)+'/'+
                                        Copy(sAnoMesAnteriorAux,1,4);

                      // Gleyber - 22/06/2004 - Pendência 17056 - Início
                      sIndice := AchaIndiceVarPatr(qryHistMovParticipante.FieldByname('IDPESSJUR').AsInteger,
                                                   qryHistMovParticipante.FieldByname('IndiceReajuste').AsString);
                      // Gleyber - 22/06/2004 - Pendência 17056 - Fim

                      dValorDaCota    := VoltaValorCotacao( qryAux,
                                                            //qryHistMovParticipante.FieldByname('IndiceReajuste').AsString,
                                                            sIndice, // Gleyber - 22/06/2004 - Pendência 17056
                                                            qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                                            qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                                            sDataBuscaCota);
                      sLinha := '42  '+
                                    PreparaStr(' ',8)+
                                    PreparaStr('Saldo Anterior',40)+
                                    PreparaStr(' ',10)+
                                    PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat),11),11)+
                                    PreparaStr(' ',2)+
                                    PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',dValorDaCota),11),11)+
                                    PreparaStr(' ',6)+
                                    PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat*dValorDaCota),10),10)

                   end;
                end;
                Writeln(F,sLinha);
                sLinha := ' 2  '+
                             PreparaStr(qryHistMovParticipante.FieldByname('MesAno').AsString,8)+
                             PreparaStr(qryHistMovParticipante.FieldByname('Nome').AsString,40)+
                             PreparaStr(' ',10)+
                             PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qryHistMovParticipante.FieldByname('VALORCOTAS').AsFloat),11),11)+
                             PreparaStr(' ',2)+ // cguedes - 16/01/2002: anterior era 3
                             PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',qryHistMovParticipante.FieldByname('VALORINDICE').AsFloat),11),11)+
                             PreparaStr(' ',6)+ // anterior era 6
                             PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryHistMovParticipante.FieldByname('VALORREAL').AsFloat),10),10);
            End else sLinha := ' 2  '+
                           PreparaStr(qryHistMovParticipante.FieldByname('MesAno').AsString,8)+
                           PreparaStr(qryHistMovParticipante.FieldByname('Nome').AsString,40)+
                           PreparaStr(' ',10)+
                           PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',qryHistMovParticipante.FieldByname('VALORCOTAS').AsFloat),11),11)+
                           PreparaStr(' ',2)+ // cguedes - 16/01/2002: anterior era 3
                           PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',qryHistMovParticipante.FieldByname('VALORINDICE').AsFloat),11),11)+
                           PreparaStr(' ',6)+ // anterior era 6
                           PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryHistMovParticipante.FieldByname('VALORREAL').AsFloat),10),10);
            // CAMILLE - 03.06.2004
            // TIPO 3 = RESERVA DE TRANSFERENCIA -> NAO IMPRIMIR NESSE MOMENTO
            if (qryHistMovParticipante.FieldByname('TIPO').AsString <> '3') and bPossuiTipo1
            then begin

               Writeln(F,sLinha);

            end;

            vetTotais[2].sMesAno          := qryHistMovParticipante.FieldByname('MesAno').AsString;
            vetTotais[2].dTotalEmCotas    := vetTotais[2].dTotalEmCotas   + qryHistMovParticipante.FieldByname('VALORCOTAS').AsFloat;

            // Gleyber - 22/06/2004 - Pendência 17056 - Início
            If qryHistMovParticipante.FieldByName('TIPO').AsInteger <> 1
             Then sIndice := AchaIndiceVarPatr(qryHistMovParticipante.FieldByname('IDPESSJUR').AsInteger,
                                               qryHistMovParticipante.FieldByname('IndiceReajuste').AsString)
             Else sIndice := qryHistMovParticipante.FieldByname('IndiceReajuste').AsString;
            //vetTotais[2].iIndiceReajuste  := qryHistMovParticipante.FieldByname('INDICEREAJUSTE').AsInteger;
            vetTotais[2].iIndiceReajuste  := StrToInt(sIndice);
            // Gleyber - 22/06/2004 - Pendência 17056 - Fim

            if qrySaldoAnterior2.IsEmpty
            then vetTotais[2].dSaldoAnterior := 0
            else vetTotais[2].dSaldoAnterior := qrySaldoAnterior2.FieldByname('SALDOCOTAS').AsFloat;

            inc(iContReserva);

            qryHistMovParticipante.Next;
         end;

         if not bImprimiuLinha // CAMILLE - 03.08.2004
         then begin
            sLinha := '42          Saldo Anterior                                      0,0000000  0,000000000            0,00';
            Writeln(F,sLinha);
         end;

         // RODAPE DAS RESERVAS DA PATROCINADORA
         // Buscar valor atual da cota
         sDataBuscaCota := IntToStr(TrazUltDiaMes(StrToInt(Copy(wMesAnoFim,6,2)),StrToInt(Copy(wMesAnoFim,1,4))))+'/'+
                           Copy(wMesAnoFim,6,2)+'/'+
                           Copy(wMesAnoFim,1,4);

         dValorDaCota    := VoltaValorCotacao( qryAux,
                                               IntToStr(vetTotais[2].iIndiceReajuste),
                                               qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                               qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                               sDataBuscaCota);

         vetTotais[2].dTotalEmCotas   := vetTotais[2].dTotalEmCotas + vetTotais[2].dSaldoAnterior;
         vetTotais[2].dTotalEmReal    := vetTotais[2].dTotalEmCotas * dValorDaCota;
         vetTotais[2].dValorDaCota    := dValorDaCota;

         sLinha := '52'+ PreparaStr(' ',34)+
                         // PreparaStr('12/2001',7)+
                         PreparaStr(Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4),7)+
                         PreparaStr(' ',4)+ // anterior era 5
                         PreparaStr(FormatFloat('#0.000000000',vetTotais[2].dTotalEmCotas),14)+
                         PreparaStr(' ',7)+
                         PreparaStr(FormatFloat('#0.000000000',vetTotais[2].dValorDaCota),11)+
                         PreparaStr(' ',11)+ // anterior era 14
                         PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',vetTotais[2].dTotalEmReal),12),12);
         Writeln(F,sLinha);

         // **************************************************************************
         // CONTA DE TRANSFERÊNCIA
//         sAnoMesAnteriorAux  := IntToStr(StrToInt(Copy(wMesAnoFim,1,4))-1)+'/'+Copy(wMesAnoFim,6,2);
         sAnoMesAnteriorAux  := Copy(wMesAnoIni,6,2)+Copy(wMesAnoIni,1,4);
         sAnoMesAtual        := Copy(wMesAnoFim,6,2)+Copy(wMesAnoFim,1,4);

         // Qry com dados das contas de transferencia do ano anterior ordenado por
         // titularidade ( T - Participante, P - Patrocinadora )
         with qryContaTransferencia do
         begin
            Close;
            ParamByName('IDPLANOPREV').AsInteger    := qryHistMovParticipante.FieldByname('IDPLANOPREV').AsInteger;// iIdPlanoPrev;
            ParamByName('IDPESSOA').AsInteger       := iIdPessoaAtual;
            ParamByName('COTMESREF').AsString       := sCotMesRef;
            Open;

            If Locate('FLGTITULARCOLET','T',[])
            Then begin
              // rSdTransParticipante := FieldByName('VALORREAL').AsFloat;
              rSdTransParticipante          := FieldByName('VALORRESERVA').AsFloat; // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 8
              vetTotais[3].sMesAno          := wMesAnoFim;
              vetTotais[3].dTotalEmCotas    := FieldByName('VALORRESERVA').AsFloat; // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 8
              vetTotais[3].iIndiceReajuste  := FieldByname('INDICEREAJUSTE').AsInteger;
              vetTotais[3].dSaldoAnterior   := 0
            end;
            If Locate('FLGTITULARCOLET','P',[])
            Then begin
 //              rSdTransPatrocinadora := FieldByName('VALORREAL').AsFloat;
              rSdTransPatrocinadora         := FieldByName('VALORRESERVA').AsFloat; // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 8
              vetTotais[4].sMesAno          := wMesAnoFim;
              vetTotais[4].dTotalEmCotas    := FieldByName('VALORRESERVA').AsFloat; // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 8
              vetTotais[4].iIndiceReajuste  := FieldByname('INDICEREAJUSTE').AsInteger;
              vetTotais[4].dSaldoAnterior   := 0
            end;

            // O PRIMEIRO REGISTRO DA QUERY ESTÁ COM A CONTA DO PARTICIPANTE
            // MONTAR 2 LINHAS DO PARTICIPANTE
            First;            // Gleyber - 27/05/2004 - Pendência 16896

            // CAMILLE -  27.05.2004 - INICIO
            // Se a pessoa não tiver conta de transferencia, colocar 0,00 como valor da cota em todas as linhas
            if (qryContaTransferencia.FieldByName('VALORRESERVA').AsFloat <= 0)
            then dValorDaCota := 0
            else dValorDaCota := 1;

            sFatorDisplay     := FormatFloat('#0.000000000',dValorDaCota);
            // CAMILLE -  27.05.2004 - FINAL

            // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 5
            // Email Christhine : Os saldos de transferência participante e patrocinadora
            // devem conter sempre a data de migração de plano, ou seja, para participantes
            // do METRÔ a data correta é 01/02/1998 e para as demais patrocinadoras 01/12/2000,
            // independente da data de inscrição do participante.
            if Pos('REFER',Sistema.NomeEmpresa) < 0
            then sDataREFER := sDataInicioPlano
            else begin
               if qryHistMovParticipante.FieldByname('IDPLANOPREV').AsInteger = 3 // METRO
               then sDataREFER := '01/02/1998'
               else sDataREFER := '01/12/2000';
            end;
            
            sLinha := '63   '+// PreparaStr(Copy(qryHistMovParticipante.FieldByname('DATAINICIOPLANO').AsString,4,2)+'/'+Copy(qryHistMovParticipante.FieldByname('DATAINICIOPLANO').AsString,7,4),58)+
                              // PreparaStr(Copy(sDataInicioPlano,4,2)+'/'+Copy(sDataInicioPlano,7,4),58)+ // Gleyber - 27/05/2004 - Pendência 16896
                              PreparaStr(Copy(sDataREFER,4,2)+'/'+Copy(sDataREFER,7,4),58)+ // CAMILLE - 01.06.2004 - PENDENCIA 16914
                              PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat),10),10)+
                              PreparaStr(' ',4)+
                              // CAMILLE -  27.05.2004
                              // PreparaStr('1,00000000',10)+
                              PreparaStr(sFatorDisplay,10)+
                              PreparaStr(' ',6)+
                              PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat),10),10); // 9),9); // CAMILLE - 30.04.2003

            Writeln(F,sLinha);
            sAnoMesDisplay    := Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4);
            sAnoMesDisplayAUX := Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4);
            sDataBuscaCota    := IntToStr(TrazUltDiaMes(StrToInt(Copy(wMesAnoFim,6,2)),StrToInt(Copy(wMesAnoFim,1,4))))+'/'+
                                          Copy(wMesAnoFim,6,2)+'/'+
                                          Copy(wMesAnoFim,1,4);
            dValorDaCota := VoltaValorCotacao( qryAux,
                                               qryContaTransferencia.FieldByName('INDICEREAJUSTE').AsString,
                                               qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                               qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                               sDataBuscaCota);
            // CAMILLE - 27.05.2004 - INICIO
            if (qryContaTransferencia.FieldByName('VALORRESERVA').AsFloat <= 0)
            then dValorDaCota := 0;
            // CAMILLE - 27.05.2004 - FIM

            sFatorDisplay     := FormatFloat('#0.000000000',dValorDaCota);


            sLinha := '03   '+PreparaStr(sAnoMesDisplayAUX,58)+
                             PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat),10),10)+
                             PreparaStr(' ',4)+
                             PreparaStr(sFatorDisplay,10)+
                             PreparaStr(' ',6)+
                             PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat*dValorDaCota),10),10); // 9),9); // CAMILLE - 30.04.2003
            Writeln(F,sLinha);

            // O SEGUNDO REGISTRO DA QUERY ESTÁ COM A CONTA DA PATROCINADORA
            // MONTAR 2 LINHAS DO PARTICIPANTE
            Next;

            // CAMILLE - 19.05.2003
            if not Eof
            then begin           // Gleyber - 27/05/2004 - Pendência 16896
               sLinha := '03   '+//PreparaStr(Copy(qryHistMovParticipante.FieldByname('DATAINICIOPLANO').AsString,4,2)+'/'+Copy(qryHistMovParticipante.FieldByname('DATAINICIOPLANO').AsString,7,4),58)+
                                 // PreparaStr(Copy(sDataInicioPlano,4,2)+'/'+Copy(sDataInicioPlano,7,4),58)+ // Gleyber - 27/05/2004 - Pendência 16896
                                 PreparaStr(Copy(sDataREFER,4,2)+'/'+Copy(sDataREFER,7,4),58)+ // CAMILLE - 01.06.2004 - PENDENCIA 16914
                                 PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat),10),10)+
                                 PreparaStr(' ',4)+
                                 PreparaStr('1,00000000',10)+
                                 PreparaStr(' ',6)+
                                 PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat),10),10); // 9),9); // CAMILLE - 30.04.2003

               Writeln(F,sLinha);
               sAnoMesDisplay    := Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4);
               sAnoMesDisplayAUX := Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4);
               sDataBuscaCota    := IntToStr(TrazUltDiaMes(StrToInt(Copy(wMesAnoFim,6,2)),StrToInt(Copy(wMesAnoFim,1,4))))+'/'+
                                             Copy(wMesAnoFim,6,2)+'/'+
                                             Copy(wMesAnoFim,1,4);
               dValorDaCota := VoltaValorCotacao( qryAux,
                                                  qryContaTransferencia.FieldByName('INDICEREAJUSTE').AsString,
                                                  qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                                  qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                                  sDataBuscaCota);
               sFatorDisplay     := FormatFloat('#0.000000000',dValorDaCota);

               sLinha := '03   '+PreparaStr(sAnoMesDisplayAUX,58)+
                                PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat),10),10)+
                                PreparaStr(' ',4)+
                                PreparaStr(sFatorDisplay,10)+
                                PreparaStr(' ',6)+
                                PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',qryContaTransferencia.FieldByname('VALORRESERVA').AsFloat*dValorDaCota),10),10); // 9),9); // CAMILLE - 30.04.2003
               Writeln(F,sLinha);
            end
            else begin           // Gleyber - 27/05/2004 - Pendência 16896
               sLinha := '03   '+//PreparaStr(Copy(qryHistMovParticipante.FieldByname('DATAINICIOPLANO').AsString,4,2)+'/'+Copy(qryHistMovParticipante.FieldByname('DATAINICIOPLANO').AsString,7,4),58)+
                                 // PreparaStr(Copy(sDataInicioPlano,4,2)+'/'+Copy(sDataInicioPlano,7,4),58)+ // Gleyber - 27/05/2004 - Pendência 16896
                                 PreparaStr(Copy(sDataREFER,4,2)+'/'+Copy(sDataREFER,7,4),58)+ // CAMILLE - 01.06.2004 - PENDENCIA 16914                                 
                                 PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',0),10),10)+
                                 PreparaStr(' ',4)+
                                 // CAMILLE - 27.05.2004
                                 // PreparaStr('1,00000000',10)+
                                 PreparaStr('0,00000000',10)+
                                 PreparaStr(' ',6)+
                                 PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',0),10),10);

               Writeln(F,sLinha);

               // CAMILLE - 27.05.2004
               // sFatorDisplay     := FormatFloat('#0.000000000',1);
               sFatorDisplay     := FormatFloat('#0.000000000',0);
               sLinha := '03   '+PreparaStr(sAnoMesDisplayAUX,58)+
                                PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',0),10),10)+
                                PreparaStr(' ',4)+
                                PreparaStr(sFatorDisplay,10)+
                                PreparaStr(' ',6)+
                                PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',0),10),10);
               Writeln(F,sLinha);
            end;
            // FIM - CAMILLE - 19.05.2003
         end;
      end;

      // Montar linhas com TOTAIS DAS CONTAS
      sLinha := '+2'+ PreparaStr(' ',108);

      sLinha := '71                             '+ PreparaStr(' ',63)+
                      Copy(wMesAnoFim,6,2)+'/'+Copy(wMesAnoFim,1,4)+
                      PreparaStr(' ',9);

      sDataBuscaCota := IntToStr(TrazUltDiaMes(StrToInt(Copy(wMesAnoFim,6,2)),StrToInt(Copy(wMesAnoFim,1,4))))+'/'+
                        Copy(wMesAnoFim,6,2)+'/'+
                        Copy(wMesAnoFim,1,4);
      writeln(F,sLinha);

      sLinha := ' 1 '; // CGUEDES: a pedido do Alex - Refer 16/01/2002
      writeln(F,sLinha);

      dTotalAtualizado := 0;

      for i := 1 to 4 do
      begin
         dValorDaCota := VoltaValorCotacao( qryAux,
                                            IntToStr(vetTotais[i].iIndiceReajuste),
                                            qryHistMovParticipante.FieldByname('IdPlanoPrev').AsString,
                                            qryHistMovParticipante.FieldByname('IdTipoReserva').AsString,
                                            sDataBuscaCota);

         If i = 3 Then //transferencia participante
//           dValorAtualizado := rSdTransParticipante
           dValorAtualizado := rSdTransParticipante * dValorDaCota // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 8
         Else If i = 4 Then // transferencia patrocinadora
//           dValorAtualizado := rSdTransPatrocinadora
           dValorAtualizado := rSdTransPatrocinadora * dValorDaCota // CAMILLE - 01.06.2004 - PENDENCIA 16914 - ITEM 8
         Else If i = 2 Then//
           dValorAtualizado := vetTotais[i].dTotalEmCotas * dValorDaCota
         // 07/02/2002 - primeira passagem: contrib. participante
         // Metro: saldo anterior
         Else If iIdPlanoprev = 3 then
         Begin
           // pegar o vlr. do saldo ant. mais vlr. do período
           // converter com índice de 2001/12
           dValorAtualizado := (vetTotais[i].dTotalEmCotas +
                                dValorSaldoCota) *
                                dValorDaCota; // CAMILLE - PENDENCIA 16914 - 01.06.2004 - ITEM 8
                                // dValorUltCota;
         End else // dValorAtualizado := (Trunc(100*(vetTotais[i].dTotalEmCotas * dValorDaCota))) / 100; // CAMILLE - 03.06.2004
                  dValorAtualizado := vetTotais[i].dTotalEmCotas * dValorDaCota;

         sLinha := ' 1 '+PreparaStr(' ',80)+
                        // CAMILLE - 03.06.2004
                        // PreparaStr(AlinhaDireita(FormatFloat('#,###,##0.00',dValorAtualizado),10),10)+
                        PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',dValorAtualizado),10),10)+
                        PreparaStr(' ',17);
         writeln (F, sLinha);
         dTotalAtualizado := dTotalAtualizado + dValorAtualizado;
      end;

      // GRAVAR SALDO TOTAL
      sLinha := '-1 '+PreparaStr(' ',80)+
                     PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',dTotalAtualizado),10),10)+
                     PreparaStr(' ',17);
      writeln(F, sLinha );

      // Gravar observaçoes
      sLinha := '84'+ PreparaStr(' ',3)+ PreparaStr(edObs1.Text,105);
      writeln(F, sLinha );

      sLinha := ' 4'+ PreparaStr(' ',3)+ PreparaStr(edObs2.Text,105);
      writeln(F, sLinha );

      sLinha := ' 4'+ PreparaStr(' ',3)+ PreparaStr(edObs3.Text,105);
      writeln(F, sLinha );

      sLinha := ' 4'+ PreparaStr(' ',3)+ PreparaStr(edObs4.Text,105);
      writeln(F, sLinha );

      // Gravar linhas em branco
      sLinha := '+2'+ PreparaStr(' ',103);
      writeln(F, sLinha);
      sLinha := '12'+ PreparaStr(' ',103);
      writeln(F, sLinha);

      // Gravar nome,endereco,...
      sLinha := '92'+ PreparaStr(' ',23)+                            // Gleyber - Pendência 22093 - 24/04/2006
                      PreparaStr(Copy(sParticipante,1,60), 60)+      // Gleyber - Pendência 22093 - 24/04/2006
                      PreparaStr(' ',17);                            // Gleyber - Pendência 22093 - 24/04/2006
      writeln(F, sLinha);

      qryEndPess.Close;
      qryEndPess.ParamByName('IdEndereco').AsInteger := iIdEndereco;
      qryEndPess.Open;
      if qryEndPess.IsEmpty then
      begin
         sLinha := ' 2'+ PreparaStr(' ',108);
         writeln(F, sLinha);
         sLinha := ' 2'+ PreparaStr(' ',108);
         writeln(F, sLinha);
         sLinha := ' 2'+ PreparaStr(' ',108);
         writeln(F, sLinha);
      end
      else begin
         // Gleyber - Pendência 22093 - 24/04/2006 - Início
         sEndereco := Trim(qryEndPess.FieldByName('Logradouro').AsString);

         If Trim(qryEndPess.FieldByName('Numero').AsString) <> ''
          Then sEndereco := sEndereco+','+ Trim(qryEndPess.FieldByName('Numero').AsString);

         sLinha := ' 2'+ PreparaStr(' ',23)+
                         PreparaStr(Copy(sEndereco,1,60), 60)+
                         PreparaStr(' ',25);
         writeln(F, sLinha);

         sEndereco :=  PreparaStr(Copy(qryEndPess.FieldByName('Complemento').AsString,1,20),20) +'     '+
                       PreparaStr(Copy(qryEndPess.FieldByName('Bairro').AsString,1,20),20);

         sLinha := ' 2'+ PreparaStr(' ',23)+
                         PreparaStr(Copy(sEndereco,1,60), 60)+
                         PreparaStr(' ',25);
         writeln(F, sLinha);

         sLinha := ' 2'+ PreparaStr(' ',23)+
                         PreparaStr(Copy(qryEndPess.FieldByName('Cidade').AsString,1,45), 45)+
                         PreparaStr(Copy(qryEndPess.FieldByName('CodEstado').AsString,1,3), 8)+
                         PreparaStr(' ',32);
         writeln(F, sLinha);
      end;

      // CGUEDES - 07/02/2002 - Inclusão do CEP
      sLinha := ' 2'+ PreparaStr(' ',23)+
                      PreparaStr(copy(qryEndPess.FieldByName('CEP').AsString,1,5)+'-'+
                                 copy(qryEndPess.FieldByName('CEP').AsString,6,3),9)+
                      PreparaStr(' ',40)+                           // Gleyber - Pendência 22266 - 24/04/2006
                      ColocaZeros(IntToStr(iSequencial),6)+         // Gleyber - Pendência 22266 - 24/04/2006
                      PreparaStr(' ',30);                           // Gleyber - Pendência 22266 - 24/04/2006

      writeln(F, sLinha);
         // Gleyber - Pendência 22093 - 24/04/2006 - Fim

      inc(iSequencial);
   end;

   // CGUEDES - 09/01/2002
   CloseFile(F);
   frmAguarde.Apaga;
   Result := True;
end; // ProcessaLayOutTipo2

function TfrmPRelExtPoup.ProcessaConsultaPropria :  boolean;
var sArquivoTemp, sSQL, sSQLTemp, sAnoMesInicio, sAnoMesFinal , sIdsPlanosPrev: string;
    F : TextFile;

    I : Integer;
    Linha     : String;
begin
   Result := False;

   if Trim(edConsulta.Text) = ''
   then begin
      MsgDlg('Selecione a Consulta Desejada. ','Erro', mtError, [mbOk],0);
      Exit;
   end;

   SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
   if not SaveDialog.Execute then Exit;

   AssignFile(F, SaveDialog.FileName);
   Rewrite(F);

   if (cbMes.ItemIndex+1) <= 9
   then  sAnoMesInicio := Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1)
   else  sAnoMesInicio := Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1);

   if (cbMes1.ItemIndex+1) <= 9
   then sAnoMesFinal := Trim(dbseano1.Text)+'/0'+IntToStr(cbMes1.ItemIndex+1)
   else sAnoMesFinal := Trim(dbseano1.Text)+'/'+IntToStr(cbMes1.ItemIndex+1);

   qryPlanos.First;
   sIdsPlanosPrev := '' ;
   while not qryPlanos.Eof do
   begin
      if Trim(sIdsPlanosPrev) = ''
      then sIdsPlanosPrev := qryPlanos.FieldByName('IDPLANOPREV').AsString
      else sIdsPlanosPrev := sIdsPlanosPrev+','+qryPlanos.FieldByName('IDPLANOPREV').AsString;
      qryPlanos.Next;
   end;

   { Inicio Augusto 26/02/2003 - Monta String com as situações }
   QrySituacao.First;
   sSituacoes := '' ;
   while not QrySituacao.Eof do begin
     If QrySituacao.FieldByName('FLGCONSIDERA').AsInteger = 1 Then Begin // CAMILLE - PENDENCIA 16914 - 01.06.2004
        if Trim(sSituacoes) = '' then
          sSituacoes := QrySituacao.FieldByName('IDSITPART').AsString
        else
          sSituacoes := sSituacoes+','+QrySituacao.FieldByName('IDSITPART').AsString;
      End;
      QrySituacao.Next;
   end;
   { Fim Augusto 26/03/2003 }


  // Abrir query com SQL do relatorio
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT D.TEMPLATE AS SQL '+
             ' FROM   DATAVIEW D        '+
             ' WHERE  D.IDDATAVIEW = '+ MSDataView.ValoresChave[0]);
     Open;
     sSQL := FieldByName('SQL').AsString;
  end;

  sArquivoTemp := Sistema.TempDir+'APrevExtratoReserva.tmp';
  sSQLTemp     := Sistema.TempDir+'APrevSQLExtratoReserva.sql';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text := sSQL;
  qryAux.SQL.Add(' AND HISTMOVRESERVA.MESREFERENCIA >= '''+sAnoMesInicio+'''');
  qryAux.SQL.Add(' AND HISTMOVRESERVA.MESREFERENCIA <= '''+sAnoMesFinal +'''');
  qryAux.SQL.Add(' AND HISTMOVRESERVA.IDPLANOPREV IN ('+sIdsPlanosPrev+')');
  
  { Augusto 26/02/2003 }
  if (Trim(sSituacoes) <> '') then begin
    qryAux.SQL.Add(' AND PPP.IDSITPART IN ('+sSituacoes+')');
  end;
  
  try
     qryAux.Open;
  except
     MsgDlg('Erro na abertura da consulta. Verifique.','Erro',mtError,[mbOk],0);
     CloseFile(F);
     Exit;
  end;

  qryAux.First;

  // ********** Gerar arquivo texto
  while not qryAux.Eof do
  begin
     Linha := '';

     For I := 0 To qryAux.FieldCount-1  Do
     Begin
        If (qryAux.Fields[I].DataType In ([ftBlob,ftMemo]))
        Then Begin
          MsgDlg('Encontrado campo de tipo inválido[BLOB ou MEMO]. Verifique.','Erro',mtError,[mbOk],0);
          CloseFile(F);
          Exit;
        End;
        Linha := Linha+ qryAux.Fields[I].AsString;
     End;
     WriteLn(F, Linha);
     qryAux.Next;
  end;
  // ********** FIM da geracao do arquivo texto

  CloseFile(F);
  DeleteFile(sArquivoTemp);
  DeleteFile(sSQLTemp);

  Result := True;
end;

procedure TfrmPRelExtPoup.sbtnConsultaClick(Sender: TObject);
begin
  inherited;
  MSDataView.Executar;

  if not MSDataView.RetornouValor then Exit;

  edConsulta.Text := MSDataView.ValoresChave[1];
end;

procedure TfrmPRelExtPoup.rgrpOrigemClick(Sender: TObject);
begin
  inherited;

  if rgrpOrigem.ItemIndex = 0
  then begin
     rgrpLayOut.Visible   := False;
     lblConsulta.Visible  := True;
     edConsulta.Visible   := True;
     sbtnConsulta.Visible := True;
  end
  else begin
     rgrpLayOut.Visible   := True;
     lblConsulta.Visible  := False;
     edConsulta.Visible   := False;
     sbtnConsulta.Visible := False;
  end;
end;

function TfrmPRelExtPoup.ProcSaldAnterior( FlgTitular: Char;
                                           var dValorSaldoCota: Double): String;
begin
{ Identação da linha a ser criada.
22          Saldo Anterior                                      0,0000000  0,000000000            0,00'
}

  // alimenta query aux.
  With qrySaldoAnterior Do
  Begin
    Close; Prepare;
//    ParamByName('DATAINICIO').AsString := qryHistMovParticipante.ParamByName('MESREFATU').AsString;
    ParamByName('IDPESSOA').AsInteger := qryHistMovParticipante.FieldByName('IDPESSOA').AsInteger;
    ParamByName('FLGTITULAR').AsString := FlgTitular;
    Open;
    If Not IsEmpty Then
    Begin
      If FlgTitular = 'T' Then
        // armazena vlr da cota para usar no somatório do participante.
        dValorSaldoCota := qrySaldoAnterior.FieldByname('VALORCOTAS').AsFloat;
{      Result := '22  '+
                 PreparaStr(' ',8)+
                 PreparaStr('Saldo Anterior',40)+
                 PreparaStr(' ',10)+
                 PreparaStr(AlinhaDireita(FormatFloat('#0.00000000',FieldByname('VALORCOTAS').AsFloat),11),11)+
                 PreparaStr(' ',1)+ // cguedes - 16/01/2002: anterior era 3
                 PreparaStr(' ',11)+
                 PreparaStr(' ',6)+ // anterior era 8
                 PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',FieldByname('VALORREAL').AsFloat),10),10);
 }
      Result := '22  '+
                 PreparaStr(' ',8)+
                 PreparaStr('Saldo Anterior',40)+
                 PreparaStr(' ',10)+
                 PreparaStr(AlinhaDireita(FormatFloat('#0.0000000',FieldByname('VALORCOTAS').AsFloat),11),11)+
                 PreparaStr(' ',2)+ // cguedes - 16/01/2002: anterior era 3
                 PreparaStr(AlinhaDireita(FormatFloat('#0.000000000',FieldByname('VALORINDICE').AsFloat),11),11)+
                 PreparaStr(' ',6)+ // anterior era 8
                 PreparaStr(AlinhaDireita(FormatFloat('#,##0.00',FieldByname('VALORREAL').AsFloat),10),10);




    End
    Else Result := '22          Saldo Anterior                                      0,0000000  0,000000000            0,00';
  End;
end;


procedure TfrmPRelExtPoup.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  If MontaSelect1.RetornouValor Then
  Begin
    // preenche dados na tela e variável
    sIdPessoa           := MontaSelect1.ValoresChave[0];
    edParticipante.Text := MontaSelect1.ValoresChave[1];
    edMatricula.text    := MontaSelect1.ValoresChave[2];
    edInscr.Text        := MontaSelect1.ValoresChave[3];
  End Else
  Begin
    sIdPessoa           := '';
    edParticipante.Clear;
    edMatricula.Clear;
    edInscr.Clear;
  End;
end;

function TfrmPRelExtPoup.VerificaSeTemTipo1 ( wMesAnoIni, wMesAnoFim : string; piIdPlanoPrev : longint) : boolean;
var sSQL : string;
begin
   Result := False;

   sSQL :=  ' SELECT 1 AS TIPO, HSM.IDPESSJUR,      HSM.IDPLANOPREV,                                           '+ // CAMILLE - 01.06.2004
            '        HSM.IDPESSOA,       HSM.SEQPROPOSTA,            PAT.NOME AS PATROCINADORA,     '+
            '        EL.MATRICULA,       P.NOME   AS PARTICIPANTE,   P.NUMDOCUMENTO AS CPF,         '+
            '        PL.NOME AS TIPOPLANO, P.IDENDCORRESP,           R.CODHIERARQUIA,               '+
            '        R.NOME,               R.INDICEREAJUSTE,         '+
            '        HSM.VALORINDICE,         '+
            '        R.FLGTITULARCOLET,    HSM.MESREFERENCIA,        R.IDTIPORESERVA,               '+
            '        SUBSTR(HSM.MESREFERENCIA,6,2)||''/''||SUBSTR(HSM.MESREFERENCIA,1,4) AS MESANO, '+
            '        SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRREAL, -HSM.VLRREAL)) AS VALORREAL,        '+
            '        SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOTAS)) AS VALORCOTAS      '+
            ' FROM   PESSOA PAT, PESSOA P, PATRO PT, PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PPP,    '+
            '        RESERVAXPLANO R, HISTMOVRESERVA HSM                                             ';// CAMILLE - 28.04.2004 - COTACAOMOEDA COT,                          '+

   if not chkInclui13.Checked
   then sSQL := sSQL + 'WHERE (HSM.MESREFERENCIA >= '''+wMesAnoIni+''')                                       '+
                       'AND   (HSM.MESREFERENCIA <= '''+wMesAnoFim+''')                                       '+
                       'AND   (PPP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+')'                                // CAMILLE - 08.05.2003
   else sSQL := sSQL + 'WHERE ( '+
                       '        ( (HSM.MESREFERENCIA >= '''+wMesAnoIni+''') AND   (HSM.MESREFERENCIA <= '''+wMesAnoFim+''') ) OR  '+
                       '        ( (HSM.MESREFERENCIA = '''+edAno13.Text+'/13'') )                  '+
                       '       )                                                                   '+
                       'AND   (PPP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+')' ;
   sSQL := sSQL + 'AND PPP.IDPESSOA = '+qryHistMovParticipante.FieldByName('IDPESSOA').AsString;

   if (Trim(sSituacoes) <> '')
   then sSQL := sSQL + ' AND PPP.IDSITPART IN ('+sSituacoes+')' ;

   sSQL := sSQL + ' AND   (HSM.IDPESSOA       = PPP.IDPESSOA)                                             '+
             ' AND   (HSM.IDCONTRIBUICAO IS NOT NULL OR HSM.IDBENEFICIO IS NOT NULL OR (R.CODHIERARQUIA IN (''10104'',''10103'') ) ) '+ // CAMILLE - 02.06.2004
             ' AND    (PT.IDPESSOA       = PPP.IDPESSJUR)                                            '+ // CAMILLE - 23.06.2003
             ' AND    (PT.IDFUNDACAO     = '+IntToStr(iIdFundacao)+')                                '+ // CAMILLE - 23.06.2003
             'AND   (PL.IDPLANOPREV  = PPP.IDPLANOPREV )                                            '+
             'AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)                                             '+
             'AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)                                           '+
             'AND   (R.FLGCOLETIVA     = 0)                                                         '+
             'AND   (R.FLGCONTROLE     = 0)                                                         '+
             'AND   (R.FLGTRANSFERENCIA = 0)                                                        '+
             'AND   (HSM.IDPESSJUR     = PPP.IDPESSJUR)                                             '+ // Gleyber - 14/05/2004 - Pendência 16783
             'AND   (PAT.IDPESSOA      = PPP.IDPESSJUR)                                             '+
             'AND   (EL.IDPESSJUR      = PPP.IDPESSJUR)                                             '+
             'AND   (EL.IDPESSOA       = PPP.IDPESSOA)                                              '+
             'AND   (P.IDPESSOA        = PPP.IDPESSOA)                                              '+
             'AND   (EL.IDPESSJUR      = PPP.IDPESSJUR)                                             '+
             'AND   (EL.IDPESSOA       = PPP.IDPESSOA)                                              '+
             'GROUP BY HSM.IDPESSJUR, HSM.IDPLANOPREV, HSM.IDPESSOA,       HSM.SEQPROPOSTA,         '+
             '       PAT.NOME,                                                                      '+
             '       P.NOME, EL.MATRICULA,                                                          '+
             '       PPP.INSCRICAODATA,                                                             '+ // Gleyber - 14/05/2004 - Pendência 16783
             '       P.NUMDOCUMENTO, P.IDENDCORRESP,                                                '+
             '       PL.NOME, R.CODHIERARQUIA, R.NOME,                                              '+
             '       R.INDICEREAJUSTE,   HSM.VALORINDICE, R.FLGTITULARCOLET,                        '+
             '       HSM.MESREFERENCIA, R.IDTIPORESERVA                                             ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   if not qryAux.IsEmpty
   then Result := True;
end;

procedure TfrmPRelExtPoup.bbtnComparaClick(Sender: TObject);
var sPlanos                 : string;
    sSQL                    : string;
    sLinha                  : string;
    F                       : TextFile;
    i                       : longint;
    iTotal                  : longint;
    iTotalDiverg            : longint;
    bConsideraContaControle : boolean;
    bConsideraContaSemHst   : boolean;
begin
  inherited;

  // CAMILLE - 04.06.2004
  // ROTINA PARA COMPARAR O SALDO DA RESERVAPART COM A ULTIMA LINHA DA HISTMOVRESERVA
  QrySituacao.First;
  sSituacoes := '' ;
  while not QrySituacao.Eof do begin
     If QrySituacao.FieldByName('FLGCONSIDERA').AsInteger = 1 Then Begin // CAMILLE - PENDENCIA 16914 - 01.06.2004
       if Trim(sSituacoes) = '' then
         sSituacoes := QrySituacao.FieldByName('IDSITPART').AsString
       else
         sSituacoes := sSituacoes+','+QrySituacao.FieldByName('IDSITPART').AsString;
     End;
     QrySituacao.Next;
  end;

  qryPlanos.First;
  sPlanos := '';
  while not qryPlanos.Eof do
  begin
     if qryPlanos.FieldByName('FlgConsidera').AsInteger = 1 then
     begin
       if Trim(sPlanos) = '' then
         sPlanos := qryPlanos.FieldByName('IDPLANOPREV').AsString
       else
         sPlanos := sPlanos+','+qryPlanos.FieldByName('IDPLANOPREV').AsString;
     end;
     qryPlanos.Next;
  end;

  if MsgDlg('Deseja considerar as contas de controle ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
  then bConsideraContaControle := True
  else bConsideraContaControle := False;

  if MsgDlg('Deseja considerar as contas que não possuem movimentação no histórico ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
  then bConsideraContaSemHst := True
  else bConsideraContaSemHst := False;

  SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
  if not SaveDialog.Execute then Exit;

  with qryHistMovParticipante do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,     '+
             '        EL.MATRICULA, R.IDTIPORESERVA, R.CODHIERARQUIA, R.NOME,        '+
             '        RP.VALORRESERVA                                                '+
             ' FROM   ELEGPATRO EL, RESERVAPART RP, PARTPREVPLAN PP, RESERVAXPLANO R '+
             ' WHERE  PP.IDPLANOPREV IN ('+sPlanos+')                                '+
             ' AND    PP.FLGDESATIVADO = 0                                           ');
     if Trim(sSituacoes) <> ''
     then SQL.Add(' AND PP.IDSITPART IN ('+sSituacoes+')                             ');

     if not bConsideraContaControle
     then SQL.Add('AND  R.FLGCONTROLE = 0                                            ');
     SQL.Add(' AND RP.IDPESSJUR    = PP.IDPESSJUR                                    '+
             ' AND RP.IDPLANOPREV  = PP.IDPLANOPREV                                  '+
             ' AND RP.IDPESSOA     = PP.IDPESSOA                                     '+
             ' AND RP.SEQPROPOSTA  = PP.SEQPROPOSTA                                  '+
             ' AND EL.IDPESSJUR    = PP.IDPESSJUR                                    '+
             ' AND EL.IDPESSOA     = PP.IDPESSOA                                     '+
             ' AND R.IDPLANOPREV   = RP.IDPLANOPREV                                  '+
             ' AND R.IDTIPORESERVA = RP.IDTIPORESERVA                                '+
             ' ORDER BY PP.IDPLANOPREV, EL.MATRICULA, RP.IDTIPORESERVA               ');
     Open;
     if IsEmpty then Exit;

     AssignFile(F, SaveDialog.FileName);
     Rewrite(F);
     i := 0;
     iTotal := RecordCount;
     iTotalDiverg := 0;

     writeln(F,'-------------------------------------------------------------------------------------------------------------------');
     writeln(F,'COMPARAÇÃO DE SALDO DE RESERVA COM HISTÓRICO - DATA : '+DateToStr(date));
     writeln(F,'-------------------------------------------------------------------------------------------------------------------');
     writeln(F,'Opções Selecionadas : ');
     if bConsideraContaControle
     then writeln(F,'       - Considerar Conta de Controle   : Sim ')
     else writeln(F,'       - Considerar Conta de Controle   : Não ');
     if bConsideraContaSemHst
     then writeln(F,'       - Considerar Conta sem Histórico : Sim ')
     else writeln(F,'       - Considerar Conta sem Histórico : Não ');
     writeln(F,'-------------------------------------------------------------------------------------------------------------------');
     sLinha := PreparaStr('MATRICULA '     ,15)+
               PreparaStr('RESERVA(COD)'   ,15)+
               PreparaStr('RESERVA'        ,40)+
               PreparaStr(' '              ,5)+
               PreparaStr('SALDO ATUAL'    ,20)+
               PreparaStr('SALDO HIST.'    ,20)+
               PreparaStr('DIFERENÇA'      ,20);               
     writeln(F,sLinha);
     writeln(F,'-------------------------------------------------------------------------------------------------------------------');

     First;
     while not Eof do
     begin
        inc(i);
        frmAguarde.Mostra('Processando '+IntToStr(i)+' de '+IntToStr(iTotal)+' ... ');
        Application.ProcessMessages;
        sSQL := ' SELECT IDTIPORESERVA, SALDOCOTAS                                                                   '+
                ' FROM   HISTMOVRESERVA H                                                                            '+
                ' WHERE  IDPESSJUR     = '+FieldByName('IDPESSJUR').AsString                                          +
                ' AND    IDPLANOPREV   = '+FieldByName('IDPLANOPREV').AsString                                        +
                ' AND    IDPESSOA      = '+FieldByName('IDPESSOA').AsString                                           +
                ' AND    SEQPROPOSTA   = '+FieldByName('SEQPROPOSTA').AsString                                        +
                ' AND    IDTIPORESERVA = '+FieldByName('IDTIPORESERVA').AsString                                      +
                ' AND    IDHISTRESERVA = (SELECT MAX(IDHISTRESERVA)                                                  '+
                '                         FROM   HISTMOVRESERVA H2                                                   '+
                '                         WHERE  H2.IDPESSJUR = H.IDPESSJUR                                          '+
                '                         AND    H2.IDPLANOPREV = H.IDPLANOPREV                                      '+
                '                         AND    H2.IDPESSOA = H.IDPESSOA                                            '+
                '                         AND    H2.SEQPROPOSTA = H.SEQPROPOSTA                                      '+
                '                         AND    H2.IDTIPORESERVA = H.IDTIPORESERVA                                  '+
                '                         AND    H2.MESREFERENCIA = ( SELECT MAX(MESREFERENCIA)                      '+
                '                                                     FROM   HISTMOVRESERVA H3                       '+
                '                                                     WHERE  H3.IDPESSJUR = H2.IDPESSJUR             '+
                '                                                     AND    H3.IDPLANOPREV = H2.IDPLANOPREV         '+
                '                                                     AND    H3.IDPESSOA = H2.IDPESSOA               '+
                '                                                     AND    H3.SEQPROPOSTA = H2.SEQPROPOSTA         '+
                '                                                     AND    H3.IDTIPORESERVA = H2.IDTIPORESERVA )   '+
                '                        )                                                                           ';
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        qryAux.Open;
        if Abs(FieldByName('VALORRESERVA').AsFloat - qryAux.FieldByName('SALDOCOTAS').AsFloat) > 0.01
        then begin
           if (not bConsideraContaSemHst) and (qryAux.FieldByName('SALDOCOTAS').AsFloat <= 0)
           then begin
              Next;
              continue;
           end;
           sLinha := PreparaStr(FieldByName('MATRICULA').AsString                                  ,15)+
                     PreparaStr(FieldByName('CODHIERARQUIA').AsString                              ,15)+
                     PreparaStr(Copy(FieldByName('NOME').AsString,1,40)                            ,40)+
                     PreparaStr(' '              ,5)+
                     PreparaStr(FormatFloat('#0.0000000',FieldByName('VALORRESERVA').AsFloat)      ,20)+
                     PreparaStr(FormatFloat('#0.0000000',qryAux.FieldByName('SALDOCOTAS').AsFloat) ,20)+
                     PreparaStr(FormatFloat('#0.0000000',FieldByName('VALORRESERVA').AsFloat-qryAux.FieldByName('SALDOCOTAS').AsFloat),20);
           writeln(F,sLinha);
           inc(iTotalDiverg);
        end;
        Next;
     end; // while
  end; // with
  writeln(F,'-------------------------------------------------------------------------------------------------------------------');
  writeln(F,IntToStr(iTotalDiverg)+' divergências encontradas.');
  writeln(F,'-------------------------------------------------------------------------------------------------------------------');

  CloseFile(F);
  frmAguarde.Apaga;
  MsgDlg('Comparação Terminada com Sucesso.','Informação',mtInformation,[mbOK],0);
end;

// Gleyber - 22/06/2004 - Pendência 17056 - Início
function TfrmPRelExtPoup.AchaIndiceVarPatr(piIdpessjur: Integer; psIndice :String): String;
begin
  Case piIdPessjur of
    1       : Result := '133';
    2       : Result := '136';
    3       : Result := '134';
    4       : Result := '15';
    111     : Result := '135';
    1111609 : Result := '133';
    1111740 : Result := '133';
    1111750 : Result := '133';
    1111754 : Result := '133';
    1111760 : Result := '133';
    1111762 : Result := '133';
    1213000 : Result := '15';
    1547265 : Result := '147';
    Else      Result := psIndice;
  End;
end;
// Gleyber - 22/06/2004 - Pendência 17056 - Fim

end.
{
(SELECT MAX(HSM.MESREFERENCIA)
				    FROM   RESERVAXPLANO R, HISTMOVRESERVA HSM, COTACAOMOEDA COT
				    WHERE HSM.MESREFERENCIA < :DATAINICIO
				    AND   HSM.IDPESSOA = :IDPESSOA
				    AND   (COT.MOECODIGO      = R.INDICEREAJUSTE)
				    AND   (TO_CHAR(COT.COTDATA,'YYYY/MM') = TO_CHAR(HSM.DATAALIMENTACAO,'YYYY/MM')   )
				    AND   (HSM.IDPLANOPREV    = 3)
				    AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)
				    AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)
				    AND   (R.FLGCOLETIVA     = 0)
				    AND   (R.FLGCONTROLE     = 0)
				    AND   (R.FLGTRANSFERENCIA = 0))




SELECT
       SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOTAS) * COT.COTVALOR) AS VALORREAL,
       SUM(DECODE(HSM.FLGENTRADA, 1, HSM.VLRCOTAS, -HSM.VLRCOTAS)) AS VALORCOTAS
FROM   RESERVAXPLANO R, HISTMOVRESERVA HSM, COTACAOMOEDA COT
WHERE HSM.MESREFERENCIA <= '2000/13'
AND   (COT.MOECODIGO      = R.INDICEREAJUSTE)
AND   (TO_CHAR(COT.COTDATA,'YYYY/MM') = TO_CHAR(HSM.DATAALIMENTACAO,'YYYY/MM')   )
AND   HSM.IDPESSOA = :IDPESSOA
AND   (HSM.IDPLANOPREV    = 3)
AND   (R.IDPLANOPREV   = HSM.IDPLANOPREV)
AND   (R.IDTIPORESERVA = HSM.IDTIPORESERVA)
AND   (R.FLGCOLETIVA     = 0)
AND   (R.FLGCONTROLE     = 0)
AND   (R.FLGTRANSFERENCIA = 0)
AND   (R.FLGTITULARCOLET  = :FLGTITULAR)


                                    }

{
SELECT MAX(H.MESREFERENCIA) AS MESREFERENCIA,
       SUM(DECODE(H.FLGENTRADA,1,H.VLRCOTAS,-H.VLRCOTAS)) AS SALDOCOTAS,
       SUM(DECODE(H.FLGENTRADA,1,H.VLRREAL,-H.VLRREAL))   AS SALDOREAL,
       MAX(H.VALORINDICE) AS VALORINDICE
FROM   HISTMOVRESERVA H, RESERVAXPLANO R,
                         ( SELECT IDTIPORESERVA, MESREFERENCIA
                           FROM   HISTMOVRESERVA
                           WHERE  IDPESSOA      = :IDPESSOA
                           AND    SEQPROPOSTA   = :SEQPROPOSTA
                           AND    IDPESSJUR     = :IDPESSJUR
                           AND    IDPLANOPREV   = :IDPLANOPREV
                           AND    (IDTIPORESERVA,IDHISTRESERVA) IN (SELECT IDTIPORESERVA, MAX(IDHISTRESERVA)
                                                   FROM   HISTMOVRESERVA
                                                   WHERE  IDPESSOA      = :IDPESSOA
                                                   AND    SEQPROPOSTA   = :SEQPROPOSTA
                                                   AND    IDPESSJUR     = :IDPESSJUR
                                                   AND    IDPLANOPREV   = :IDPLANOPREV
                                                   AND    MESREFERENCIA < :ANOMESINI GROUP BY IDTIPORESERVA ) ) ULTIMOMES

WHERE  H.IDPESSOA         = :IDPESSOA
AND    H.SEQPROPOSTA      = :SEQPROPOSTA
AND    H.IDPESSJUR        = :IDPESSJUR
AND    H.IDPLANOPREV      = :IDPLANOPREV
AND    H.IDTIPORESERVA    = ULTIMOMES.IDTIPORESERVA
AND    H.MESREFERENCIA    <  ULTIMOMES.MESREFERENCIA
AND    R.IDPLANOPREV      = H.IDPLANOPREV
AND    R.IDTIPORESERVA    = H.IDTIPORESERVA
AND    R.FLGCOLETIVA      = 0
AND    R.FLGCONTROLE      = 0
AND    R.FLGTRANSFERENCIA = 0
AND    R.FLGTITULARCOLET  = :FLGTITULAR







}
