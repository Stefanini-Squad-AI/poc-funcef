// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Darivaldo Alencar
// Data        : 06/08/2018
// Pendência   : SIG 70882
// Descricao   : Inclusão de variável para verificar o menu eventos.
//-------------------------------------------------------------------------------
// Autor(a)    : Higor Nayde Ferreira
// Data        : 03/11/2014
// Pendência   : SOL 217839/16484  KTN 504250
// Descricao   : Solicitamos de retirada de validação para INSS pois quando o participante
// retornará a o patrocinadora.
//-------------------------------------------------------------------------------
// Autor(a)    : Douglas.Siqueira
// Data        : 30/04/2012
// Pendência   : SOL 178186 KTN 1635216
// Descricao   : Solicitamos que na tela de Retenção e Encerramento quando o motivo da
//retenção/encerramento estiver com a opção FALECIMENTO marcada a opção "Não efetuar acerto financeiro"
//deva vir marcada como default e sem opção de alteração.
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 05/04/2012
// Pendência   : SOL 177418 Kintana 1630606
// Descricao   : ERRO NO ENCERRAMENTO -> ChBxEfetuaAcerto deve estar default true
//               não mudar o radiogroup rgrpRetornaPatro para sim deve permanecer
//               não
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 25/11/2010
// Pendência   : SOL 149847 Kintana 1107845
// Descricao   : alteração na funcionalidade dos motivos de retenção e encerramento
//               de benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 131703/4861 KINTANA 1277622
//Responsável : BRUNO AZEVEDO
//Data        : 06/10/2011
//Descrição   : Ajustes no cálculo do histórico dos encerramentos.
//------------------------------------------------------------------------------
//Pendência   : SOL 166021 KINTANA 1443437
//Responsável : BRUNO AZEVEDO
//Data        : 04/10/2011
//Descrição   : Ajustes na gravação da procedure PR_GRAVAHSTPERCGRUPO.
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Data        : 25/11/2010
// Pendência   : SOL 131458 Kintana 751892
// Descricao   : Implementação de um dbcombobox para controlar os motivos de
// retenção e encerramento
//------------------------------------------------------------------------------
//Pendência   : SOL 136380 KINTANA 815875
//Responsável : c
//Data        : 01/11/2010
//Descrição   : Travar encerramento por falecimento sem data óbito.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 20/03/2009
// Pendência   : 111955 KT: 517234
// Descricao   : Não permitir que a data de falecimento seja superior a data atual.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 17/03/2009
// Pendência   : SOL 111194 \ Kintana 512996
// Descricao   : Coloquei a propriedade Enabled do edtMatricula igual a False.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/08/2007
// Pendência   : 24821
// Rotina      : Varias
// Descricao   : Tratamento para possibilitar não efetuar acertos financeiros
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 10/01/2006
// Pendência   : 19531
// Rotina      : cbMotivoExit
// Descricao   : Novo item para a lista "CANCELAMENTO DE CONVENIO COM INSS"
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 23/09/2005
// Pendência   : 18892
// Rotina      : cbMotivoExit
// Descricao   : Nova ordenação dos motivos para retenção.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 15/07/2005
// Pendência   : 18892
// Rotina      : cbMotivoExit
// Descricao   : Criação de novos motivos para retenção.
//------------------------------------------------------------------------------
// Rotina      : Várias
// Autor(a)    : Camille
// Data        : 19.09.2003
// Pendência   : 14814
// Alteração   : Perguntar se o participante retornará a patrocinadora
//------------------------------------------------------------------------------
// Rotina      : Várias
// Autor(a)    : Carlos Guedes
// Data        : 12/09/2002
// Alteração   : Permiti deixa nova data final nula
//------------------------------------------------------------------------------

unit FReabNovaData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar,  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti, Db,
  DBTables, Wwquery, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Wwdatsrc, wwdblook;

