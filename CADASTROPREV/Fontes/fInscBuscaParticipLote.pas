//------------------------------------------------------------------------------
// Autor(a)    : Marcio Sanches Spinosa SOL 238781 KINTANA 508836
// Data        : 12/09/2014
// Pendência   : SOL 238781 KINTANA 508836
// Alteração   : Ajuste na busca dos planos.
//------------------------------------------------------------------------------
// Autor(a)    : William Santana
// Data        : 14/03/2014
// Pendência   : SOL 227902 KINTANA 2061868
// Alteração   : Erro no percentual de Contribuição igual a 100% e maior que 1000%.
//------------------------------------------------------------------------------
// Autor(a)    : William Moreira da Silva
// Data        : 07/03/2014
// Pendência   : SOL 227741 KINTANA 2061694
// Alteração   : Erro ao inserir um Partcipante em LOTE
//------------------------------------------------------------------------------
// Autor(a)    : William Santana
// Data        : 20/12/2013
// Pendência   : SOL 180408 KINTANA 1698323
// Alteração   : Desenvolver funcionalidade para cadastro em lote das seguintes
//               informações: Opção de IR e Proposta recebida
//------------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 28/11/2013
// Pendência   : SOL 180408 KINTANA 1698323
// Alteração   : Desenvolver funcionalidade para cadastro em lote das seguintes
//               informações: Opção de IR e Proposta recebida
//------------------------------------------------------------------------------
// Autor(a)    : Tadeu Passos
// Data        : 14/06/2013
// Pendência   : SOL 180408 KINTANA 1698323
// Alteração   : Desenvolver funcionalidade para cadastro em lote das seguintes
//               informações: Opção de IR e Proposta recebida
//------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Data        : 03/10/2011
// Pendência   : SOL 163405 KINTANA 1438825
// Alteração   : Atualizar FLAG de participante previdenciario al incluir no plano.
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Data        : 18/03/2010
// Pendência   : SOL 154361  Kintana 1188271
// Alteração   : Eliminado o campo Data de Inscrição Caixa da tela Inscrição em
// Lote e também do Arquivo TXT.
//------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Data        : 23/02/2011
// Pendência   : SOL 147489 Kintana 1023626
// Alteração   : Permitir a inscrição do participante quando não encontrar a matricula.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Santana
// Data        : 23/09/2010
// Pendência   : SOL 140614 Kintana 883624
// Alteração   : Cancelar planos anteriores.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 12/07/2010
// Pendência   : SOL 127062 Kintana 670853
// Alteração   : Criação da funcionalidade "Inscricao Participante em Lote"
//------------------------------------------------------------------------------

unit fInscBuscaParticipLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, DBCtrls, TREdit, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables,Wwquery,uMensErro,
  wwdbdatetimepicker, CMDateTimePicker, uDatabase;

type
  TfrmInscBuscaParticipLote = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    btnBusca: TBitBtn;
    dsPlanPrev: TDataSource;
    QryPlanPrev: TQuery;
    rdProgressiva: TRadioButton;
    rdRegressiva: TRadioButton;
    cboPlanoPrev: TDBLookupComboBox;
    dtInscricao: TCMDateTimePicker;
    qryAux: TwwQuery;
    Label5: TLabel;
    dtDataCaixa: TCMDateTimePicker;
    edtNovoPercentual: TRealEdit;
    Label7: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    dtRecebidoEm: TCMDateTimePicker;
    dtOpcaoIR: TCMDateTimePicker;
    edtEmail: TEdit;
    procedure btnBuscaClick(Sender: TObject);
    procedure edtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edtNovoPercentual1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LimparCampos();
    function ValidaEMail(const EMailIn : PChar) : Boolean;
  private
    bNovaMatricula: Boolean;

    procedure CamposEditaveis(pBol : boolean);
    { Private declarations }
  public
    idPessoa        : String;
    sMatricula      : String;
    sRowId          : String;
    sDataVigente    : String;
    sInscricaoData  : String;
    sTipoArquivo    : String;
    sidPessJur      : String;
    sInscricaoPart  : String;
    sIdContribuicao : String;
    { Public declarations }
  end;

var
  frmInscBuscaParticipLote: TfrmInscBuscaParticipLote;

implementation
uses FInscricaoParticipanteLote, uFuncoesUteis;

{$R *.DFM}

procedure TfrmInscBuscaParticipLote.btnBuscaClick(Sender: TObject);
var
   bMatriculaEncontrada : boolean; // Felipe A. Santos SOL 180408 KINTANA 1698323
