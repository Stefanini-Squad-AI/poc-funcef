// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FMigraDotacaoInicial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, TEdNum, URegra;

type
  TfrmMigraDotacaoInicial = class(TfrmSairAjuda)
    Label1: TLabel;
    dblkpcmbPlanPatro: TwwDBLookupCombo;
    qryPatroPlano: TwwQuery;
    dblkpcmbContrib: TwwDBLookupCombo;
    qryContrib: TwwQuery;
    Label2: TLabel;
    bbtnGerar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    lblMatricula: TLabel;
    lblTotal: TLabel;
    GroupBox1: TGroupBox;
    rdPercentual: TRadioButton;
    rdRegra: TRadioButton;
    Bevel1: TBevel;
    Label5: TLabel;
    edPercentual: TEditNum;
    Label6: TLabel;
    Label7: TLabel;
    qryRegra: TwwQuery;
    dblkpcmbRegra: TwwDBLookupCombo;
    rgrpOrigem: TRadioGroup;
    OpenDlg: TOpenDialog;
    qryElegPatro: TwwQuery;
    qryAux: TwwQuery;
    memResult: TMemo;
    qryJaInscritos: TwwQuery;
    chkApenasParticip: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function GeraDotacao(psMatricula, psIdPessoa, psSalario : string) : boolean;

  public
    { Public declarations }
  end;

var
  frmMigraDotacaoInicial: TfrmMigraDotacaoInicial;

implementation

uses UMensErro, DBaseDados, UAdmPrev, UDotacao, fAguarde, USistema;

{$R *.DFM}

procedure TfrmMigraDotacaoInicial.FormShow(Sender: TObject);
begin
  inherited;
  lblMatricula.Caption := '';
  lblTotal.Caption     := '';
end;

procedure TfrmMigraDotacaoInicial.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatroPlano.Close;
  qryPatroPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 16.06.2003
  qryPatroPlano.Open;
  qryContrib.Close;
  qryContrib.Open;
  qryRegra.Open;
end;

procedure TfrmMigraDotacaoInicial.bbtnGerarClick(Sender: TObject);
var  sNomeArq,
     sLinha,
     sMatricula,
     sIdPessoa,
     sSalario     : string;
     F            : TextFile;
     iContReg     : longint;