type
  TfrmReabNovaData = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    lblDtInicioAntes: TLabel;
    edDtInicioAntes: TEdit;
    lblDtFinalAntes: TLabel;
    edDtFinalAntes: TEdit;
    GroupBox2: TGroupBox;
    lblDtInicio: TLabel;
    dtInicio: TCMDateTimePicker;
    lblDtFinal: TLabel;
    dtFinal: TCMDateTimePicker;
    rgrpReabertura: TRadioGroup;
    rgrpDataPrevEfet: TRadioGroup;
    grbMatricula: TGroupBox;
    edtMatricula: TEdit;
    qryUpdElegpatro: TwwQuery;
    qryMotivore: TwwQuery;
    dsMotivore: TwwDataSource;
    dbcbMotivore: TwwDBLookupCombo;
    rgrpEncerramento: TGroupBox;
    rgrpRetornaPatro: TRadioGroup;
    Label1: TLabel;
    ChBxEfetuaAcerto: TCheckBox;
    Label2: TLabel;
    Bevel1: TBevel;
	qryAux: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure rgrpReaberturaClick(Sender: TObject);
    procedure dbcbMotivoreExit(Sender: TObject);
    procedure cbMotivoExit(Sender: TObject);
    procedure ChBxEfetuaAcertoClick(Sender: TObject);
    procedure dtFinalExit(Sender: TObject);
    procedure dbcbMotivoreChange(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bDatasOK     : boolean;
    liIdPessJur,
    liIdPessoa   : Longint;
    sMotivo      : String;
    iMotivo      : integer;
    EfetuaAcertoFinanceiro, bErroMensagem : Boolean;
    pcOperacao   : char;
    sEvento: String; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
    sFontePagadora: String; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
    bVeioMenu: Boolean; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
    bEncerrarInssAnt: Boolean; //BRUNO AZEVEDO SOL 136380 KINTANA 815875
    bOutrosEvTmp    : boolean; //Darivaldo Alencar SIG70882
  end;

var
  frmReabNovaData: TfrmReabNovaData;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmReabNovaData.FormShow(Sender: TObject);
var
Steste : string;
begin
  inherited;

  //BRUNO AZEVEDO SOL 131703-4861 KINTANA 1277622
  EfetuaAcertoFinanceiro := False;
  //EfetuaAcertoFinanceiro := True;

  sMotivo := '1';
  //preencher o dbcbMotivore com os motivos da tabela Motivore
  qryMotivore.Close;
  sTeste := pcOperacao;
  qryMotivore.ParamByName('Tipo').AsString := sTeste;
  qryMotivore.Open;

  // No caso de Prorrogacao a data de inicio nao deve se alterar
  // No caso de Renovacao   a data de inicio deve ser um dia apos o encerramento
  if rgrpReabertura.ItemIndex = -1
  then  Begin
    dtInicio.Enabled := False;      
    Exit;
  end;

  if (rgrpReabertura.ItemIndex = 0) and
     (Trim(edDtFinalAntes.Text) <> '') and
     (StrToDate(edDtFinalAntes.Text) >= date) // Prorrogacao
  then begin
     dtInicio.Text := edDtInicioAntes.Text;
     dtInicio.Enabled := False;
  end
  else begin
     if (rgrpReabertura.ItemIndex = 0) and
        (Trim(edDtFinalAntes.Text) <> '') and
        (StrToDate(edDtFinalAntes.Text) < date) // RENOVACAO
     then begin
         
        {Para o mês de Fevereiro, quando a ''Data Final Anterior'' for 28 ou 29
         dependendo se ano bissexto ou não , a ''Nova Data Início'' deve ser o dia
         1 do mês seguinte (Março). Nos demais meses do ano se a ''Data Final Anterior''
         for 30 ou 31, a ''Nova Data Início'' deve ser o dia 1 do mês seguinte.
         Ex: Data Final Anterior = 30/03/2002 a ''Nova Data Inicio''
         deve ser 01/04/2002, pois o mês de 03/2002 já foi pago integral (30 dias).}

        if ((copy(edDtFinalAntes.Text,4,2) <> '02') and (strtoint(copy(edDtFinalAntes.Text,1,2)) >= 30)) or
           ((copy(edDtFinalAntes.Text,4,2) = '02') and (strtoint(copy(edDtFinalAntes.Text,1,2)) >= 28)) then
          dtInicio.Text := '01/' + copy(FormatDateTime('dd/mm/yyyy', StrToDate(edDtFinalAntes.Text) + 2),4,7) 
        else
          dtInicio.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edDtFinalAntes.Text) + 1); 

        dtInicio.Enabled := False;
        
     end
     else dtInicio.Enabled := True;
  end;

  if not rgrpReabertura.Visible // Retencao/Encerramento
  then begin
     rgrpRetornaPatro.Visible := True;
     grbMatricula.Visible   := True;
  end
  else begin
     rgrpRetornaPatro.Visible := False;
     grbMatricula.Visible   := False;
  end;
  
end;

procedure TfrmReabNovaData.bbtnConfirmarClick(Sender: TObject);
var bReabertura : boolean;