begin
//inherited;

  if (trim(edtMatricula.Text) <> '') then begin
    if (Length(edtMatricula.Text) <> 4) and (Length(edtMatricula.Text) <> 7) then begin
      MsgDlg('Matrícula inválida.', 'Informação', mtInformation, [mbOk], 0);
      edtMatricula.SetFocus;
      exit;
    end;
  end;

  bNovaMatricula := False;

  sidPessJur      := '';
  idPessoa        := '';
  sMatricula      := '';
  sInscricaoData  := '';
  sInscricaoPart  := '';
  sIdContribuicao := '';

  //BRUNO AZEVEDO SOL 147489 Kintana 1023626
  edtNome.Enabled := False;
  dtDataCaixa.Enabled := False;

  if trim(edtMatricula.Text) <> '' then begin

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' SELECT IDPESSOA, NOME ');
    QryAux.SQL.Add(' FROM PESSOA ');
    QryAux.SQL.Add(' WHERE IDPESSOA IN (SELECT IDPESSOA ');
    QryAux.SQL.Add('                    FROM ELEGPATRO ');
    QryAux.SQL.Add('                    WHERE MATRICULA =' + QuotedStr(edtMatricula.Text));
    QryAux.SQL.Add('                     AND ROWNUM = 1) ');
    QryAux.Open;

    bMatriculaEncontrada := (QryAux.RecordCount > 0); // Felipe A. Santos

    if (QryAux.RecordCount = 0) and not(frmInscricaoParticipanteLote.bEditar) then begin // alterado por Felipe A. Santos
      //BRUNO AZEVEDO SOL 147489 Kintana 1023626
      if (MsgDlg('Matrícula não encontrada. Deseja cadastrar?', 'Informação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        edtNome.Enabled      := True;
        dtDataCaixa.Enabled  := True;
        cboPlanoPrev.Enabled := True;
        bNovaMatricula      := True;
        edtNome.Text        := '';
        edtNome.SetFocus;

        if (Length(edtMatricula.Text) = 4) then begin
          sidPessJur := '1';
        end else begin
          sidPessJur := '91008';
        end;

        QryPlanPrev.Close;
        QryPlanPrev.SQL.Clear;
        QryPlanPrev.SQL.Add('SELECT * FROM PLANPREV');

        if sidPessJur = '91008' then begin
          QryPlanPrev.SQL.Add('WHERE IDPLANOPREV = 74');
        end else if sidPessJur = '1' then begin
          QryPlanPrev.SQL.Add('WHERE IDPLANOPREV = 66');
        end;
        QryPlanPrev.Open;

        if sidPessJur = '91008' then begin
          cboPlanoPrev.KeyValue :=74;
        end else begin
          cboPlanoPrev.KeyValue :=66;
        end;
      end else begin
        QryAux.Close;
        edtMatricula.text := '';  //William Santana SOL 227741 KINTANA 2061694
        edtMatricula.SetFocus;
      end;
    end else begin
      if frmInscricaoParticipanteLote.bEditar and not(bMatriculaEncontrada) then
         Exit;

      edtNome.Text   := QryAux.FieldByname('NOME').asString;
      idPessoa       := QryAux.FieldByname('IDPESSOA').asString;
      sMatricula     := edtMatricula.Text;

      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' SELECT IDPESSJUR FROM ELEGPATRO');
      QryAux.SQL.Add(' WHERE IDPESSOA  = '+ idPessoa  );
      QryAux.Open;

      sidPessJur := QryAux.FieldByname('IDPESSJUR').asString;

     //Marcio Sanches Spinosa SOL 238781 KINTANA 508836 - Inicio
     //Início - William Santana SOL 180408 KIN 1698323
     QryPlanPrev.Close;
      QryPlanPrev.SQL.Clear;
      QryPlanPrev.SQL.Add('SELECT * FROM PLANPREV');

      if sidPessJur = '91008' then begin
        QryPlanPrev.SQL.Add('WHERE IDPLANOPREV = 74');
      end else if sidPessJur = '1' then begin
        QryPlanPrev.SQL.Add('WHERE IDPLANOPREV = 66');
      end;
      QryPlanPrev.Open;

      if sidPessJur = '91008' then begin
        cboPlanoPrev.KeyValue :=74;
      end else begin
        cboPlanoPrev.KeyValue :=66;
      end;

      {
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' SELECT IDPLANOPREV FROM PARTPREVPLAN '+
                          ' WHERE IDPESSJUR = ' +sidPessJur +
                          ' AND IDPESSOA = '+ idPessoa +
                          ' AND ROWNUM = 1 ' +
                          ' ORDER BY FLGDESATIVADO ');
      QryAux.Open;

      if not(QryAux.isempty) then
      begin
        QryPlanPrev.Close;
        QryPlanPrev.SQL.Clear;
        QryPlanPrev.SQL.Add(' SELECT * FROM PLANPREV ');
        QryPlanPrev.SQL.Add(' WHERE IDPLANOPREV = '+QryAux.FieldByName('IDPLANOPREV').AsString);
        QryPlanPrev.Open;

        cboPlanoPrev.KeyValue := QryAux.FieldByName('IDPLANOPREV').AsInteger;
      end
      else//Inicio - William Moreira da Silva - SOL 227741 KINTANA 2061694
      begin
              QryPlanPrev.Close;
      QryPlanPrev.SQL.Clear;
      QryPlanPrev.SQL.Add('SELECT * FROM PLANPREV');

      if sidPessJur = '91008' then begin
        QryPlanPrev.SQL.Add('WHERE IDPLANOPREV = 74');
      end else if sidPessJur = '1' then begin
        QryPlanPrev.SQL.Add('WHERE IDPLANOPREV = 66');
      end;
      QryPlanPrev.Open;

      if sidPessJur = '91008' then begin
        cboPlanoPrev.KeyValue :=74;
      end else begin
        cboPlanoPrev.KeyValue :=66;
      end;
      end;
      //Término - William Moreira da Silva - SOL 227741 KINTANA 2061694
      //Término - William Santana SOL 180408 KIN 1698323
       }
      //TADEU PASSOS SOL 180408 KINTANA 1698323
