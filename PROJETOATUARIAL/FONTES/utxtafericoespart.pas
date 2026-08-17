{-------------------------------------------------------------------------------
* Módulo        : TXT de Aferições
* Unit          : ( UTXTAfericoes.pas )
* Form          : frmTXTdeAfericaoPart
* Desenvolvedor : Rafael Gomes dos Santos
* Finalidade    : Calcula varios dados referentes
                  ao Participante ( de acordo com o plano selecionado )
                  e grava em um arquivo TXT
{----------------------------------------------------------------------------------
  SELECT PRINCIPAL                                       PRESENTE NA QUERY
-----------------------------------------------------------------------------------
* Codigo da Patrocinadora[3]                           S
* Numero de Inscrição[4]                               S
* Sexo[2]                                              S
* Est.Civil[5]                                         S
* Dt.Nascimento[6]                                     S
* Dt.Admissão[7],                                      S
* Tempo de Serviço Anterior[9],                        S ( Utilizado para Cálculo )
* Dt.de Inscrição[10],                                 S
* Sit.Participante[11]                                 OK ( Pendente )
* Codigo de Sub-Massa[9]                               OK( Pendente )
* Salario de Part. da Data de Referência[10]           S
* Salario de Partcipação na Inscrição[11],             S
* Percentual de Contrib.Básica Complementar[12]          - OK ( Calculado )
* Percentual de Contrib. Facultativa do Participante[13] - OK ( Calculado )
* Saldo de Conta de Participante no Último dia do Mês de referência[14]  - OK ( Calculado )
* Saldo de Conta de Patrocinadora no Ultimo dia do Mês de Referência[15] - OK( Calculado )
* Idade de Ingresso no INSS[16]                                                  - OK ( É Calculado )
* Tempo de Contribuicao para o INSS ( em anos e Meses )na data de Referência[17] - OK ( É Calculado )
-------------------------------------------------------------------------------}



unit UTXTAfericoesPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls, Mask, wwdblook,
  Wwdatsrc, DBCtrls,FileCtrl, Grids, {DBGridt, }Spin, Wwdbigrd,
  Wwdbgrid, Wwdbgrd2, checklst, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmTXTdeAfericaoPart = class(TfrmOkCancelar)
    QryPrincipal: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    Path: TEdit;
    wwDSPlanPrev: TwwDataSource;
    QryPlanPrev: TwwQuery;
    GroupBox1: TGroupBox;
    LabelAguarde: TLabel;
    ProgressBarTXTAfericoes: TProgressBar;
    LabelTotReg: TLabel;
    QryReservasDoParticipante: TwwQuery;
    QryContribuicoes: TwwQuery;
    QryBeneficios: TwwQuery;
    QryContribuicoesIDCONTRIBUICAO: TFloatField;
    QryContribuicoesVALORBASE1: TFloatField;
    QryQuadroConvenio: TwwQuery;
    QryIndiceReajuste: TwwQuery;
    QryBeneficiosIDBENEFICIO: TFloatField;
    QryBeneficiosIDSITBENEFICIO: TFloatField;
    QryBeneficiosDATAFINAL: TDateTimeField;
    QryPeriodicidade: TwwQuery;
    QryGenerica: TwwQuery;
    DriveComboBoxAfericoes: TDriveComboBox;
    DirectoryListBoxAfericoes: TDirectoryListBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    QrySalPartDataDeReferencia: TwwQuery;
    QrySalPartDataDeInscricao: TwwQuery;
    QryContribNaoIncidentes: TwwQuery;
    GroupBox2: TGroupBox;
    LabelPercentualDeAlimentacao: TLabel;
    Label1: TLabel;
    sePercentualDeAlimentacao: TSpinEdit;
    DataDeAfericao: TCMDateTimePicker;
    cbContabContribNaoPresentesNasReservas: TCheckBox;
    QryPlanPrevPatro: TwwQuery;
    CheckListBoxPlanPrev: TCheckListBox;
    CheckListBoxPlanPrevPatro: TCheckListBox;
    Label7: TLabel;
    QryPlanPrevPatroIDPESSJUR: TFloatField;
    QryPlanPrevPatroNOME: TStringField;
    QryPlanPrevIDPLANOPREV: TFloatField;
    QryPlanPrevNOME: TStringField;
    QryReservasDoParticipanteIDPESSOA: TFloatField;
    QryReservasDoParticipanteIDTIPORESERVA: TFloatField;
    QryReservasDoParticipanteSaldoDeCotas: TFloatField;
    QryReservasDoParticipanteINDICEREAJUSTE: TFloatField;
    QryReservasDoParticipanteFLGTITULARCOLET: TStringField;
    QryReservasDoParticipanteFLGCONTROLE: TFloatField;
    QryValEspxValRec: TwwQuery;
    QryValEspxValRecMESCOBRANCA: TStringField;
    QryValEspxValRecTIPO: TFloatField;
    QryValEspxValRecVALORESPERADO: TFloatField;
    QryValEspxValRecVALORRECEBIDO: TFloatField;
    QryValEspxValRecSITRECEBIMENTO: TStringField;
    QryValEspxValRecIDMOTIVO: TFloatField;
    spbSobre: TSpeedButton;
    pnlSobre: TPanel;
    pnlCabec: TPanel;
    pnlText: TPanel;
    Label8: TLabel;
    Memo1: TMemo;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnConfirmarExit(Sender: TObject);
    procedure DirectoryListBoxAfericoesChange(Sender: TObject);
    procedure cbContabContribNaoPresentesNasReservasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckListBoxPlanPrevClickCheck(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spbSobreClick(Sender: TObject);
  private
    {--------------------------------------------------
    *  IdPessJur,IdPlanoPrev : Id's de Parametros
    *  Vetor que conterá os Id's
    *--------------------------------------------------}
    IdPessJurs   : TStringList;
    IdPlanPrevs  : TStringList;

    { Private declarations }
  public
    Procedure MontaQryPrincipal;
    procedure FillCheckListBoxPlanPrev(Sender: TObject);
    procedure FillCheckListBoxPlanPrevPatro(Sender: TObject);
    function  VoltaValorCotacao(sIndiceReajuste, sDataMov : String) : Double;
    function  StrZero(Numero : Real ; qtdezeros,Decimais: integer): string;
    Function  SalvarEmTXTdeAfericaoPart( NomeDoTXT : String ): Boolean;
    procedure EnabledControlesParametrizadores(Habilitar :Boolean);
  end;

var
  frmTXTdeAfericaoPart: TfrmTXTdeAfericaoPart;



implementation

{$R *.DFM}

Uses  FTelaAut, UMensErro, UDataBase; 


procedure TfrmTXTdeAfericaoPart.EnabledControlesParametrizadores(Habilitar :Boolean);
begin
  if ( Habilitar ) Then
      begin
          cbContabContribNaoPresentesNasReservas.Enabled:=TRUE;

          DataDeAfericao.Enabled  := TRUE;
          sePercentualDeAlimentacao.Enabled := TRUE;
          bbtnConfirmar.Enabled  := TRUE;
          bbtnCancelar.Enabled := TRUE;
          bbtnSair.Enabled  := TRUE;
      end
  else
      begin
          cbContabContribNaoPresentesNasReservas.Enabled:=FALSE;

          DataDeAfericao.Enabled  := FALSE;
          sePercentualDeAlimentacao.Enabled := FALSE;
          bbtnConfirmar.Enabled  := FALSE;
          bbtnCancelar.Enabled := FALSE;
          bbtnSair.Enabled  := FALSE;
      end;
end;

// Calcula o valor da Ultima Cotação da Moeda
function TfrmTXTdeAfericaoPart.VoltaValorCotacao(sIndiceReajuste, sDataMov : String) : Double;
var
    stipoMoeda : String;
begin
 //transformar o número de cotas da reserva em moeda

 Try
    QryPeriodicidade.Close;
    QryPeriodicidade.ParamByName('IndiceReajuste').AsInteger:= StrToInt(sIndiceReajuste);
    QryPeriodicidade.Open;
    if (QryPeriodicidade.IsEmpty) then
       begin
          RESULT := 0;
          QryPeriodicidade.Close;
          EXIT;
       end;
 Except
    raise;
    RESULT := 0;
    QryPeriodicidade.Close;
    EXIT;
 End;

 sTipoMoeda := QryPeriodicidade.FieldByName('MOEPERIODICIDADE').AsString;

 QryGenerica.Close;
 QryGenerica.SQL.Clear;
 if sTipoMoeda = 'M' Then Begin
    QryGenerica.SQL.add('SELECT  COTVALOR ' +
                   ' FROM COTACAOMOEDA ' +
                   ' WHERE MOECODIGO = ' + sIndiceReajuste +
                   ' AND COTDATA IN ' +
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = ' +sIndicereajuste +
                   ' AND (COTMESREF <= '''+copy(sDataMov,4,2)+copy(sDataMov,7,4)+ ''')');
  end
 else begin
    QryGenerica.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+ sIndiceReajuste +
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste +
                   ' AND COTDATA <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) ');

  end;
  try
     QryGenerica.Open;
     if not(QryGenerica.IsEmpty) then
         begin
             RESULT :=  QryGenerica.Fieldbyname('COTVALOR').AsFloat;
         end
     else
         begin
            //erro - não encontrou cotacao para moeda
            RESULT := 0;
         end;
     QryGenerica.Close;
     EXIT;
  except
     QryGenerica.Close;
     RESULT := 0;
     EXIT;
  end;
end;


function TfrmTXTdeAfericaoPart.StrZero(Numero : Real ; qtdezeros,Decimais: integer): string;
var tamanho,y : integer;
xdeci,xsig : string;
begin
Str(Numero:qtdezeros:Decimais, xdeci);
xdeci := trimleft(trimright(xdeci));
tamanho := length(xdeci);
xsig := '';
for y := 1 to (qtdezeros-tamanho) do
    xsig := xsig + '0';
Result := xsig+xdeci;
end;

Procedure  TfrmTXTdeAfericaoPart.MontaQryPrincipal;
var
   i : Byte;
   sPessJur,sPlanPrev: String;

begin
 // Planos
 sPlanPrev:='(';
 if ( IdPlanPrevs.Count = 0 ) Then
    begin
      for i:= 0 To CheckListBoxPlanPrev.Items.Count - 1 do
         begin
            sPlanPrev:=sPlanPrev +'(pp.IdPlanoPrev='+Copy( CheckListBoxPlanPrev.Items[i],Pos(',',CheckListBoxPlanPrev.Items[i]) + 1,Length(CheckListBoxPlanPrev.Items[i]))+')'+'OR';
         end;
      Delete(sPlanPrev,Length(sPlanPrev)-1,2);
      sPlanPrev:=sPlanPrev+')';
    end
 else
    begin
      for i:= 0 To IdPlanPrevs.Count - 1 do
         begin
            sPlanPrev:=sPlanPrev +'(pp.IdPlanoPrev='+IdPlanPrevs.Strings[i]+')OR';
         end;
      Delete(sPlanPrev,Length(sPlanPrev)-1,2);
      sPlanPrev:=sPlanPrev+')';
    end;

 // Patrocinadoras
 sPessJur:='(';
 if ( IdPessJurs.Count = 0 ) Then
    begin
       for i:= 0 To CheckListBoxPlanPrevPatro.Items.Count -1 do
         begin
             sPessJur:=sPessJur +'(pp.IdPessJur='+Copy( CheckListBoxPlanPrevPatro.Items[i],Pos(',',CheckListBoxPlanPrevPatro.Items[i]) + 1,Length(CheckListBoxPlanPrevPatro.Items[i]))+')'+'OR';
         end;
       Delete(sPessJur,Length(sPessJur)-1,2);
       sPessJur:=sPessJur+')';
    end
 else
    begin
      for i:= 0 To IdPessJurs.Count - 1  do
	 begin
            sPessJur:=sPessJur +'(pp.IdPessJur='+IdPessJurs.Strings[i]+')OR';
         end;
      Delete(sPessJur,Length(sPessJur)-1,2);
      sPessJur:=sPessJur+')';
    end;

 QryPrincipal.Close;
 QryPrincipal.SQL.Clear;
  // Monta Query Principal Genérica .
  QryPrincipal.SQL.Add('SELECT DISTINCT pp.IdPessoa,pp.IdPlanoPrev,pp.IdPessJur,DECODE(pp.IdPessJur,99,''001'',1,''002'') As '+'"CodPatro"'+
			     ' ,pp.InscricaoNumero,pf.Sexo,pf.EstCivil,pf.DataNasc,ep.DataAdmissao,'+
                             ' ep.TempoServAnterior,pp.InscricaoData,pp.IdSitPart, S.FLGINTERNO'+
                             ' FROM   PESSOA p,PessoaFisica pf,PARTPREVPLAN  pp,ELEGPATRO ep, SITPART S'+
                             ' WHERE ( p.IdPessoa=pf.IdPessoa  )'+
                             ' AND   ( pf.IdPessoa=pp.IdPessoa )'+
                             ' AND   ( pf.IdPessoa=ep.IdPessoa )'+
                             ' AND   (' + sPlanPrev + ' AND ' + sPessjur+')'+
                             ' AND 	( pp.IdSitPart = S.IdSitPart) '+
                             ' AND   ( pp.InscricaoData <= TO_DATE('+''''+DataDeAfericao.Text+''''+',''dd/mm/yyyy''))  ORDER BY pp.inscricaonumero ');

   Try
      QryPrincipal.Open;
   Except
      QryPrincipal.Close;
      raise;
   end;

end;
{---------------------------------------------------------------------
  Finalidade   : Grava em um arquivo TXT um Histórico das Aferições de
                 reservas dos Participantes .
  Forma de Uso :
  Arquivo TXT  : ATXXAAMM ( Afericao,Tipo, , AAMM )
  Funções auxiliares :
----------------------------------------------------------------------}

function TfrmTXTdeAfericaoPart.SalvarEmTXTdeAfericaoPart( NomeDoTXT : String ): Boolean;
var
   vRubrica : LongInt;
   estrutura     : TextFile;
   sDiretorio    : String[128];
   CodigoDeSubMassa : String[2];
   i,DuracaoDoBeneficio,Contador,SituacaoDoParticipante : Integer;
   IdadeAtual   : Word;
   vValorRef, IdadeDeIngressoINSS,TempoContribINSS,AnosDeBeneficio,MesesDeBeneficio,nValorEsperado : Real;
   MesParam,AnoParam    : Word;
   MesQry,AnoQry,DiaQry : Word;
   AnosContrib,MesesContrib,ContribBasicaComplementar,ContribSuplementarFacultPart : Real;
   vValor30Aux, vValorAcum, vValor, vValor30, TotReservasParticipante,TotReservasPatroPorParticipante : Real;
   sIndiceDeReajuste : String[30];
   sDateDeReferencia : String[10];
   vIndice, vData, vFlag : String;
   ValorAcumulado, Percentual : Real;  // Luis Eduardo - 25/02/2000
begin
   //----------------------------------------------
   // Caso Diretorio não Exista Cria Diretorio
   //----------------------------------------------
   sDiretorio := ExtractFilePath(NomeDoTXT);
   If not DirectoryExists(sDiretorio) Then
   begin
      If not CreateDir(sDiretorio) Then
      begin
	  Application.MessageBox('Diretório de saída não pode ser criado ..... ','TXT Histórico de Aferição',MB_OK+MB_ICONINFORMATION);
	  Result :=FALSE;
	  Exit;
      end;
   end;

  // Monta a Query Principal para as Aferições
  MontaQryPrincipal;

  //----------------------------------------------------
  // Realizará a gravação dos registros no AAAAMM.TXT
  //----------------------------------------------------
  if( QryPrincipal.RecordCount = 0 )Then
     begin
        Application.MessageBox('Não existem registros relacionados a este plano...','TXT Histórico de Aferição',MB_OK+MB_ICONINFORMATION);
	LabelAguarde.Caption:= 'Aguardando comando...';
        LabelTotReg.Caption:='0 Registro Salvos ';
        QryPrincipal.Close;
	Result := FALSE;
        Exit;
     end;
  //
  AssignFile(Estrutura,NomeDoTXT);
  Try
    Rewrite(Estrutura); // Cria o arquivo Físicamente
  Except
    Application.MessageBox(PChar('Arquivo TXT de Afericão não pode ser criado ...!'),Pchar('TXT Histórico de Aferição'),MB_OK+MB_ICONINFORMATION);
    LabelAguarde.Caption:= 'Aguardando comando...';
    LabelTotReg.Caption:='0 Registro Salvos ';
    CloseFile(Estrutura);
    QryPrincipal.Close;
    Result :=FALSE;
    Exit;
  end;

  QrySalPartDataDeReferencia.Prepare;
  QrySalPartDataDeReferencia.Close;

  QryReservasDoParticipante.Prepare;
  QryReservasDoParticipante.Close;

  QryValEspxValRec.Prepare;
  QryValEspxValRec.Close;

  // Inicializações de Elementos de Interface
  Contador:=0;

  ProgressBarTXTAfericoes.Position := 0;
  ProgressBarTXTAfericoes.Max := QryPrincipal.RecordCount;


  // Variáveis Utilizadas nos Calculos Abaixo
  MesParam :=0;AnoParam :=0;IdadeAtual:=0;
  TempoContribINSS:=0;IdadeDeIngressoINSS:=0;
  TotReservasParticipante:=0;
  TotReservasPatroPorParticipante:=0;

  // Disabilita a checagem p/ que não haja erro de verificação
  LabelAguarde.Caption:='Salvando em TXT de Aferições...';
  // Desabilita Controles parametrizadores
  EnabledControlesParametrizadores(FALSE);

  While not(QryPrincipal.Eof) do
     begin
	{----------------------------------------------------------------------------------
	 SELECT PRINCIPAL                                       PRESENTE NA QUERY
	 ----------------------------------------------------------------------------------
	 / Codigo da Patrocinadora[3]                           S
	 / Numero de Inscrição[4]                               S
	 / Sexo[2]                                              S
	 / Est.Civil[5]                                         S
	 / Dt.Nascimento[6]                                     S
	 / Dt.Admissão[7],                                      S
	 / Tempo de Serviço Anterior[9],                        S ( Utilizado para Cálculo )
	 / Dt.de Inscrição[10],                                 S
	 / Sit.Participante[11]                                 OK ( Pendente )
	 / Codigo de Sub-Massa[9]                               OK( Pendente )
	 / Salario de Part. da Data de Referência[10]           S
	 / Salario de Partcipação na Inscrição[11],             S
	 / Percentual de Contrib.Básica Complementar[12]          - OK ( Calculado )
	 / Percentual de Contrib. Facultativa do Participante[13] - OK ( Calculado )
	 / Saldo de Conta de Participante no Último dia do Mês de referência[14]  - OK ( Calculado )
	 / Saldo de Conta de Patrocinadora no Ultimo dia do Mês de Referência[15] - OK( Calculado )
	 / Idade de Ingresso no INSS[16]                                                  - OK ( É Calculado )
	 / Tempo de Contribuicao para o INSS ( em anos e Meses )na data de Referência[17] - OK ( É Calculado )
	 -------------------------------------------------------------------------------}

	{----------------------------------------------------------------------------
	 * Realiza a query que Totaliza as RESERVA DO PARTICIPANTE de Acordo com
         * sua PATROCINADORA e seu PLANO
	----------------------------------------------------------------------------}
	QryReservasDoParticipante.Close;
	QryReservasDoParticipante.ParamByName('Pessoa').AsInteger:=QryPrincipal.FieldByName('IdPessoa').AsInteger;
	QryReservasDoParticipante.ParamByName('PlanoPrev').AsInteger:=QryPrincipal.FieldByName('IdPlanoPrev').AsInteger;
	QryReservasDoParticipante.ParamByName('PessJur').AsInteger:=QryPrincipal.FieldByName('IdPessJur').AsInteger;
	QryReservasDoParticipante.ParamByName('DataDeAfericao').AsDateTime:= DataDeAfericao.Date;

	{---------------------------------------------------------------------------
	/
	*  PEGO OS VALORES DO PARTICIPANTE PARA A QUERY QUE DEFINE
	*  VALORES ESPERADOS E VALORES RECEBIDOS - QryValEspxValRec
	/
	}
	QryValEspxValRec.Close;
	QryValEspxValRec.ParamByName('Pessoa').AsInteger := QryPrincipal.FieldByName('IdPessoa').AsInteger;
	QryValEspxValRec.ParamByName('PlanoPrev').AsInteger := QryPrincipal.FieldByName('IdPlanoPrev').AsInteger;;
	QryValEspxValRec.ParamByName('PessJur').AsInteger := QryPrincipal.FieldByName('IdPessJur').AsInteger;
	QryValEspxValRec.ParamByName('DataAfericao').AsDate := DataDeAfericao.Date;

	if( cbContabContribNaoPresentesNasReservas.Checked ) Then
	       Percentual := (sePercentualDeAlimentacao.Value / 100)
	else
	       Percentual := 1;

	QryReservasDoParticipante.Open;

	// Loop Através dos registros retornados pela Query TotReservasDoParticipante
	// para verificar os Tipos de Reservas do Participante
	{----------------------------------------------------------------
	*   QryReservasDoParticipante.Fields[0].AsString = 'T'
	*   -> Verifica a quem pertence o tipo de reserva =>
	*   -> T ( Titular ) - F ( Fundação ) - P ( Patrocinadora )
	* ---------------------------------------------------------------
	* ---------------------------------------------------------------
	*  QryReservasDoParticipante.Fields[1].AsString = 0 )
	*  -> Verifica se é uma reserva de Controle
	----------------------------------------------------------------}
	TotReservasParticipante:=0;
	TotReservasPatroPorParticipante :=0;
	While not ( QryReservasDoParticipante.Eof ) do
	   begin
	       {--------------------------------------------------------------------------
	       *
	       * QryValEspxValRec - Definição de valores de contribuição (ESPERADO ou RECEBIDO)
	       * Ignora todos os casos que a FLGDEVOLUCAO <> 0 em HSTCONTRIBPREV
	       * O HSTCONTRIBPREV.IDMOTIVO = PARAMAPREV.IDMOTIVOCONTRIBP (REGISTRO ÚNICO)
	       *
	       * SE O SITRECEBIMENTO = 0 OU 1 ENTÀO EU PEGO O VALOR ESPERADO
	       * SE O SITRECEBIMENTO <> 0 OU 1 ENTÃO EU PEGO O MENOR VALOR ENTRE O ESPERADO E RECEBIDO
	       *
	       *  A QUERY SÓ É ABERTA SE O CHECKBOX ESTIVER MARCADO
	       /
	       ----------------------------------------------------------------------------}
	       if (cbContabContribNaoPresentesNasReservas.Checked ) Then Begin

		  QryValEspxValRec.ParamByName('AnoMesReferencia').AsString := Copy(DateToStr(DataDeAfericao.Date),7,4)+'/'+Copy(DateToStr(DataDeAfericao.Date),4,2);

		  if Copy(DateToStr(DataDeAfericao.Date),4,2) = '12' then
		     QryValEspxValRec.ParamByName('AnoMesReferenciaFinal').AsString := Copy(DateToStr(DataDeAfericao.Date),7,4)+'/13'
		  else
		     QryValEspxValRec.ParamByName('AnoMesReferenciaFinal').AsString := QryValEspxValRec.ParamByName('AnoMesReferencia').AsString;

		  QryValEspxValRec.ParamByName('TipoReserva').AsInteger := QryReservasDoParticipante.FieldByName('IDTIPORESERVA').AsInteger;

		  QryValEspxValRec.Open;
		  ValorAcumulado := 0;

		  while not (QryValEspxValRec.EOF) do begin

		     if (QryValEspxValRec['SitRecebimento'] = 0) or
			(QryValEspxValRec['SitRecebimento'] = 1) then

			nValorEsperado := QryValEspxValRec.FieldByName('ValorEsperado').AsFloat

		     else if (QryValEspxValRec['ValorEsperado'] < QryValEspxValRec['ValorRecebido']) then
			     ValorAcumulado := ValorAcumulado + QryValEspxValRec.FieldByName('ValorEsperado').AsFloat
			  else
			     ValorAcumulado := ValorAcumulado + QryValEspxValRec.FieldByName('ValorRecebido').AsFloat;

		     QryValEspxValRec.next;

		  end;
		  nValorEsperado := (ValorAcumulado * Percentual);
	       end
	       else
		  nValorEsperado := 0;
		  
	       QryValEspxValRec.Close;

	       //------------------------------------------------------------
	       //  Obtem o Indice de Reajuste ( Indentificador da Moeda )
	       //  Reserva de Participante
	       //------------------------------------------------------------

	       if ( ( QryReservasDoParticipante.FieldByName('flgTitularColet').AsString = 'T') AND
		    ( QryReservasDoParticipante.FieldByName('flgControle').AsInteger = 0)   )Then
		   begin
		      sIndiceDeReajuste := IntToStr(QryReservasDoParticipante.FieldByName('IndiceReajuste').AsInteger);

		      //vValorRef := 1;
		      if (sIndicedeReajuste <> vIndice) then begin
			    vIndice := sIndicedeReajuste;
			    vValorRef := VoltaValorCotacao(sIndiceDeReajuste, DateToStr(DataDeAfericao.Date));
		      end;

		      TotReservasParticipante := TotReservasParticipante +
						 vValorRef *
						 QryReservasDoParticipante.FieldByName('SaldoDeCotas').AsFloat +
						 nValorEsperado ;
		   end
	       // Reserva de Patrocinadora
	       {--------------------------------------------------------------------
	       *  Obs.: Não preciso Testar se ela pertence a fundação (F) ou a (P)
	       *   porque eu já sei que é da patrocinadora
	       * -------------------------------------------------------------------}
	       else if ( QryReservasDoParticipante.FieldByName('flgControle').AsInteger = 0 )   Then
		   begin
		      sIndiceDeReajuste := IntToStr(QryReservasDoParticipante.FieldByName('IndiceReajuste').AsInteger);

		      if (sIndicedeReajuste <> vIndice) then begin
			    vIndice := sIndicedeReajuste;
			    vValorRef := VoltaValorCotacao(sIndiceDeReajuste, DateToStr(DataDeAfericao.Date));
		      end;

		      TotReservasPatroPorParticipante := TotReservasPatroPorParticipante + vValorRef *
		      QryReservasDoParticipante.FieldByName('SaldoDeCotas').AsFloat + nValorEsperado;
		   end;

	       QryReservasDoParticipante.Next;
	end;
	{---------------------------------------------------------------------------------
	/  Query - Percentual de Contribuição Básica Complementar
	/  e Contribuição Sumplementar Facultativa do Participante
	/  QryPrincipal.Fields[15].Value => IdContribuição
	/  QryPrincipal.Fields[16].Value => ValorBase1 ( Percentual desejado )
	----------------------------------------------------------------------------------}

	QryContribuicoes.Close;
	QryContribuicoes.ParamByName('Pessoa').AsInteger:=QryPrincipal.FieldByName('IdPessoa').AsInteger;
	QryContribuicoes.ParamByName('PlanoPrev').AsInteger:=QryPrincipal.FieldByName('IdPlanoPrev').AsInteger;
	QryContribuicoes.ParamByName('PessJur').AsInteger:=QryPrincipal.FieldByName('IdPessJur').AsInteger;
	QryContribuicoes.Open;

	ContribBasicaComplementar:=0;ContribSuplementarFacultPart:=0;
	{-----------------------------------------------------
	* Verifica o Tipo de Contribuição ( IdContribuição )
	* e atribui a variavél especifica
	*-----------------------------------------------------}
	if( QryContribuicoes.FieldByName('IdContribuicao').AsInteger = 19 )Then
	   begin
	      ContribSuplementarFacultPart:=QryContribuicoes.FieldByName('ValorBase1').AsFloat;
	      // Salta para o proximo registro da Query
	      QryContribuicoes.Next;
	      // Pega o elemento seguinte da QueryContribuições
	      ContribBasicaComplementar:=QryContribuicoes.FieldByName('ValorBase1').AsFloat;
	   end;

	// Decodifica a Data Digitada para uso em Diversos calculos
	AnoParam := StrToInt(Copy(DateToStr(DataDeAfericao.Date),7,4));
	MesParam := StrToInt(Copy(DateToStr(DataDeAfericao.Date),4,2));

	{----------------------------------------------------------
	// QryPrincipal.Fields[12].Value -> Campo IdSitPart de PartPrevPlan
	----------------------------------------------------------}

	vFlag := QryPrincipal.FieldByName('FLGINTERNO').AsString;
	if (vFlag = 'AT') or (vFlag = 'MP') then //AT - ATIVO , MP - MANTIDO PARCIAL
	   SituacaoDoParticipante := 1
	else begin
	    if (vFlag = 'MA') then
	       SituacaoDoParticipante := 3
	    else begin
		if vFlag = 'AS' then begin
		   QryBeneficios.Close;
		   QryBeneficios.ParamByName('Pessoa').AsInteger:= QryPrincipal.FieldByName('IdPessoa').AsInteger ;
		   QryBeneficios.ParamByName('PlanoPrev').AsInteger:= QryPrincipal.FieldByName('IdPlanoPrev').AsInteger ;
		   QryBeneficios.ParamByName('PessJur').AsInteger:=  QryPrincipal.FieldByName('IdPessJur').AsInteger;
		   QryBeneficios.Open;
		   // Campo DataFinal da QryBeneficios
		   DecodeDate(QryBeneficios.FieldByName('DataFinal').AsDateTime,AnoQry,MesQry,DiaQry);
		   // Guarda a Idade ,em Meses, Atual do Indivíduo
		   DuracaoDoBeneficio:= ( AnoParam - AnoQry ) * 12 +
				     ( MesParam - MesQry ) ;
		   // Anos de Duração do Benefício
		   AnosDeBeneficio:=Trunc( DuracaoDoBeneficio / 12 );
		   // Auxilio doença com menos de 2 Anos
		   if (AnosDeBeneficio < 2 )Then
		      SituacaoDoParticipante:= 2
		   else
		       SituacaoDoParticipante:= 0;
		end else begin
		    if vFlag = 'CA' then
		       SituacaoDoParticipante:= 4;
		end;
	    end;
	end;

	// Executa a Query para verificar se é Quadro ou Convênio
	QryQuadroConvenio.Close;
	QryQuadroConvenio.ParamByName('Pessoa').AsInteger:=QryPrincipal.FieldByName('IdPessoa').AsInteger;
	QryQuadroConvenio.Open;

	{-----------------------------------------------
	* Codigo de Sub-Massa
	* Se estiver dentro da tabela -> TTT é Convênio
	* se não é -> Quadro
	*-----------------------------------------------}
	if ( QryQuadroConvenio.RecordCount = 0 ) Then
	    CodigoDeSubMassa := '01'    // Quadro
	else
	    CodigoDeSubMassa := '02';   // Convênio
	{--------------------------------------------------------------------
	* Cálculo do Código de Salário de Participação na Data de Referência
	*-------------------------------------------------------------}
        QrySalPartDataDeReferencia.Close;
        QrySalPartDataDeReferencia.ParamByName('Pessoa').AsInteger := QryPrincipal.FieldByName('IdPessoa').AsInteger;
        QrySalPartDataDeReferencia.ParamByName('PlanoPrev').AsInteger := QryPrincipal.FieldByName('IdPlanoPrev').AsInteger;
        QrySalPartDataDeReferencia.ParamByName('DataDeAfericao').AsString := Copy(DateToStr(DataDeAfericao.Date),7,4)+'/'+Copy(DateToStr(DataDeAfericao.Date),4,2);
        QrySalPartDataDeReferencia.Open;

        vValorAcum := 0;
        vValor30 := 0;
        vRubrica := 0;
        vValor30Aux := 0;

        while not QrySalPartDataDeReferencia.Eof do begin
              vRubrica := QrySalPartDataDeReferencia.FieldbyName('IdRubrica').AsInteger;
              if vRubrica = 1800 then //Adicional de Periculosidade deve ser menor que 30% do salario
                 vValor30 := QrySalPartDataDeReferencia.FieldbyName('SalPartDtRef').AsFloat;
              vValor := QrySalPartDataDeReferencia.FieldbyName('SalPartDtRef').AsFloat;

              if QrySalPartDataDeReferencia.FieldbyName('IdRubrica').AsInteger = 1194 then begin
		           //vValor := QrySalPartDataDeReferencia.FieldbyName('SalPartDtRef').AsFloat;
                 vValor30Aux := (QrySalPartDataDeReferencia.FieldbyName('SalPartDtRef').AsFloat /100)*30;
                 if vValor30 > vValor30Aux then begin//Testa se 30% do salario é menor que
                    vValor30 := vValor30Aux;
		              vValor := vValor30;
                 end;
              end;

              QrySalPartDataDeReferencia.Next;
              if not QrySalPartDataDeReferencia.Eof then begin //Testa se o próximo é igual (Rubrica)
                 if (vRubrica = QrySalPartDataDeReferencia.FieldbyName('IdRubrica').AsInteger) and
                    (QrySalPartDataDeReferencia.FieldbyName('SalPartDtRef').AsFloat > vValor) then
                    vValor := QrySalPartDataDeReferencia.FieldbyName('SalPartDtRef').AsFloat;
              end;

              //if vValor < 0 then vValor := 0; //Não aceita valores menores que zero.

	           vValorAcum := vValorAcum + vValor;
        end;

        {--------------------------------------------------------------
        * Cálculo do Código de Salário de Participação na Inscrição
        *-------------------------------------------------------------}
        QrySalPartDataDeInscricao.Close;
        QrySalPartDataDeInscricao.ParamByName('Pessoa').AsInteger := QryPrincipal.FieldByName('IdPessoa').AsInteger;
        QrySalPartDataDeInscricao.ParamByName('PlanoPrev').AsInteger := QryPrincipal.FieldByName('IdPlanoPrev').AsInteger;
        QrySalPartDataDeInscricao.ParamByName('DataDeInscricao').AsString := Copy(DateToStr(QryPrincipal.FieldByName('InscricaoData').AsDateTime),7,4)+'/'+Copy(DateToStr(QryPrincipal.FieldByName('InscricaoData').AsDateTime),4,2);
        QrySalPartDataDeInscricao.Open;

        // Decompõe a data de nascimento
        DecodeDate(QryPrincipal.FieldByName('DataNasc').AsDateTime,AnoQry,MesQry,DiaQry);
        // Guarda a Idade ( em Meses ) atual do Indivíduo
        IdadeAtual:= ( AnoParam - AnoQry ) * 12 +
                     ( MesParam - MesQry );
        // Decompõe data de Admissão
        DecodeDate(QryPrincipal.FieldByName('DataAdmissao').AsDateTime,AnoQry,MesQry,DiaQry);
	     // Tempo de Contribuição ,em Meses,para o INSS , estando na empresa.
        TempoContribINSS := (( AnoParam - AnoQry ) * 12 +
                            ( MesParam - MesQry )+QryPrincipal.FieldByName('TempoServAnterior').AsFloat );
	     // Idade de Ingresso no INSS
        IdadeDeIngressoINSS := Trunc( (IdadeAtual -  TempoContribINSS ) / 12 );
        // Contribuições e Anos
        AnosContrib:=Trunc( TempoContribINSS / 12 );
        // Contribuições em Meses
        MesesContrib:=Frac( TempoContribINSS / 12 )  * 12;
        // Grava no TXT
	Inc(Contador);
        LabelTotReg.Caption:=IntToStr(Contador)+' Registros gravados ' ;

        //---- Alguns Campos existentes na Query Principal
        // InscricaoNumero,pf.Sexo,pf.EstCivil,pf.DataNasc,ep.DataAdmissao,ep.TempoServAnterior,pp.InscricaoData,pp.IdSitPart
        //----
        Writeln(estrutura,{ Código da Patrocinadora   } QryPrincipal.FieldByName('CodPatro').AsString,
                          { Número  de Inscrição      } QryPrincipal.FieldByName('InscricaoNumero').AsInteger,
                          { Sexo                      } QryPrincipal.FieldByName('Sexo').AsString,
                          { Estado Civil              } QryPrincipal.FieldByName('EstCivil').AsString,
                          { Data de Nascimento        } Copy(DateTimeToStr(QryPrincipal.FieldByName('DataNasc').AsDateTime),7,4)+Copy(DateTimeToStr(QryPrincipal.FieldByName('DataNasc').AsDateTime),4,2),
                          { Data de Admissão          } Copy(DateTimeToStr(QryPrincipal.FieldByName('DataAdmissao').AsDateTime),7,4)+Copy(DateTimeToStr(QryPrincipal.FieldByName('DataAdmissao').AsDateTime),4,2),
			  { Data de Inscrição         } Copy(DateTimeToStr(QryPrincipal.FieldByName('InscricaoData').AsDateTime),7,4)+Copy(DateTimeToStr(QryPrincipal.FieldByName('InscricaoData').AsDateTime),4,2),
                          { Situação do Participante  } SituacaoDoParticipante,
                          { Código de Sub-Massa       } CodigoDeSubMassa,
                          { Sal. Part. na data de Ref.} StrZero(vValorAcum * 100,12,0),
			  { Sal. Part. na Inscrição   } StrZero(QrySalPartDataDeInscricao.FieldByName('SalPartDtInscricao').AsFloat * 100,12,0),
                          { Percentual de Contribuição Básica Complementar      } StrZero(ContribBasicaComplementar*100000,12,0),
                          { Perc. de Contrib. Suplementar Facult. Participante  } StrZero(ContribSuplementarFacultPart*100000,12,0),
                          { Reservas do Participante  } StrZero(TotReservasParticipante*100,12,0),
			  { Reservas da Patrocinadora } StrZero(TotReservasPatroPorParticipante*100,12,0),
                          { Indade de Ingr. no INSS   } StrZero(IdadeDeIngressoINSS,2,0),
                          { Anos de Contribuição      } StrZero(AnosContrib,2,0),
                          { Meses de Contribuição     } StrZero(MesesContrib,2,0));

        ProgressBarTXTAfericoes.Position := ProgressBarTXTAfericoes.Position + 1; 
        ProgressBarTXTAfericoes.Refresh;

	     Application.ProcessMessages;
        QryPrincipal.Next;

     end; // End While Auxiliar Principal
     //----------------------------------------------------------
     LabelAguarde.Caption:='Gravação em disco finalizada...';
     LabelTotReg.Caption:=IntToStr(QryPrincipal.RecordCount)+' '+'Registros gravados' ;
     CloseFile(Estrutura);
     cbContabContribNaoPresentesNasReservas.Enabled:=TRUE;
     // Fechamento de Todas as Query's
     QryPrincipal.Close;
     QryContribuicoes.Close;

     QryValEspxValRec.Close;
     QryValEspxValRec.UnPrepare;

     QryReservasDoParticipante.Close;
     QryReservasDoParticipante.UnPrepare;

     QryContribNaoIncidentes.Close;

     QrySalPartDataDeReferencia.Close;
     QrySalPartDataDeReferencia.UnPrepare;

     QrySalPartDataDeInscricao.Close;
     QryBeneficios.Close;
     QryQuadroConvenio.Close;
     QryIndiceReajuste.Close;
     //-------------------------------------------
     EnabledControlesParametrizadores(TRUE);
     RESULT := TRUE;
     //-------------------------------------------
end;

procedure TfrmTXTdeAfericaoPart.bbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmTXTdeAfericaoPart.bbtnConfirmarClick(Sender: TObject);
var
    Drive       : UINT;
    UnidExistir : Boolean;
    Caminho     : String;
begin
    UnidExistir := TRUE;
    Drive := GetDriveType(PChar(Path.Text));
    case Drive of
       0 : UnidExistir:= FALSE;
    end;
    If(UnidExistir)Then
       begin
         Caminho := Path.Text;
         LabelAguarde.Caption:='Iniciando processo de gravação...';
         if(SalvarEmTXTdeAfericaoPart(Caminho))Then
            LabelAguarde.Caption:='Gravação realizada com sucesso...';
       end
    else
       Application.MessageBox('Unidade Inexistente ou vazia!','TXT de Aferição',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmTXTdeAfericaoPart.bbtnConfirmarExit(Sender: TObject);
begin
   LabelAguarde.Caption:= 'Verificando dados ...';
   LabelTotReg.Caption:='0 Registro Salvos ';
   ProgressBarTXTAfericoes.Position := 0;
end;

procedure TfrmTXTdeAfericaoPart.DirectoryListBoxAfericoesChange(
  Sender: TObject);
begin
   if(Length(DirectoryListBoxAfericoes.Directory) <> 3)Then
      Path.Text:=DirectoryListBoxAfericoes.Directory+'\'+'AT'+Copy(DateToStr(DataDeAfericao.Date),7,4)+Copy(DateToStr(DataDeAfericao.Date),4,2)+'.TXT'
   else
      Path.Text:=DirectoryListBoxAfericoes.Directory+'AT'+Copy(DateToStr(DataDeAfericao.Date),7,4)+Copy(DateToStr(DataDeAfericao.Date),4,2)+'.TXT';
end;

procedure TfrmTXTdeAfericaoPart.cbContabContribNaoPresentesNasReservasClick(
  Sender: TObject);
begin
  if( cbContabContribNaoPresentesNasReservas.Checked )Then
     begin
        LabelPercentualDeAlimentacao.Enabled := cbContabContribNaoPresentesNasReservas.Checked;
	sePercentualDeAlimentacao.Enabled  := LabelPercentualDeAlimentacao.Enabled;
        sePercentualDeAlimentacao.Color := clWhite;
     end
  else
     begin
        LabelPercentualDeAlimentacao.Enabled := cbContabContribNaoPresentesNasReservas.Checked;
        sePercentualDeAlimentacao.Enabled  := LabelPercentualDeAlimentacao.Enabled;
        sePercentualDeAlimentacao.Value := 100;
        sePercentualDeAlimentacao.Color := clSilver;
     end;
end;

procedure TfrmTXTdeAfericaoPart.FillCheckListBoxPlanPrev(Sender: TObject);
var
  i : ShortInt;
begin
     // Abre a Query de Planos
     QryPlanPrev.Prepare;
     QryPlanPrev.Open;
     for i:= 1 to QryPlanPrev.RecordCount do
        begin
           CheckListBoxPlanPrev.Items.Add(QryPlanPrev.FieldByName('Nome').AsString+','+IntToStr(QryPlanPrev.FieldByName('IdPlanoPrev').AsInteger));
           QryPlanPrev.Next;
        end;
     QryPlanPrev.Close;
     QryPlanPrev.UnPrepare;
end;

procedure TfrmTXTdeAfericaoPart.FillCheckListBoxPlanPrevPatro(Sender: TObject);
var
  i : ShortInt;
begin
     // Abre a Query de Patrocinadoras
     QryPlanPrevPatro.Prepare;
     QryPlanPrevPatro.Open;
     for i:= 1 to QryPlanPrevPatro.RecordCount do
        begin
           CheckListBoxPlanPrevPatro.Items.Add(QryPlanPrevPatro.FieldByName('Nome').AsString+','+IntToStr(QryPlanPrevPatro.FieldByName('IdPessJur').AsInteger));
           QryPlanPrevPatro.Next;
        end;
     QryPlanPrevPatro.Close;
     QryPlanPrevPatro.UnPrepare;
end;

procedure TfrmTXTdeAfericaoPart.FormCreate(Sender: TObject);
begin
  DataDeAfericao.Date := Date;
  DirectoryListBoxAfericoesChange(Nil);

  IdPlanPrevs := TStringList.Create;
  IdPessjurs  := TStringList.Create;

  FillCheckListBoxPlanPrev(Nil);      //  Tabela PlanPrev ( Planos )
  FillCheckListBoxPlanPrevPatro(Nil); //  PlanPrevPatro   ( Planos p/ uma determinada Patrocinadora )
end;

procedure TfrmTXTdeAfericaoPart.CheckListBoxPlanPrevClickCheck(
  Sender: TObject);
var
 Clb      : TCheckListBox;
 Id       : String;
begin
    Clb := ( Sender As TCheckListBox );
    Id := Copy( Clb.Items[Clb.ItemIndex],Pos(',',Clb.Items[Clb.ItemIndex]) + 1,Length(Clb.Items[Clb.ItemIndex]));
    if ( Clb.Tag = 0 ) Then  // PlanPrev
       begin
           if ( Clb.Checked[Clb.ItemIndex] ) Then
              begin
                IdPlanPrevs.Add(Id);
              end
           else
              begin
                  if ( IdPlanPrevs.IndexOf(Id) <> -1 ) Then
                     begin
                         IdPlanPrevs.Delete(IdPlanPrevs.IndexOf(Id));
                     end;
              end;
       end
    else if ( Clb.Tag = 1 ) Then  //  Patrocinadoras
       begin
           if ( Clb.Checked[Clb.ItemIndex] ) Then
              begin
                 IdPessjurs.Add(Id);
              end
           else
               begin
                   if ( IdPessjurs.IndexOf(Id) <> -1 ) Then
                      begin
                          IdPessjurs.Delete(IdPessjurs.IndexOf(Id));
                      end;
              end;
       end;
end;

procedure TfrmTXTdeAfericaoPart.FormDestroy(Sender: TObject);
begin
  IdPlanPrevs.Free;
  IdPessjurs.Free;
end;

procedure TfrmTXTdeAfericaoPart.spbSobreClick(Sender: TObject);
begin
  inherited;
  if spbSobre.Down then
     pnlSobre.visible := true
  else
     pnlSobre.visible := false;

end;

end.