begin
  // Verificar campos obrigatorios
  if Trim(dblkpcmbPlanPatro.Text) = ''
  then begin
     MsgDlg('Informe a Patrocinadora e o Plano desejados.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbContrib.Text) = ''
  then begin
     MsgDlg('Informe a Contribuição de Dotação Inicial desejada.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if rdPercentual.Checked and (Trim(edPercentual.Text) = '')
  then begin
     MsgDlg('Informe o Percentual a aplicar ao salário.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if rdRegra.Checked and (Trim(dblkpcmbRegra.Text) = '')
  then begin
     MsgDlg('Informe a Regra de Cálculo da Dotação.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  // Se a origem for arquivo texto, exibir o lay-out necessário e pedir para
  // usuário confirmar
  if rgrpOrigem.ItemIndex = 0
  then begin
     if not MsgDlg('O arquivo de origem deve ter o seguinte formato : '+#13+
                   'Matrícula : posição 1  - tamanho 13'+#13+
                   'Salário   : posição 14 - tamanho 15'+#13+
                   'Deseja continuar ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
     then Exit;
     if not OpenDlg.Execute
     then begin
        sNomeArq := '';
        Exit;
     end
     else sNomeArq := OpenDlg.FileName;
  end;

  // Verificar se existe alguma dotacao inicial para os parametros passados
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT DATAINICIO FROM PARAMDOTACAO '+
                 ' WHERE  (IDPESSJUR      = '+qryPatroPlano.FieldByName('IdPessJur').AsString+')'+
                 ' AND    (IDPLANOPREV    = '+qryPatroPlano.FieldByName('IdPlanoPrev').AsString+')'+
                 ' AND    (IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+')');
  qryAux.Open;
  if qryAux.IsEmpty
  then begin
     MsgDlg('Não existem parâmetros da "Dotação Inicial" cadastrados. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;


  if not chkApenasParticip.Checked
  then begin

     dtmBaseDados.dbBaseDados.StartTransaction;

     // Preencher DotacaoInicial para todos os elegiveis
     iContReg := 0;
     if rgrpOrigem.ItemIndex = 0
     then begin // ler arquivo texto
        AssignFile(F,sNomeArq);
        Reset(F);
        while not Eof(F) do
        begin
           Readln(F, sLinha);
           sMatricula := Trim(Copy(sLinha,1,13));
           sSalario   := Trim(Copy(sLinha,14,15));
           inc(iContReg);
           lblTotal.Caption     := IntToStr(iContReg);
           lblMatricula.Caption := sMatricula;
           lblTotal.Update;
           lblMatricula.Update;

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT IDPESSOA FROM ELEGPATRO '+
                          ' WHERE  (IDPESSJUR = '+qryPatroPlano.FieldByName('IdPessJur').AsString+')'+
                          ' AND    (MATRICULA = '''+sMatricula+ ''')');
           qryAux.Open;
           if qryAux.IsEmpty
           then begin
              memResult.Lines.Add('Matricula  '+sMatricula+' não encontrada.');
              continue;
           end;
           sIdPessoa := qryAux.FieldByName('IdPessoa').AsString;

           if not GeraDotacao(sMatricula, sIdPessoa, sSalario)
           then begin
              MsgDlg('Erro ao gerar dotação. Matrícula : '+sMatricula,'Erro',mtError,[mbOk, mbHelp],0);
              dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end;
        end; 

        CloseFile(F);
     end
     else begin // ler SALTOTAL da ELEGPATRO
        qryElegPatro.Close;
        qryElegPatro.ParamByName('IdPessJur').AsInteger := qryPatroPlano.FieldByName('IdPessJur').AsInteger ;
        qryElegPatro.Open;
        while not qryElegPatro.Eof do
        begin

           if not GeraDotacao(qryElegPatro.FieldByName('Matricula').AsString,
                              qryElegPatro.FieldByName('IdPessoa').AsString,
                              qryElegPatro.FieldByName('SalTotal').AsString)
           then begin
              MsgDlg('Erro ao gerar dotação. Matrícula : '+sMatricula,'Erro',mtError,[mbOk, mbHelp],0);
              dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end;
           lblTotal.Caption     := IntToStr(iContReg);
           lblMatricula.Caption := sMatricula;
           lblTotal.Update;
           lblMatricula.Update;
           qryElegPatro.Next;
        end;
     end;

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

     dtmBaseDados.dbBaseDados.Commit;

     if MsgDlg('A geração da "Dotação Inicial" foi terminada com sucesso. '+#13+
               'Deseja fazer a alimentação do Histórico de Contribuições para os '+#13+
               'participantes que já se inscreveram ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
     then Exit;
  end;

  qryJaInscritos.Close;
  qryJaInscritos.ParamByName('IdPessJur').AsInteger   := qryPatroPlano.FieldByName('IdPessJur').AsInteger;
  qryJaInscritos.ParamByName('IdPlanoPrev').AsInteger := qryPatroPlano.FieldByName('IdPlanoPrev').AsInteger;
  qryJaInscritos.Open;
  frmAguarde.Mostra('Gerando dotação para participantes...');
  while not qryJaInscritos.Eof do
  begin
     if not GeraDotacaoParticipante( qryJaInscritos.FieldByName('IdPessJur').AsInteger,
                                     qryJaInscritos.FieldByName('IdPlanoPrev').AsInteger,
                                     qryJaInscritos.FieldByName('IdPessoa').AsInteger,
                                     qryJaInscritos.FieldByName('SeqProposta').AsInteger,
                                     qryContrib.FieldByName('IdContribuicao').AsInteger,
                                     qryJaInscritos.FieldByName('Valor').AsFloat)
     then begin
        MsgDlg('Erro ao gerar dotação para o participante. Matrícula : '+
                qryJaInscritos.FieldByName('Matricula').AsString+
                'Inscrição Nº '+qryJaInscritos.FieldByName('InscricaoNumero').AsString,'Erro',mtError,[mbOk, mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        frmAguarde.Apaga;
        Exit;
     end;
     qryJaInscritos.Next;
  end; 
  qryJaInscritos.Close;
  frmAguarde.Apaga;
  MsgDlg('Dotação de participantes gerada com sucesso.','Informação',mtInformation,[mbOk, mbHelp],0);
end;

function TfrmMigraDotacaoInicial.GeraDotacao(psMatricula, psIdPessoa, psSalario : string) : boolean;
var sSQL, sValor : string;
    rPercentual,
    rSalario,
    rValor       : double;
    bErro        : boolean;
begin
   Result := False;

   if rdPercentual.Checked
   then begin // Valor do beneficio é calculado por percentual
      rPercentual := StrToFloat(ClienteNumero(Trim(edPercentual.Text)));
      rSalario    := StrToFloat(ClienteNumero(Trim(psSalario)));
      rValor      := (rPercentual * rSalario) / 100;
      sValor      := OraNumero(FloatToStr(rValor));
   end
   else begin // Valor do benefício é calculado por regra
      sSQL        := ' SELECT '+OraNumero(psSalario)+' AS VALORPROVENTO FROM DUAL ';
      sValor      := RegraNumerica(qryRegra.FieldByName('IdRegra').AsString,
                                   sSQL, bErro, iIdCalculoGeral);
      if bErro then Exit;

   end;

   sValor := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValor)));

   sSQL := ' INSERT INTO DOTACAOINICIAL(IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
           '                            IDPESSOA, VALOR) '+
           ' VALUES ('+
           qryPatroPlano.FieldByName('IdPessJur').AsString    +', '+
           qryPatroPlano.FieldByName('IdPlanoPrev').AsString  +', '+
           qryContrib.FieldByName('IdContribuicao').AsString +', '+
           psIdPessoa+', '+
           OraNumero(sValor)+') ';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
   end;

   Result := True;
end; 


procedure TfrmMigraDotacaoInicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryRegra.Close;
end;

end.