//      Marcio Sanches Spinosa SOL 238781 KINTANA 508836 - Fim

      // Pegando o Percentual
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('SELECT CP.VALORBASE1 PERCENTUAL, CP.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP ');
      QryAux.SQL.Add(' WHERE CP.IDPESSJUR      = ' + sidPessJur);
      QryAux.SQL.Add('   AND CP.IDPESSOA       = ' + idPessoa);
      QryAux.SQL.Add('   AND CP.IDPLANOPREV    = ' + IntToStr(cboPlanoPrev.KeyValue));
      QryAux.SQL.Add('   AND CP.IDCONTRIBUICAO = 1');
      qryAux.Open;

      if not qryAux.IsEmpty then begin
        edtNovoPercentual.Text := qryAux.FieldByName('PERCENTUAL').AsString;
        sIdContribuicao        := qryAux.FieldByName('IDCONTRIBUICAO').AsString;
      end;


      // Pegando Data Inscrição Funcef, Data Opção IR, Inscricao Participante
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('SELECT PT.INSCRICAODATA, PT.DATAOPCAOIR, PT.INSCRICAONUMERO FROM PARTPREVPLAN PT ');
      QryAux.SQL.Add(' WHERE PT.IDPESSOA             = ' + idPessoa);
      QryAux.SQL.Add('   AND PT.IDPLANOPREV          = ' + IntToStr(cboPlanoPrev.KeyValue));
      QryAux.SQL.Add('   AND NVL(PT.FLGDESATIVADO,0) = 0');
      qryAux.Open;

      if not qryAux.IsEmpty then begin
        dtInscricao.Text := qryAux.FieldByName('INSCRICAODATA').AsString;
        dtOpcaoIR.Text   := qryAux.FieldByName('DATAOPCAOIR').AsString;
        sInscricaoPart   := qryAux.FieldByName('INSCRICAONUMERO').AsString
      end;

      // Proposta Recebida Em (NUMDOCUMENTO) e Data Emissão
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('SELECT DP.NUMDOCUMENTO, DP.DATAEMISSAO FROM DOCPESSOA DP ');
      QryAux.SQL.Add(' WHERE DP.IDPESSOA    = ' + idPessoa);
      QryAux.SQL.Add('   AND DP.IDDOCUMENTO = 43');
      qryAux.Open;

      if not qryAux.IsEmpty then begin
        //dtEmissao := qryAux.FieldByName('DATAEMISSAO').AsString; // Felipe A. Santos SOL 180408 KINTANA 1698323
        if qryAux.FieldByName('NUMDOCUMENTO').AsString <> '11111111111' then
          dtRecebidoEm.Text := qryAux.FieldByName('NUMDOCUMENTO').AsString;
      end;

      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('SELECT EMAILFUNCEF  ' +
                     '  FROM PESSOAFISICA ' +
                     ' WHERE IDPESSOA =   ' + idPessoa);
      QryAux.Open;

      if not qryAux.IsEmpty then
        edtEmail.Text := qryAux.FieldByName('EMAILFUNCEF').AsString;
      //TADEU PASSOS SOL 180408 KINTANA 1698323

      if not(frmInscricaoParticipanteLote.bEditar) then
         edtNovoPercentual.SetFocus;

      if frmInscricaoParticipanteLote.bEditar and bMatriculaEncontrada then
      begin
         edtMatricula.Enabled := False;
         btnBusca.Enabled := False;
      end;

    end;
  end;
end;

