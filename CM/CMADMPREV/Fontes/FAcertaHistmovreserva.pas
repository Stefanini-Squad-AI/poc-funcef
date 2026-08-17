unit FAcertaHistmovreserva;

// Alterações
{---------------------------------------------------------------------------------------------------
Pendência   : SIG 24360
Responsável : Edilaine
Data        : 18/06/2018
Descrição   : Atualização de saldo das reserva
--------------------------------------------------------------------------------
Autor(a)  : Ádler Souza
Data      : 22/04/2010
Rotina    : bbtnConfirmarClick
Pendencia : SOL 126264 Kintana 661043
Alteração : Implementação de botão que chama diretamente a Procedure do banco.
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 04/09/2007
Rotina    : bbtnConfirmarClick
Pendencia : 22119
Alteração : Confirmar a FrmAguarde seja sempre fechada qdo terminar a uma operação
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 11/01/2007 a 12/01/2007
Rotina    : MontaSelect e
Pendencia : 22679
Alteração : - Retirado o filtro por flgDesativado = 0 do MontaSelect, permitindo-se ajustar reservas
              em planos/patros anteriores
            - Ajustes no visual do form e reorganização do código, inclusive na AcertaHistMovReserva
              (uMovReserva)
            - Inclusão dos campos de nome do plano e patrocinadora na grid para deixar claro o que
              será tratado
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 24/05/2006
Rotina    : bbtnConfirmarClick
Pendencia : 22435 - SOL(43497)
Alteração : Alterado o if que starta a transação, estava sem o "not"
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 27/01/2005
Pendencia : 17285
Rotina    : rgOpcaoClick, FormShow, dblkcPlanoPatroClick, dblkcPatroExit, bbtnProcurarClick, SpeedButton2Click
Alteração : Implementando opção de acertar por Patro / Plano
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 23/06/2003
Alteração : Inclusao do Filtro de MULTI-FUNDACAO
---------------------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Spin, wwdblook;

type
  TfrmAcertaHistmovreserva = class(TfrmOkCancelar)
    plnTop: TPanel;
    Splitter1: TSplitter;
    plnbottom: TPanel;
    MontaSelectPart: TMontaSelect;
    wwDBGrid1: TwwDBGrid;
    qryAuxInsere: TwwQuery;
    updAuxInsere: TUpdateSQL;
    dsAuxInsere: TwwDataSource;
    qryAux: TwwQuery;
    pnlOpcao2: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    bbtnProcurar: TBitBtn;
    rgOpcao: TRadioGroup;
    pnlDadosParticipante: TPanel;
    lblParticip: TLabel;
    lblPatro: TLabel;
    Label3: TLabel;
    lblMatricula: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    pnlPatroPlano: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBcboPatro: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    DBcboPlano: TwwDBLookupCombo;
    qryPatroPlano: TwwQuery;
    Panel3: TPanel;
    btnExcluir: TBitBtn;
    btnIncluir: TBitBtn;
    bbtnAtReserva: TBitBtn;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure AtualizaSaldo(inIdPessoa , inIdPessJur, inIdPlanoPrev, iTipo : integer);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure rgOpcaoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBcboPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboPatroExit(Sender: TObject);
    procedure bbtnAtReservaClick(Sender: TObject);


  private // Private declarations


  public  // Public declarations

    sIdPessoa     : String;
    sIdPessJur    : String;
    sIdPlanoPrev  : String;
    sSeqProposta  : String;


  end;



var
  frmAcertaHistmovreserva: TfrmAcertaHistmovreserva;



implementation
{$R *.DFM}
uses
  UMovReserva, fAguarde, DBaseDados, UMensErro, Usistema, UAdmPrev;




procedure TfrmAcertaHistmovreserva.bbtnProcurarClick(Sender: TObject);
var
  sMsg : String;
begin
  inherited;

  
  if rgOpcao.ItemIndex = 0 then
  begin
    MontaSelectPart.Executar;

    if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
    begin
      sIdPessoa        := MontaSelectPart.ValoresChave[0];
      sIdPessJur       := MontaSelectPart.ValoresChave[1];
      sIdPlanoPrev     := MontaSelectPart.ValoresChave[5];
      sSeqProposta     := MontaSelectPart.ValoresChave[7];
      edNome.Text      := MontaSelectPart.ValoresChave[2];
      edMatricula.Text := MontaSelectPart.ValoresChave[3];
      edPatro.Text     := MontaSelectPart.ValoresChave[4];
      edPlano.Text     := MontaSelectPart.ValoresChave[6];
    end;
  end
  else
  begin
    if DBcboPatro.LookupValue = '' then
    begin
      MsgDlg('A Patrocinadora não deve ficar em branco!','Atenção',mtError,[mbOk],0);
      DBcboPatro.SetFocus;
      Exit;
    end;

    if DBcboPlano.LookupValue = '' then
    begin
      MsgDlg('O plano da Patrocinadora não deve ficar em branco!', 'Atenção', mtError, [mbOk], 0);
      DBcboPlano.SetFocus;
      Exit;
    end;

    qryPatroPlano.Close;
    qryPatroPlano.ParamByName('IDPESSJUR').AsInteger   := StrToInt(DBcboPatro.LookupValue);
    qryPatroPlano.ParamByName('IDPLANOPREV').AsInteger := StrToInt(DBcboPlano.LookupValue);
    qryPatroPlano.Open;

    sMsg := 'Foram selecionados ' + IntToStr(qryPatroPlano.RecordCount) + ' participantes para' + #13 + #10 +
            'a patrocinadora / plano escolhidos.' + #13 + #10 +
            'Deseja realmente inserir todos?';

    if MsgDlg(sMsg, 'Atenção', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Repaint;
      btnIncluirClick(Self);
    end;
  end;

end;



procedure TfrmAcertaHistmovreserva.FormCreate(Sender: TObject);
begin
  inherited;
  qryAuxInsere.open;
end;



procedure TfrmAcertaHistmovreserva.bbtnConfirmarClick(Sender: TObject);
var
  iContFim            : Integer;
  sMsg                : String;
  sAnoMesCobrancaTela : String;
begin
  inherited;

  if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

  sAnoMesCobrancaTela := Trim(spedAnoCob.Text) + '/' + FormatFloat('00', (cmbMesCob.ItemIndex + 1));

  frmAguarde.Pos      := 1;  //frmAguarde.Pos+1;                     //edilaine - SIG24360
  iContFim            := qryAuxInsere.RecordCount;

  Try
    qryAuxInsere.First;
    while not(qryAuxInsere.EOF) do
    begin
      frmAguarde.Mostra('Acertando ' + IntToStr(frmAguarde.Pos) + ' de ' + IntToStr(iContFim) + '.');

      if not(AcertaHistMovReserva(sAnoMesCobrancaTela,   {qryAux,}                    //edilaine - SIG24360
                                  qryAuxInsere.FieldByName('IDPESSJUR').AsInteger,
                                  qryAuxInsere.FieldByName('IDPLANOPREV').AsInteger,
                                  qryAuxInsere.FieldByName('IDPESSOA').AsInteger,
                                  qryAuxInsere.FieldByName('SEQPROPOSTA').AsInteger
                                  //sAnoMesCobrancaTela                               //edilaine - SIG24360
                                 )) then
      begin
        frmAguarde.Apaga;
        Repaint;
        Exit;
      end;

      frmAguarde.Pos := frmAguarde.Pos + 1;
      qryAuxInsere.next;
    end;

    sMsg := 'Acerto efetuado com sucesso. Deseja efetivar a operação?';
  Finally
    frmAguarde.Apaga;
  End;

  if MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Repaint;
    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
  end
  else
  begin
    try
      if not Sistema.GravaLogOperacoes(Self.Caption) then
        raise exception.Create('Erro ao gravar Log.')
    except
    end;

    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
  end;
end;



procedure TfrmAcertaHistmovreserva.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;

  DecodeDate(date, AYear, AMonth, ADay);

  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cmbMesCob.ItemIndex := AMonth - 1;
    cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
    spedAnoCob.Text     := IntToStr(AYear);
  end;

  spedAnoCob.Text := IntToStr(AYear);
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 

  pnlDadosParticipante.BringToFront; 
end;



procedure TfrmAcertaHistmovreserva.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;

  qryAuxInsere.Close;
  qryAuxInsere.Open;
end;

procedure TfrmAcertaHistmovreserva.rgOpcaoClick(Sender: TObject);
begin
  inherited;

  case rgOpcao.ItemIndex Of

    0: pnlDadosParticipante.BringToFront;

    1:
    begin
      pnlPatroPlano.BringToFront;
      if not(qryPatro.Active) then qryPatro.Open;
    end;

  end;
end;



procedure TfrmAcertaHistmovreserva.btnIncluirClick(Sender: TObject);
begin
  inherited;
  
  if rgOpcao.ItemIndex = 0 then
  begin
    if trim(edNome.Text) <> '' then
    begin
      qryAuxInsere.Insert;

      qryAuxInsere.FieldByName('IDPESSJUR').AsString    := sIdPessjur;
      qryAuxInsere.FieldByName('IDPESSOA').AsString     := sIdPessoa;
      qryAuxInsere.FieldByName('IDPLANOPREV').AsString  := sIdPlanoPrev;
      qryAuxInsere.FieldByName('NOME').AsString         := edNome.Text;
      qryAuxInsere.FieldByName('MATRICULA').AsString    := edMatricula.Text;
      qryAuxInsere.FieldByName('SEQPROPOSTA').AsString  := sSeqProposta;

      
      qryAuxInsere.FieldByName('PLANO').AsString        := edPlano.Text;
      qryAuxInsere.FieldByName('PATRO').AsString        := edPatro.Text;
      

      qryauxInsere.Post;
    end;
  end
  else  
  begin
    if (qryPatroPlano.Active) and (qryAuxInsere.IsEmpty) then
    begin
      qryPatroPlano.First;
      while not(qryPatroPlano.EOF) do
      begin
        qryAuxInsere.Insert;

        qryAuxInsere.FieldByName('IDPESSJUR').AsInteger   := qryPatroPlano.FieldByName('IDPESSJUR').AsInteger;
        qryAuxInsere.FieldByName('IDPESSOA').AsInteger    := qryPatroPlano.FieldByName('IDPESSOA').AsInteger;
        qryAuxInsere.FieldByName('IDPLANOPREV').AsInteger := qryPatroPlano.FieldByName('IDPLANOPREV').AsInteger;
        qryAuxInsere.FieldByName('NOME').AsString         := qryPatroPlano.FieldByName('NOME').AsString;
        qryAuxInsere.FieldByName('MATRICULA').AsString    := qryPatroPlano.FieldByName('MATRICULA').AsString;
        qryAuxInsere.FieldByName('SEQPROPOSTA').AsInteger := qryPatroPlano.FieldByName('SEQPROPOSTA').AsInteger;

        
        qryAuxInsere.FieldByName('PLANO').AsString        := qryPatroPlano.FieldByName('PLANO').AsString;
        qryAuxInsere.FieldByName('PATRO').AsString        := qryPatroPlano.FieldByName('NOMEPATRO').AsString;
        

        qryauxInsere.Post;

        qryPatroPlano.Next;
      end;
    end;
  end;
  
end;



procedure TfrmAcertaHistmovreserva.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if not(qryAuxInsere.IsEmpty) then qryAuxInsere.Delete;
end;



procedure TfrmAcertaHistmovreserva.DBcboPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if DBcboPatro.LookupValue <> '' then
  begin
    qryPlano.Close;
    qryPlano.ParamByName('IDPESSOA').AsInteger := StrToInt(DBcboPatro.LookupValue);
    qryPlano.Open;
  end;

  DBcboPlano.Enabled := not(qryPlano.IsEmpty);
end;



procedure TfrmAcertaHistmovreserva.DBcboPatroExit(Sender: TObject);
begin
  inherited;

  if DBcboPatro.LookupValue <> '' then
  begin
    qryPlano.Close;
    qryPlano.ParamByName('IDPESSOA').AsInteger := StrToInt(DBcboPatro.LookupValue);
    qryPlano.Open;
  end;

  DBcboPlano.Enabled := not(qryPlano.IsEmpty);
end;

//Ádler Souza - SOL 126264 Kintana 661043

procedure TfrmAcertaHistmovreserva.AtualizaSaldo(inIdPessoa , inIdPessJur, inIdPlanoPrev, iTipo : integer);
var
SP_PROC : TStoredProc;
begin
  try
    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName  := 'BaseDados';

    if iTipo = 0 then
    begin
      SP_PROC.StoredProcName := 'PCK_CTB_FUNCAO_RESERVA.PR_ATUALIZA_SALDO_PART';

      SP_PROC.Params.CreateParam(ftInteger,   'inIdPessoa',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIdPessJur',        ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIdPlanoPrev',      ptinput);

      if (inIdPessoa <> 0) then begin
        SP_PROC.parambyName('inIdPessoa').asInteger   := inIdPessoa;
      end else begin
        SP_PROC.parambyName('inIdPessoa').Clear;
      end;

      if inIdPessJur <> 0 then begin
        SP_PROC.parambyName('inIdPessJur').asInteger   := inIdPessJur;
      end else begin
        SP_PROC.parambyName('inIdPessJur').Clear;
      end;

      if inIdPlanoPrev <> 0 then begin
        SP_PROC.parambyName('inIdPlanoPrev').asInteger := inIdPlanoPrev;
      end else begin
        SP_PROC.parambyName('inIdPlanoPrev').Clear;
      end;

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      SP_PROC.Destroy;
    end else
    begin
      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName  := 'BaseDados';

      SP_PROC.StoredProcName := 'PCK_CTB_FUNCAO_RESERVA.PR_ATUALIZA_SALDO_PATROPLAN';

      SP_PROC.Params.CreateParam(ftInteger,   'inIdPessJur',        ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIdPlanoPrev',      ptinput);

      if inIdPessJur <> 0 then begin
        SP_PROC.parambyName('inIdPessJur').asInteger    := inIdPessJur;
      end else begin
        SP_PROC.parambyName('inIdPessJur').Clear;
      end;

      if inIdPlanoPrev <> 0 then begin
        SP_PROC.parambyName('inIdPlanoPrev').asInteger := inIdPlanoPrev;
      end else begin
        SP_PROC.parambyName('inIdPlanoPrev').Clear;
      end;

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      SP_PROC.Close;
    end;
  except
    MsgDlg('Erro ao Atualizar Saldo', 'Erro', mtError, [mbOk], 0);
  end;
end;

//Ádler Souza - SOL 126264 Kintana 661043 - Fim

procedure TfrmAcertaHistmovreserva.bbtnAtReservaClick(Sender: TObject);
var
sMsg : String;
begin
  inherited;
  //Ádler Souza - SOL 126264 Kintana 661043

  if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

  if rgOpcao.ItemIndex = 0 then
  begin
    qryAuxInsere.First;

    frmAguarde.Mostra('Aguarde...');
    while not(qryAuxInsere.EOF) do
    begin
      AtualizaSaldo( qryAuxInsere.FieldByName('IDPESSOA').AsInteger,
                     qryAuxInsere.FieldByName('IDPESSJUR').AsInteger,
                     qryAuxInsere.FieldByName('IDPLANOPREV').AsInteger,
                     rgOpcao.ItemIndex);
      qryAuxInsere.next;
    end;
    frmAguarde.Apaga;
  end
  else
  begin
      frmAguarde.Mostra('Aguarde...');
      AtualizaSaldo( qryAuxInsere.FieldByName('IDPESSOA').AsInteger,
                     qryPatroPlano.ParamByName('IDPESSJUR').AsInteger,
                     qryPatroPlano.ParamByName('IDPLANOPREV').AsInteger,
                     rgOpcao.ItemIndex);
      frmAguarde.Apaga;
  end;


    sMsg := 'Acerto efetuado com sucesso. Deseja efetivar a operação?';

    if MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Repaint;
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
    end
    else
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

  //Ádler Souza - SOL 126264 Kintana 661043 - Fim

end;

end.