begin
  bDatasOk := False;
  bErroMensagem := false;
  if Trim(dbcbMotivore.LookupValue) <> '' then
        iMotivo  := StrToInt(sMotivo)
  else
        iMotivo  := 0;

  With qryAux Do      //id_motivo, , FLGATIVO
  Begin
     Close;
     Sql.Clear;
     Sql.Add(' SELECT FLGFALECIMENTO, FLGATIVO, FLGSAIDACONVENIO '+
             ' FROM MOTIVORE '+
             ' WHERE ID_MOTIVO      = '+QuotedStr(Trim(dbcbMotivore.LookupValue)));
     Open;
  end;

  if (qryAux.fieldByName('FLGFALECIMENTO').asinteger = 1) and (qryAux.fieldByName('FLGATIVO').asinteger = 1) then //Xavier
     iMotivo  := 5;

  if (qryAux.fieldByName('FLGSAIDACONVENIO').asinteger = 1) and (qryAux.fieldByName('FLGATIVO').asinteger = 1) then //Xavier
     iMotivo  := 11;

  //SOL111955 Daniel Begnami
  //if((cbMotivo.ItemIndex = 5) and (dtFinal.Date > Date)) then
  if  (iMotivo = 5) and (dtFinal.Date > Date) then
  begin
     MsgDlg('A data de falecimento não pode ser superior a data atual','Erro',mtError,[mbOk,mbHelp],0);
     dtFinal.SetFocus;
  end;
  // FIM
  If trim(dtFinal.Text) <> '' Then
  begin
     if (rgrpReabertura.Visible) and (dtInicio.Enabled) and (StrToDate(dtFinal.Text)  < StrToDate(dtInicio.Text))
     then begin
        MsgDlg('A data final não pode ser anterior à data de início.','Erro',mtError,[mbOk,mbHelp],0);
        bErroMensagem := true;
        Abort;
     end;
  end
  else
  //if (qryAux.fieldByName('FLGFALECIMENTO').asinteger = 1) and (qryAux.fieldByName('FLGATIVO').asinteger = 1) then // inicio SOL 149847 Kintana 1107845
  if (iMotivo = 5) then // xavier
  begin
     MsgDlg('A data final deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     Abort;
  end; // inicio SOL 149847 Kintana 1107845

  //BRUNO AZEVEDO SOL 136380 KINTANA 815875
  if ((sEvento = 'FL') or (bVeioMenu)) and ( Trim(dbcbMotivore.LookupValue) = '') then begin
    MsgDlg('É necessário informar o motivo do encerramento do benefício.','Atenção',mtWarning,[mbOk],0);
    ModalResult := mrCancel;
    bErroMensagem := true;
    Abort;
  end;

  // Higor Nayde Ferreira SOL 217839/15783 PPM 388909
{  if (rgrpRetornaPatro.ItemIndex = 0) and (sFontePagadora = '2') then begin
    MsgDlg('Não é permitido o encerramento do benefício INSS pois o participante retornará a patrocinadora.','Atenção',mtWarning,[mbOk],0);
    ModalResult := mrCancel;
    bErroMensagem := true;
    Abort;
  end;
} // Higor Nayde Ferreira SOL 217839/15783 PPM 388909


  if (bEncerrarInssAnt) and (rgrpRetornaPatro.ItemIndex = 1)
     and (bOutrosEvTmp = False) //Darivaldo Alencar SIG70882
  then begin
    MsgDlg('É necessário encerrar o benefício INSS antes de encerrar o benefício FUNCEF.','Informação',mtInformation,[mbOK],0);
    ModalResult := mrCancel;
    bErroMensagem := true;
    Abort;
  end;
  //BRUNO AZEVEDO SOL 136380 KINTANA 815875

  if (rgrpReabertura.Visible) and (dtInicio.Enabled) and (Trim(dtInicio.Text) = '')
  then begin
     MsgDlg('Informe a nova data de início.','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     Abort;
  end;

  if (rgrpReabertura.Visible) and (dtInicio.Enabled) and (StrToDate(dtInicio.Text)  < StrToDate(edDtInicioAntes.Text))
  then begin
     MsgDlg('A nova data de início não pode ser anterior à data de início cadastrada até o momento.','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     Abort;
  end;

  // Se for uma reabertura ou uma renovacao
  // Entao a data de inicio deve ser maior que a data final anterior
  bReabertura := False;

  if (rgrpReabertura.Visible) and
     (rgrpReabertura.ItemIndex = 0)    and
     (Trim(edDtFinalAntes.Text) <> '') and
     (StrToDate(edDtFinalAntes.Text) < date)
  then bReabertura := True;

  if  ( (rgrpReabertura.ItemIndex = 1) or (bReabertura) ) and
      (  dtInicio.Enabled and (StrToDate(dtInicio.Text)  <  StrToDate(edDtFinalAntes.Text)) )
  then begin
     MsgDlg('A nova data de início deve ser posterior à data final anterior. ','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     Abort;
  end;

  If trim(dtFinal.Text) <> '' Then
    if  (rgrpReabertura.Visible) and
        ( (rgrpReabertura.ItemIndex = 0)  ) and
        (  (StrToDate(dtInicio.Text) > StrToDate(dtFinal.Text)) )
    then begin
       MsgDlg('A data final deve ser posterior à data de início. ','Erro',mtError,[mbOk,mbHelp],0);
       bErroMensagem := true;
       Abort;
    end;

  bDatasOK := True;


  if Trim(edtMatricula.Text) <> ''
  then begin
     With qryUpdElegpatro Do
     Begin
       Sql.Clear;
       Sql.Add(' UPDATE ELEGPATRO SET MATRICULA = '''+edtMatricula.Text+''''+
               ' WHERE IDPESSOA = '+IntToStr(liIdPessoa)+
               ' AND IDPESSJUR  = '+IntToStr(liIdPessJur));
       Try
         ExecSql;
       Except
         Raise;
       End;
     End;
  end;

  //inherited;
end;

procedure TfrmReabNovaData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

procedure TfrmReabNovaData.bbtnCancelarClick(Sender: TObject);
begin
  bDatasOK := False;
  inherited;

end;

procedure TfrmReabNovaData.rgrpReaberturaClick(Sender: TObject);
begin
  inherited;
  // No caso de Prorrogacao a data de inicio nao deve se alterar
  // No caso de Renovacao   a data de inicio deve ser um dia apos o encerramento
  if (rgrpReabertura.ItemIndex = 0) and
     (Trim(edDtFinalAntes.Text) <> '') and
     (StrToDate(edDtFinalAntes.Text) >= date) // Prorrogacao
  then begin
     dtInicio.Text := edDtInicioAntes.Text;
     dtInicio.Enabled := False;
  end
  else begin
     if (rgrpReabertura.ItemIndex = 0) and
        (Trim(edDtFinalAntes.Text) <> '') and
        (StrToDate(edDtFinalAntes.Text) < date) // Renovacao
     then begin
        {Para o mês de Fevereiro, quando a ''Data Final Anterior'' for 28 ou 29
         dependendo se ano bissexto ou não , a ''Nova Data Início'' deve ser o dia
         1 do mês seguinte (Março). Nos demais meses do ano se a ''Data Final Anterior''
         for 30 ou 31, a ''Nova Data Início'' deve ser o dia 1 do mês seguinte.
         Ex: Data Final Anterior = 30/03/2002 a ''Nova Data Inicio''
         deve ser 01/04/2002, pois o mês de 03/2002 já foi pago integral (30 dias).}

        if ((copy(edDtFinalAntes.Text,4,2) <> '02') and (strtoint(copy(edDtFinalAntes.Text,1,2)) >= 30)) or
           ((copy(edDtFinalAntes.Text,4,2) = '02') and (strtoint(copy(edDtFinalAntes.Text,1,2)) >= 28)) then
          dtInicio.Text := '01/' + copy(DateToStr(StrToDate(edDtFinalAntes.Text) + 2),4,7) 
        else
          dtInicio.Text := DateToStr(StrToDate(edDtFinalAntes.Text) + 1);  

        dtInicio.Enabled := False;
     end
     else dtInicio.Enabled := True;
  end;

end;

procedure TfrmReabNovaData.cbMotivoExit(Sender: TObject);
begin
  inherited;
  // Alimenta a variavel com o motivo da retenção / encerramento
 { If cbmotivo.Text = 'COMPLETOU MAIOR IDADE'
  Then sMotivo := '1'
  Else If cbmotivo.Text = 'FALTA DE RECADASTRAMENTO'
  Then sMotivo := '2'
  Else If cbmotivo.Text = 'MUDANÇA DE ESTADO CIVIL'
  Then sMotivo := '3'
  Else If cbmotivo.Text = 'CANCELAMENTO PELO INSS'
  Then sMotivo := '4'
  Else If cbmotivo.Text = 'CONCLUSÃO DE CURSO SUPERIOR'
  Then sMotivo := '5'
  Else If cbmotivo.Text = 'FALECIMENTO'
  Then sMotivo := '6'
  Else If cbmotivo.Text = 'OUTROS'
  Then sMotivo := '7'
  Else If cbmotivo.Text = 'SEM DEPENDENTE VÁLIDO (INSS)'
  Then sMotivo := '9'
  Else If cbmotivo.Text = 'BENEFICIÁRIO SEM CPF (INSS)'
  Then sMotivo := '10'
  Else If cbmotivo.Text = 'CANCELAMENTO DE CONVENIO COM INSS' 
  Then sMotivo := '11';       }

 { if (sMotivo = '1') or (sMotivo = '2') or (sMotivo = '3') or (sMotivo = '5') or (sMotivo = '6')
  then begin
     rgrpRetornaPatro.ItemIndex := 1;
     if sMotivo = '6' // FALECIMENTO
     then begin
        rgrpRetornaPatro.Enabled   := False;
        rgrpRetornaPatro.Visible   := False;
     end
     else begin
        rgrpRetornaPatro.Visible   := True; 
     end;

  end
  else begin
     rgrpRetornaPatro.ItemIndex := 0;
     rgrpRetornaPatro.Enabled   := True;
     rgrpRetornaPatro.Visible   := True;
  end;
          }
  //BRUNO AZEVEDO SOL 136380 KINTANA 815875
  if (sEvento = 'FL') and (Trim(dbcbMotivore.LookupValue) = '') then begin
    MsgDlg('É necessário informar o motivo do encerramento do benefício.','Erro',mtError,[mbOk],0);
   dbcbMotivore.SetFocus;
  end;
  //BRUNO AZEVEDO SOL 136380 KINTANA 815875

end;

procedure TfrmReabNovaData.ChBxEfetuaAcertoClick(Sender: TObject);
begin
  inherited;
  EfetuaAcertoFinanceiro := ( Not ChBxEfetuaAcerto.Checked ); 
end;

procedure TfrmReabNovaData.dtFinalExit(Sender: TObject);
var
 iMotivo : integer;
begin
  inherited;
  With qryAux Do      //id_motivo, , FLGATIVO
  Begin
     Close;
     Sql.Clear;
     Sql.Add(' SELECT FLGFALECIMENTO, FLGATIVO '+
             ' FROM MOTIVORE '+
             ' WHERE ID_MOTIVO      = '+QuotedStr(Trim(dbcbMotivore.LookupValue)));
     Open;
  end;

  if (qryAux.fieldByName('FLGFALECIMENTO').asinteger = 1) and (qryAux.fieldByName('FLGATIVO').asinteger = 1) then //Xavier
     iMotivo  := 5;
	 
  //SOL111955 Daniel Begnami
  //if ((cbMotivo.ItemIndex = 5) and (dtFinal.Date > Date)) then
   if (iMotivo = 5) and (dtFinal.Date > Date) then
  begin
     MsgDlg('A data de falecimento não pode ser superior a data atual','Erro',mtError,[mbOk,mbHelp],0);
     dtFinal.SetFocus;
  end;
  // FIM
 end;
procedure TfrmReabNovaData.dbcbMotivoreExit(Sender: TObject);
begin
  inherited;
  sMotivo :=   dbcbMotivore.LookupValue;
   // Alimenta a variavel com o motivo da retenção / encerramento
   if (sMotivo = '1') or (sMotivo = '2') or (sMotivo = '3') or (sMotivo = '5') or (sMotivo = '6')
  then begin
     rgrpRetornaPatro.ItemIndex := 1;
     if sMotivo = '6' // FALECIMENTO
     then begin
        rgrpRetornaPatro.Enabled   := False;
        rgrpRetornaPatro.Visible   := False;
     end
     else begin
        rgrpRetornaPatro.Visible   := True;
     end;

  end
  else begin
     //rgrpRetornaPatro.ItemIndex := 0;   // SOL 177418 Kintana 1630606
     rgrpRetornaPatro.Enabled   := True;
     rgrpRetornaPatro.Visible   := True;
  end;

  if (sEvento = 'FL') and (Trim(dbcbMotivore.LookupValue) = '') then begin
   MsgDlg('É necessário informar o motivo do encerramento do benefício.','Erro',mtError,[mbOk],0);
   dbcbMotivore.SetFocus;
  end;

end;

procedure TfrmReabNovaData.dbcbMotivoreChange(Sender: TObject);
begin
  inherited;
  ///douglas.siqueira SOL178186

   if qryMotivore.fieldbyname('FLGNPERMFINANC').value=1 then
      begin
       ChBxEfetuaAcerto.Enabled:=False;
       ChBxEfetuaAcerto.Checked:=True;
       Label2.Enabled:=False;
      end
   else
       begin
       ChBxEfetuaAcerto.Enabled:=True;
       Label2.Enabled:=True;
       end;


  ///fim douglas.siqueira SOL178186
end;

procedure TfrmReabNovaData.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  HelpContext := 160079 ;
  bbtnAjuda.HelpContext := 160079;
end;

end.