procedure TfrmInscBuscaParticipLote.edtMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if key <> #22 then begin
    if (not (key in ['0'..'9'])) and  (key <> #8)
      then key :=#0;
  end;

end;

procedure TfrmInscBuscaParticipLote.bbtnConfirmarClick(Sender: TObject);
var
  sSql,stipoopcaoir,sPercentual,sNome : string;
  iPossuiPlanoAtivo : Integer;
begin
  inherited;

  //William Santana SOL 180408 KIN 1698323
  if edtMatricula.Focused then
  begin
   btnBuscaClick(sender) ;
   exit;
  end;
  //END - William Santana SOL 180408 KIN 1698323

  if rdProgressiva.Checked then begin
    stipoopcaoir :='1';
  end else begin
    stipoopcaoir :='2';
  end;

  if (trunc(dtInscricao.Date) > trunc(Now)) then begin
     MsgDlg('Data FUNCEF não pode ser maior que a data atual. ', 'Informação', mtConfirmation, [mbOk], 0);
     exit;
  end;

  if not(frmInscricaoParticipanteLote.bEditar) then    //William Santana SOL 180408 KIN 1698323
  begin
   if (trim(edtMatricula.Text)='') or  (Trim(cboPlanoPrev.Text)='') or
     (trim(edtNovoPercentual.text) = '') or (dtInscricao.Text = '') or
     (trim(dtOpcaoIR.Text) = '') or (trim(dtRecebidoEm.Text) = '') or
     //William Santana SOL 180408 KIN 1698323
     //(trim(edtEmail.Text) = '') then begin
     (trim(edtNome.Text) = '') then begin
     //MsgDlg('Todos os campos devem ser preenchidos. ', 'Informação', mtConfirmation, [mbOk], 0);
     MsgDlg('Apenas o campo e-mail Funcef pode ficar sem preenchimento', 'Informação', mtConfirmation, [mbOk], 0);
     //END - William Santana SOL 180408 KIN 1698323
     exit;
   end;

   if (cboPlanoPrev.KeyValue = 74) then begin
//    if strToFloat(edtNovoPercentual.Text) < 5 then begin                                       //William Santana SOL 227902 KIN 2061868
    if strToFloat(StringReplace((edtNovoPercentual.Text),'.','',[rfReplaceAll])) < 5 then begin  //William Santana SOL 227902 KIN 2061868
      MsgDlg('O percentual mínimo para Novo Plano não pode ser menor que 5%. ', 'Informação', mtConfirmation, [mbOk], 0);
      edtNovoPercentual.text :='';
      exit;
//    end else if strToFloat(edtNovoPercentual.Text) >= 100 then begin                                      //William Santana SOL 227902 KIN 2061868
    end else if strToFloat(StringReplace((edtNovoPercentual.Text),'.','',[rfReplaceAll])) > 100 then begin  //William Santana SOL 227902 KIN 2061868
      //William Santana SOL 180408 KIN 1698323
      //MsgDlg('O percentual máximo para Novo Plano não pode ser maior que 99,99%. ', 'Informação', mtConfirmation, [mbOk], 0);
      MsgDlg('O percentual máximo para Novo Plano não pode ser maior que 100%. ', 'Informação', mtConfirmation, [mbOk], 0);
      //END - William Santana SOL 180408 KIN 1698323
      edtNovoPercentual.text :='';
      exit;
    end;
   end;

   if (cboPlanoPrev.KeyValue = 66) then begin
   // if strToFloat(edtNovoPercentual.Text) < 2 then begin    //William Santana SOL 227902 KIN 2061868
    if strToFloat(StringReplace((edtNovoPercentual.Text),'.','',[rfReplaceAll])) < 2 then begin    //William Santana SOL 227902 KIN 2061868
      MsgDlg('O percentual mínimo para REB não pode ser menor que 2%. ', 'Informação', mtConfirmation, [mbOk], 0);
      edtNovoPercentual.text :='';
      exit;
//    end else if strToFloat(edtNovoPercentual.Text) >= 100 then begin   //William Santana SOL 227902 KIN 2061868
      end else if strToFloat(StringReplace((edtNovoPercentual.Text),'.','',[rfReplaceAll])) > 100 then begin    //William Santana SOL 227902 KIN 2061868
      //William Santana SOL 180408 KIN 1698323
      //MsgDlg('O percentual máximo para REB não pode ser maior que 99,99%. ', 'Informação', mtConfirmation, [mbOk], 0);
      MsgDlg('O percentual máximo para REB não pode ser maior que 100%. ', 'Informação', mtConfirmation, [mbOk], 0);
      //END - William Santana SOL 180408 KIN 1698323
      edtNovoPercentual.text :='';
      exit;
    end;
   end;
  end;
  //inicio - William Santana SOL 180408 KIN 1698323
  if {(trim(edtMatricula.Text)='') AND} (Trim(cboPlanoPrev.Text)='') then //William Moreira da Silva - SOL 227741 KINTANA 2061694
     exit;
  //Fim - William Santana SOL 180408 KIN 1698323
  
  //BRUNO AZEVEDO SOL 147489 Kintana 1023626
  if (bNovaMatricula) then begin
    idPessoa   := IntToStr(LeUltRegistro(nil,'PESSOA'));
  end;
  //BRUNO AZEVEDO SOL 147489 Kintana 1023626

  // Inicio - Fernando Santana - SOL 140614 Kintana 883624
  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' SELECT COUNT(*) QNT FROM PARTPREVPLAN PPP');
  QryAux.SQL.Add(' WHERE PPP.IDPESSOA     = '+ idPessoa  );
  QryAux.SQL.Add(' AND PPP.IDPLANOPREV    = '+ intTostr(cboPlanoPrev.KeyValue));
  //QryAux.SQL.Add(' AND PPP.IDSITPLANOPREV = 1');

  QryAux.Open;

  //TADEU PASSOS SOL 180408 KINTANA 1698323, foi comentando para permitir alteração do registro
  if (QryAux.FieldByname('QNT').asInteger > 0) and not(frmInscricaoParticipanteLote.bEditar) then begin // Felipe A. Santos permitir alteração só quando clicar em procurar (descomentei)
    MsgDlg('Participante já inscrito nesse plano, realizar a reinscrição', 'Informação', mtConfirmation, [mbOk], 0);
    LimparCampos();
    Exit;
  end;
  //TADEU PASSOS SOL 180408 KINTANA 1698323

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' SELECT PLAN.NOME FROM PLANPREV PLAN, PARTPREVPLAN PPP  WHERE PPP.Idplanoprev = PLAN.Idplanoprev');
  QryAux.SQL.Add(' and PPP.FLGDESATIVADO = 0 and DATACANCELAMENTO is null' );
  QryAux.SQL.Add(' AND PPP.IDPESSOA      = '+ idPessoa  );
  QryAux.SQL.Add(' AND PPP.IDPLANOPREV   <> '+ intTostr(cboPlanoPrev.KeyValue));
  QryAux.Open;

  sNome := '';
  QryAux.First;

  while not QryAux.Eof do
  begin
    sNome := ','+QryAux.FieldByname('NOME').asstring;
    QryAux.Next;
  end;

  sNome := COPY(sNome,2,LENGTH(sNome));

  iPossuiPlanoAtivo := 0; //TADEU PASSOS SOL 180408 KINTANA 1698323
  if trim(sNome) <> '' then
  begin
    if MsgDlg('Esta matrícula já possui o plano '+sNome+' ativo! Deseja continuar? ', 'Informação', mtConfirmation, [mbyes,mbno], 0) = mryes then
     iPossuiPlanoAtivo := 1  //TADEU PASSOS SOL 180408 KINTANA 1698323
     {//William Santana SOL 180408 KINTANA 1698323
     begin
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' update PARTPREVPLAN set PARTPREVPLAN.FLGDESATIVADO  = 1 , DATACANCELAMENTO =  '+#39+ FormatDateTime('dd/mm/yyyy',(dtInscricao.Date - 1))+#39);
      QryAux.SQL.Add(' WHERE  PARTPREVPLAN.IDPESSOA     = '+ idPessoa  );
      QryAux.SQL.Add(' AND    PARTPREVPLAN.IDPLANOPREV  <> '+ intTostr(cboPlanoPrev.KeyValue));
      qryAux.ExecSQL;
     end
     }//END - William Santana SOL 180408 KINTANA 1698323
    else
    begin
      LimparCampos();
      Exit;
    end;
  end;

  // Inicio - Fernando Santana - SOL 140614 Kintana 883624

  // TADEU PASSOS SOL 180408 KINTANA 1698323
  //Validando E-mail
  if Trim(edtEmail.Text) <> ''  then
    if not ValidaEmail(Pchar(edtEmail.Text)) then
    begin
      MsgDlg('Endereço de e-mail incorreto. Favor verificar!', 'Informação', mtConfirmation, [mbOk], 0);
      Exit;
    end;
  // TADEU PASSOS SOL 180408 KINTANA 1698323

  sPercentual := StringReplace(edtNovoPercentual.Text,',','.',[rfReplaceall]);

  if (cboPlanoPrev.KeyValue = 74) then begin
    if strToFloat(edtNovoPercentual.Text) > 12 then begin
      sPercentual := '12';
    end;
  end else if (cboPlanoPrev.KeyValue = 66) then begin
    if strToFloat(edtNovoPercentual.Text) > 7 then begin
      sPercentual := '7';
    end;
  end;

  //William Santana SOL 180408 KINTANA 1698323 - trecho movido para FIncreçãoParticipanteLote.pas
  {
  //BRUNO AZEVEDO SOL 147489 Kintana 1023626
  if (bNovaMatricula) then begin 
    //PESSOA
    sSQL := '';
    sSQL := 'insert into PESSOA ' +
            '(IDPESSOA, NOME) ' +
            'values (' +
            idPessoa + ',' +
            QuotedStr(edtNome.Text) + ')';

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;

    //ELEGIVEL
    sSQL := '';
    sSQL := 'insert into "ELEGIVEL" ' +
            '(IDPESSOA) ' +
            'values (' +
            idPessoa + ')';

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;

    //PESSOA FISICA
    sSQL := '';
    sSQL := 'insert into PESSOAFISICA ' +
            '(IDPESSOA) ' +
            'values (' +
            idPessoa + ')';

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;

    //ELEGPATRO
    sSQL := '';
    sSQL := 'insert into ELEGPATRO ' +        //BRUNO AZEVEDO SOL 163405 KINTANA 1438825
            '(IDPESSOA, IDPESSJUR, MATRICULA, PARTICIPPREVID) ' +
            'values (' +
            idPessoa + ',' +
            sidPessJur + ',' +
            QuotedStr(edtMatricula.Text) + ', 1 )';

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;

    //DEPENDENTE
    sSQL := '';
    sSQL := 'insert into DEPENDENTE ' +
            '(IDPESSOA) ' +
            'values (' +
            idPessoa + ')';

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;

    //DEPENTIT
    sSQL := '';
    sSQL := 'insert into DEPENTIT ' +
            '(IDTITULAR, IDPESSOA, MATRICULA, IDDEPENDENCIA) ' +
            'values (' +
            idPessoa + ',' +
            idPessoa + ',' +
            QuotedStr(edtMatricula.Text) + ',' +
            QuotedStr('PRP') + ')';

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;
  end;
  //BRUNO AZEVEDO SOL 147489 Kintana 1023626

  //BRUNO AZEVEDO SOL 163405 KINTANA 1438825
  sSQL := '';
  sSQL := 'UPDATE ELEGPATRO SET PARTICIPPREVID = 1' +
          ' WHERE IDPESSOA  = ' + idPessoa +
          '   AND IDPESSJUR = ' +  sidPessJur;
  //BRUNO AZEVEDO SOL 163405 KINTANA 1438825

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.ExecSQL;

  //////////Inscreve Participante
  sSQL :='';
  sSQL :=
  'INSERT INTO PARTPREVPLAN'+
  '          (IDPESSJUR,IDPLANOPREV,IDPESSOA,SEQPROPOSTA,IDSITPART,'+
  '          IDSITPLANOPREV,INSCRICAONUMERO,INSCRICAODATA,INSCRICAOTIPO,'+
  '          SALINSCRICAO,SALPARTICIPACAO,SALMANTIDO,SALVINCULADO,VALORCALCINSS,'+
  '          FLGDEVEEMPRESTIMO,FLGDEVEASSISTENC,FLGDEVEPREVIDENC,VALORINFINSS,'+
  '          SALAUXDOENCA,DATAINICIOSITTEMP,DATAFIMSITTEMP,DATAINICIOMANUT,'+
  '          REQUERIMENTODATA,DTINICIOINSC,FLGFITESPECIAL,FLGDESATIVADO,'+
  '          PARTPREVPLAN.TIPOOPCAOIR, PARTPREVPLAN.DATAOPCAOIR,'+
  '          TRGDTINCLUSAO,TRGUSERINCLUSAO,FLGINSCRICAOLOTE) '+
  '          VALUES (                     '+
  '          '+sidPessJur+'        ,      '+
  '          '+intTostr(cboPlanoPrev.KeyValue)+',   '+
  '          '+idPessoa+',                '+
  '          1,                           '+
  '          1,                           '+
  '          1,                           '+
  '          '+edtMatricula.Text+',       '+
  '          '+QuotedStr(dtInscricao.Text)+',        '+
  '          NULL,                        '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          NULL,                        '+
  '          NULL,                        '+
  '          NULL,                        '+
  '          NULL,                        '+
  '          '+QuotedStr(dtInscricao.Text)+','+
  '          0,                           '+
  '          0 ,                          '+
  '          '+stipoopcaoir+        ',    '+
  '          '+QuotedStr(dtInscricao.Text)+',        '+
  '          SYSDATE,                     '+
  '          USER,                        '+
  '          1                        '+
  '          )';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.ExecSQL;


   sSQL:='';
   sSQL:=
  'INSERT INTO EVENTOSPREV EV '+
  '(ideventosprev, idsitplanoatual, idpessoa, idsitfuncatual,'+
  'ideventogerador, idpessjur, idsitpartatual, idplanoprev, idsitplanonovo,'+
  'idsitpartnovo, dataregistro, dataevento, flgefetivado, dataefetivado, idsitfuncnovo,'+
  'seqproposta, trgdtinclusao, trguserinclusao, inscricaonumero, datarequerimento, matricula)'+
  'VALUES(                    '+
  'SEQEVENTOSPREV.NEXTVAL,    '+
  '1,                         '+
  '          '+idPessoa+',    '+
  '1,                         '+
  '1,                         '+
  '          '+sidPessJur+',  '+
  '1,                         '+
  ''+intTostr(cboPlanoPrev.KeyValue)+', '+
  '1,                         '+
  '1,                         '+
  'SYSDATE,                   '+
  ''+QuotedStr(dtInscricao.Text)+',      '+
  '1,                         '+
  ''+QuotedStr(dtInscricao.Text)+',      '+
  '1,                         '+
  '1,                         '+
  'SYSDATE,                   '+
  'USER,                      '+
  ''+edtMatricula.Text+',     '+
  ''+QuotedStr(dtInscricao.Text)+',      '+
  ''+edtMatricula.Text+'      '+
  ')                          ';
  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.ExecSQL;

  sSQL :='';
  sSQL :=
  'INSERT INTO CONTRIBPREVPARTP CP '+
  '(CP.IDPESSJUR, CP.IDTPPERIODICIDADE, CP.IDPESSOA, CP.IDPLANOPREV,'+
  'CP.SEQPROPOSTA,  CP.IDCONTRIBUICAO, CP.FLGCOBRA, CP.FLGDESCFOLHA,'+
  'CP.FLGRETROATIVO , CP.DATAINICIO, CP.FLGRECALCULA,'+
  'CP.IDHISTPROPOSTA, CP.ULTMESPREPARO, CP.TRGDTINCLUSAO, CP.TRGUSERINCLUSAO,'+
  'CP.VALORBASE1)'+
  'VALUES'+
  '(      '+
  sidPessJur+',               '+
  '1,                         '+
  idPessoa+',                 '+
  intTostr(cboPlanoPrev.KeyValue)+',    '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  QuotedStr(dtInscricao.Text) +','+
  '1,                         '+
  '0,                         '+
  ' ''0000/00'' ,             '+
  'sysdate,                   '+
  'USER,                      '+
  StringReplace(edtNovoPercentual.Text,',','.',[rfReplaceall]) +')'   ;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.ExecSQL;

  sSQL :='';
  sSQL :=
  'INSERT INTO CONTRIBPREVPARTP CP '+
  '(CP.IDPESSJUR, CP.IDTPPERIODICIDADE, CP.IDPESSOA, CP.IDPLANOPREV,'+
  'CP.SEQPROPOSTA,  CP.IDCONTRIBUICAO, CP.FLGCOBRA, CP.FLGDESCFOLHA,'+
  'CP.FLGRETROATIVO , CP.DATAINICIO, CP.FLGRECALCULA,'+
  'CP.IDHISTPROPOSTA, CP.ULTMESPREPARO, CP.TRGDTINCLUSAO, CP.TRGUSERINCLUSAO,'+
  'CP.VALORBASE1)'+
  'VALUES'+
  '(      '+
  sidPessJur+',               '+
  '1,                         '+
  idPessoa+',                 '+
  intTostr(cboPlanoPrev.KeyValue)+',    '+
  '1,                         '+
  '21,                        '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  QuotedStr(dtInscricao.Text) +','+
  '1,                         '+
  '0,                         '+
  ' ''0000/00'' ,             '+
  'sysdate,                   '+
  'USER,                      '+
  sPercentual+')'   ;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.ExecSQL;


  sSQL :='';
  sSQL :=
  ' INSERT INTO RESERVAPART'+
  ' (IDTIPORESERVA, IDPLANOPREV, IDPESSOA , IDPESSJUR, DATAREFERENCIASA,'+
  ' SEQPROPOSTA, VALORRESERVA, FLGATIVO, FLGINCONSISTENCIA, IDPARTICIPANTE, trgdtinclusao, trguserinclusao)'+
  ' SELECT DISTINCT RP.IDTIPORESERVA , RP.IDPLANOPREV, P.IDPESSOA, P.IDPESSJUR,'+
  QuotedStr(dtInscricao.Text) +
  ' , 1, 0, 1, 0,P.IDPESSOA AS IDPARTICIPANTE,'+
  ' SYSDATE,'+
  ' USER'+
  ' FROM PARTPREVPLAN P, RESERVAXPLANO RP, RESERVAXCONTRIB RC, CONTRIBPREVPARTP CP'+
  ' WHERE P.IDPESSJUR = CP.IDPESSJUR AND'+
  ' P.IDPLANOPREV = CP.IDPLANOPREV AND'+
  ' P.IDPLANOPREV ='+ intTostr(cboPlanoPrev.KeyValue) +' AND'+
  ' P.IDPESSJUR = '+sidPessJur+' AND'+
  ' P.IDPESSOA = CP.IDPESSOA AND'+
  ' RP.IDPLANOPREV = P.IDPLANOPREV AND'+
  ' RP.ANALITICOSINTETI = ''A'' AND'+
  ' NVL(RP.FLGCOLETIVA,0) = 0 AND'+
  ' RC.IDPLANOPREV = RP.IDPLANOPREV AND'+
  ' RC.IDTIPORESERVA = RP.IDTIPORESERVA AND'+
  ' CP.IDCONTRIBUICAO IN (1,21) AND'+
  ' CP.IDCONTRIBUICAO = RC.IDCONTRIBUICAO    AND'+
  ' P.IDPESSOA   ='+ idPessoa +
  ' AND NOT EXISTS'+
  ' (SELECT 1'+
  ' FROM RESERVAPART R'+
  ' WHERE'+
  ' R.IDPESSJUR = P.IDPESSJUR AND'+
  ' R.IDPLANOPREV = P.IDPLANOPREV AND'+
  ' R.IDPESSOA = P.IDPESSOA AND'+
  ' R.IDTIPORESERVA = RP.IDTIPORESERVA AND'+
  ' R.IDPLANOPREV = RP.IDPLANOPREV )'+
  ' ORDER BY P.IDPESSOA';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  QryAux.ExecSQL;


  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' INSERT INTO HSTPERCONTRIBPREV ');
  QryAux.SQL.Add(' (IDHSTPERCONTRIBPREV,');
  QryAux.SQL.Add(' IDPESSJUR,');
  QryAux.SQL.Add(' IDPESSOA,');
  QryAux.SQL.Add(' IDPLANOPREV,');
  QryAux.SQL.Add(' IDCONTRIBUICAO,');
  QryAux.SQL.Add(' DTINICIO,');
  QryAux.SQL.Add(' DTFIM,');
  QryAux.SQL.Add(' PERCENTUAL,');
  QryAux.SQL.Add(' SEQPROPOSTA )VALUES( ');

  QryAux.SQL.Add('SEQHSTPERCONTRIBPREV.NEXTVAL,');
  QryAux.SQL.Add(Trim(sidPessJur)+',');
  QryAux.SQL.Add(Trim(idPessoa)        +',');
  QryAux.SQL.Add(Trim(intTostr(cboPlanoPrev.KeyValue))     +',');
  QryAux.SQL.Add(Trim('1')  +',');
  QryAux.SQL.Add(Trim(QuotedStr(dtInscricao.Text)) +',');
 // QryAux.SQL.Add('(SELECT TO_DATE(''01/''||TO_CHAR(TO_DATE('+QuotedStr(dtInscricao.Text)+',''DD/MM/YYYY''),''MM/YYYY''),''DD/MM/YYYY'')-1 FROM DUAL),');
  QryAux.SQL.Add('NULL,');
  QryAux.SQL.Add(Trim(StringReplace(edtNovoPercentual.Text,',','.',[rfReplaceall])) +',');
  QryAux.SQL.Add('1)');
  QryAux.ExecSQL;
 }
 //END - William Santana SOL 180408 KINTANA 1698323 - trecho movido para FIncreçãoParticipanteLote.pas

 with frmInscricaoParticipanteLote do begin
    CamposGridReadOnly(False); // Felipe A. Santos SOL 180408 KINTANA 1698323
    QryGrid.Append;

    if bNovaMatricula then
      QryGrid.FieldByName('NOVAMATRICULA').AsInteger := 1;

    QryGrid.FieldByName('MATRICULA').AsString         := edtMatricula.Text;
    QryGrid.FieldByName('IDPESSJUR').AsString         := sidPessJur;
    QryGrid.FieldByName('IDPESSOA').AsString          := idPessoa;
    QryGrid.FieldByName('NOME').AsString              := edtNome.Text;
    QryGrid.FieldByName('PERCENTUAL').AsString        := edtNovoPercentual.Text;
    QryGrid.FieldByName('PLANO').AsString             := cboPlanoPrev.Text;
    QryGrid.FieldByName('PLANOPREV').AsString         := intTostr(cboPlanoPrev.KeyValue);
    QryGrid.FieldByName('DATAINSCRICAO').AsString     := dtInscricao.Text;
    QryGrid.FieldByName('OPCAOIR').AsString           := stipoopcaoir;
    QryGrid.FieldByName('INSCRICAODATA').AsString     := dtInscricao.Text;
    QryGrid.FieldByName('DATAOPCAOIR').AsString       := dtOpcaoIR.Text;
    QryGrid.FieldByName('POSSUIPLANOATIVO').AsInteger := iPossuiPlanoAtivo;
    QryGrid.FieldByName('DATAEMISSAO').AsString       := dtRecebidoEm.Text; // Felipe A. Santos SOL 180408 KINTANA 1698323
    QryGrid.FieldByName('NUMDOCUMENTO').AsString      := dtRecebidoEm.Text;
    QryGrid.FieldByName('EMAILFUNCEF').AsString       := edtEmail.Text;
    QryGrid.FieldByName('INSCRICAONUMERO').AsString   := sInscricaoPart;
    QryGrid.FieldByName('IDCONTRIBUICAO').AsString    := sIdContribuicao;

    QryGrid.FieldByName('SEL').AsInteger := 1;    //William Santana SOL 180408 KINTANA 1698323

    if stipoopcaoir = '1' then begin
      QryGrid.FieldByName('DESCOPCAOIR').asString   :='PROGRESSIVA';
    end else begin
      QryGrid.FieldByName('DESCOPCAOIR').asString   :='REGRESSIVA';
    end;
    QryGrid.Post;
    CamposGridReadOnly(True); // Felipe A. Santos SOL 180408 KINTANA 1698323
  end;

  // Felipe A. Santos SOL 180408 KINTANA 1698323
  edtMatricula.Enabled := True;
  btnBusca.Enabled := True;
  // Felipe A. Santos SOL 180408 KINTANA 1698323 - fim

  LimparCampos();

end;

procedure TfrmInscBuscaParticipLote.edtNovoPercentual1KeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in ['0'..'9'])) and  (key <> #8)
    then key :=#0;

end;

procedure TfrmInscBuscaParticipLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  frmInscricaoParticipanteLote.Enabled := True;
  frmInscricaoParticipanteLote.pnlFundo.Enabled := true;

end;

procedure TfrmInscBuscaParticipLote.FormShow(Sender: TObject);
begin
  inherited;
  if frmInscricaoParticipanteLote.bEditar then
  begin
    edtNovoPercentual.Enabled := False;
    cboPlanoPrev.Enabled := False;
    edtNome.Enabled := False;
    dtInscricao.Enabled := False;
  end;

  dtDataCaixa.Date := BuscaDataFuncef(); //FuncoesUteis
end;

procedure TfrmInscBuscaParticipLote.LimparCampos;
begin
  edtMatricula.Text      := '';
  edtNome.Text           := '';
  edtNovoPercentual.Text := '';
  dtInscricao.Text       := '';
  cboPlanoPrev.KeyValue  := NULL;
  dtOpcaoIR.Text         := '';
  //dtEmissao.Text         := ''; // Felipe A. Santos SOL 180408 KINTANA 1698323
  dtRecebidoEm.Text      := '';
  edtEmail.Text          := '';

  QryPlanPrev.Close;
  edtMatricula.SetFocus;

end;

// TADEU PASSOS
function TfrmInscBuscaParticipLote.ValidaEMail(const EMailIn : PChar) : Boolean;
const
  CaraEsp: array[1..42] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°','é','ó');
var
  i,cont   : integer;
  EMail    : ShortString;
begin
  EMail := EMailIn;
  Result := True;
  cont := 0;
  if EMail <> '' then
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then    // existe @ .
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do            // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                Result := False;
            for i := 1 to length(EMail) do
            begin                                 // se existe apenas 1 @
              if EMail[i] = '@' then
                cont := cont + 1;                    // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                Result := false;
            end;
                                   // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
                Result := false;
                                            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              Result := False;
                                              // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              Result := False;
                                              // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;
end;
// TADEU PASSOS

procedure TfrmInscBuscaParticipLote.CamposEditaveis(pBol: boolean);
begin
   edtMatricula.Enabled := pBol;
   btnBusca.Enabled := pBol;
   edtNovoPercentual.Enabled := pBol;
   cboPlanoPrev.Enabled := pBol;
   edtNome.Enabled := pBol;
   dtInscricao.Enabled := pBol;
end;

end.
