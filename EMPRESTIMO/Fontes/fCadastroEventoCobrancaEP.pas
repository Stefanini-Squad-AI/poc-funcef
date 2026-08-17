{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SIG         : 92195
Data        : 01/12/2020
Autor       : Ewerton Beltramini
Descrição   : Ativar o processamento de um evento do Serasa, quando o outro estiver
              ativo. (13 e 22)
------------------------------------------------------------------------------    
Pendência   : SOL 259365/17844 PPM 1117826
Data        : 12/11/2012
Autor       : Michelle Suellyn Mota
Descrição   : Realizar ajustes na interface e gravação de dados da funcionalidade
              de cadastro de eventos de cobrança.
------------------------------------------------------------------------------
Pendência   : SOL 179255/10564 KINTANA 1728842
Data        : 28/08/2012
Autor       : William Moreira da Silva
Descrição   : Adicionar checkbox e coluna no grid vinculados ao campo SALDOTOTAL
------------------------------------------------------------------------------
Pendência   : SOL 179739 KINTANA 1658718
Data        : 18/06/2012
Autor       : José Roberto Marque - JRM6
Descrição   : Adicionar checkbox e coluna no grid vinculados ao campo FLGSOMENTEINADMES
--------------------------------------------------------------------------------
Pendência   : SOL 179738 KINTANA 1658716
Data        : 10/05/2012
Autor       : Thiago Melo
Descrição   : Chamar sequence seqtipoeventocobemptmo somente no caso de inserção
--------------------------------------------------------------------------------
}

unit fCadastroEventoCobrancaEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  Mask, wwdbedit, DBCtrls, Wwdotdot, Wwdbcomb, wwdblook, Spin;// Michelle Mota - SOL: 259365/17844 - PPM: 1117826

type
  TfrmCadastroEventoCobrancaEP = class(TFrmCadastroGridCS)
    edtDescEvento: TwwDBEdit;
    Label1: TLabel;
    QryAux: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    wwDBComboBox1: TwwDBComboBox;
    Label4: TLabel;
    wdblkpcmbDependeEvento: TwwDBLookupCombo;// Michelle Mota - SOL: 259365/17844 - PPM: 1117826
    qryEventoEmptmo: TwwQuery;
    qryEventoEmptmoIDTIPOEVENTOCOBEMPTMO: TFloatField;
    qryEventoEmptmoDESCEVENTOCOB: TStringField;
    CBAPartirde: TCheckBox;
    wwDbeSaldoTotal: TwwDBEdit;
    lblSaldoTotal: TLabel;
	// Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
    dbrgrpTipoEvento: TDBRadioGroup;
    dbrgrpLancEvento: TDBRadioGroup;
    pnlLayout: TPanel;
    lblDepEv: TLabel;
    lblRepetir: TLabel;
    seContConfAR: TSpinEdit;
    seEdtPeriodo: TSpinEdit;
    dbchkAcordoJudicial: TDBCheckBox;
    dbchkLancManual: TDBCheckBox;
    dbchkCancPresc: TDBCheckBox;
    dbchkEventoDesativ: TDBCheckBox;
    dbchkConfAR: TDBCheckBox;
    qryAuxSerasa: TwwQuery;
	// Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryBeforeInsert(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure wwDBComboBox1Exit(Sender: TObject);
	// Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
    procedure seEdtPeriodoKeyPress(Sender: TObject; var Key: Char);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
	// Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826  
  private
    { Private declarations }
  public
    { Public declarations }
    bOK : Boolean;
  end;

var
  frmCadastroEventoCobrancaEP: TfrmCadastroEventoCobrancaEP;

implementation
uses UMensErro;

{$R *.DFM}

procedure TfrmCadastroEventoCobrancaEP.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  qry.Close;
  Qry.Prepare; // Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  qry.Open;

end;

procedure TfrmCadastroEventoCobrancaEP.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;

  Accept := True;
  bOK    := True;


  if trim(edtDescEvento.Text)='' then begin  // Michelle Mota - SOL: 259365/17844 - PPM: 1117826
    MsgDlg('Por favor, preencha a descrição do Evento.', 'Empréstimo', mtWarning, [mbOk], 0);
    edtDescEvento.SetFocus;
    Accept := False;
    Abort; // Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  end;

  QryAux.Close;
  QryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT * FROM TIPOEVENTOCOBEMPTMO');
  qryAux.SQL.Add(' WHERE DESCEVENTOCOB =' + QuotedStr(edtDescEvento.Text));
  if Qry.State = dsEdit then begin
    qryAux.SQL.Add(' AND ROWID <>' + QuotedStr(qry.FieldByname('ROWID').asString));
  end;

  QryAux.Open;

  if not QryAux.isEmpty then begin
    MsgDlg('Esse evento já foi cadastrado!', 'Empréstimo', mtWarning, [mbOk], 0);
    Accept := False;
    bOK    := False;
  end;
  
  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  if (wdblkpcmbDependeEvento.Text = '') and (dbrgrpTipoEvento.ItemIndex = 2 ) then begin
    MsgDlg('Para eventos de Adimplência é obrigatório informar o campo “Depende do Evento”.', 'Empréstimo', mtWarning, [mbOk], 0);
    Accept := False;
    bOK    := False;
  end;
  // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826

end;

procedure TfrmCadastroEventoCobrancaEP.bbtnConfirmarClick(Sender: TObject);
begin

  {if StrToIntDef(seEdtPeriodo.text,0) = 0 then // Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  begin
    MsgDlg('O campo Período é Obrigatório.', 'Empréstimo', mtWarning, [mbOk], 0);
    exit;
  end; }

  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  if StrToIntDef(seEdtPeriodo.text,0) <= 0 then
  begin
    MsgDlg('O campo Período precisa ser maior do que zero.', 'Empréstimo', mtWarning, [mbOk], 0);
    exit;
  end;
  // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826


  //Ewerton Beltramini - 01/12/2020 - SIG92195 - Inicio...
  case  qry.FieldByName('IDTIPOEVENTOCOBEMPTMO').AsInteger of
       13:
       begin
            if (qry.FieldByName('FLGDESATIVADO').AsInteger = 0) then
            begin
                 qryAuxSerasa.Close;
                 qryAuxSerasa.SQL.Clear;
                 qryAuxSerasa.SQL.Add('update TIPOEVENTOCOBEMPTMO');
                 qryAuxSerasa.SQL.Add('set FLGDESATIVADO = 0');
                 qryAuxSerasa.SQL.Add('where IDTIPOEVENTOCOBEMPTMO in (22)');
                 qryAuxSerasa.ExecSQL;
            end
            else if (qry.FieldByName('FLGDESATIVADO').AsInteger = 1) then
            begin
                 qryAuxSerasa.Close;
                 qryAuxSerasa.SQL.Clear;
                 qryAuxSerasa.SQL.Add('update TIPOEVENTOCOBEMPTMO');
                 qryAuxSerasa.SQL.Add('set FLGDESATIVADO = 1');
                 qryAuxSerasa.SQL.Add('where IDTIPOEVENTOCOBEMPTMO in (22)');
                 qryAuxSerasa.ExecSQL;            end;
       end;
       22:
       begin
            if (qry.FieldByName('FLGDESATIVADO').AsInteger = 0) then
            begin
                 qryAuxSerasa.Close;
                 qryAuxSerasa.SQL.Clear;
                 qryAuxSerasa.SQL.Add('update TIPOEVENTOCOBEMPTMO');
                 qryAuxSerasa.SQL.Add('set FLGDESATIVADO = 0');
                 qryAuxSerasa.SQL.Add('where IDTIPOEVENTOCOBEMPTMO in (13)');
                 qryAuxSerasa.ExecSQL;
            end
            else  if (qry.FieldByName('FLGDESATIVADO').AsInteger = 1) then
            begin
                 qryAuxSerasa.Close;
                 qryAuxSerasa.SQL.Clear;
                 qryAuxSerasa.SQL.Add('update TIPOEVENTOCOBEMPTMO');
                 qryAuxSerasa.SQL.Add('set FLGDESATIVADO = 1');
                 qryAuxSerasa.SQL.Add('where IDTIPOEVENTOCOBEMPTMO in (13)');
                 qryAuxSerasa.ExecSQL;
            end;
       end;
  end;
  //Ewerton Beltramini - 01/12/2020 - SIG92195 - Fim.

  inherited;

  if bOK then begin
    bbtnCancelar.Click;
  end;

end;

procedure TfrmCadastroEventoCobrancaEP.sbtnApagarClick(Sender: TObject);
begin
  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
    begin

      QryAux.Close;
      QryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT COUNT(*) QTD FROM HISTEVENTOCOBEMPTMO');
      qryAux.SQL.Add(' WHERE IDTIPOEVENTOCOBEMPTMO =' + Qry.FieldByname('IDTIPOEVENTOCOBEMPTMO').asstring) ;
      QryAux.Open;

      if QryAux.FieldByname('QTD').asinteger > 0 then begin
        MsgDlg('Este evento de cobrança foi lançado para um ou mais contratos. Não será possivel realizar a exclusão', 'Empréstimo', mtWarning, [mbOk], 0);
        exit;
      end;

    end;
  // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826 
  inherited;

end;

procedure TfrmCadastroEventoCobrancaEP.FormCreate(Sender: TObject);
begin
   inherited;
   dbGrd.BringToFront;//William Moreira da Silva SOL 179255/10564 KINTANA 1728842
   dbGrd.Align := alClient;//Michelle Mota - SOL: 259365/17844 - PPM: 1117826
   qryEventoEmptmo.open;

end;

procedure TfrmCadastroEventoCobrancaEP.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('tipoperiodo').asstring     := wwDBComboBox1.Value;
  qry.FieldByName('flgpartirde').asstring     := inttostr(ord(CBAPartirde.checked));

  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  {qry.FieldByName('flgsomenteadimp').asstring := inttostr(ord(CBAdimpl.checked));
  // SOL 179739 KINTANA 1658718 = JRM6 - 18/06/2012
  qry.FieldByName('flgsomenteinadmes').asstring := inttostr(ord(CBInadimp.checked));
  // SOL 179739 KINTANA 1658718 = JRM6 - 18/06/2012  }
  qry.FieldByName('REPETIRSEMAR').AsString := seContConfAR.Text;
  qry.FieldByName('PERIODO').AsString := seEdtPeriodo.Text;
  // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826

  // THIAGO MELO - SOL 179738 KINTANA 1658716-ADD IF STATE QUERY
  if qry.State = dsInsert then
  begin
    QryAux.Close;
    QryAux.SQL.Clear;
    qryAux.SQL.Add(' select seqtipoeventocobemptmo.nextval as sequencial from dual ');
    QryAux.open;
    qry.FieldByName('IDTIPOEVENTOCOBEMPTMO').asstring  := qryAux.fieldByName('sequencial').asstring;
  end;
  // THIAGO MELO - SOL 179738 KINTANA 1658716

end;

procedure TfrmCadastroEventoCobrancaEP.qryBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  CBAPartirde.checked := false;
  //Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  //CBAdimpl.checked := false;
  // SOL 179739 KINTANA 1658718 = JRM6 - 18/06/2012
  //CBInadimp.Checked := False;
  // SOL 179739 KINTANA 1658718 = JRM6 - 18/06/2012
  //Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
end;

procedure TfrmCadastroEventoCobrancaEP.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if qry.state in [dsedit] then
   begin
      wwDBEdit1.readonly := false;
      wwDBEdit1.text     := qry.fieldByName('IDTIPOEVENTOCOBEMPTMO').asstring;
      wwDBEdit1.readonly := true;
   end;
end;

procedure TfrmCadastroEventoCobrancaEP.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  if qry.fieldByName('tipoperiodo').asstring = 'D' then
    wwDBComboBox1.itemindex := 0
  else
  if qry.fieldByName('tipoperiodo').asstring = 'M' then
    wwDBComboBox1.itemindex := 1
  else
    wwDBComboBox1.itemindex := -1;

  wwDbeSaldoTotal.Text := trim(wwDbeSaldoTotal.Text);//William Moreira da Silva SOL 179255/10564 KINTANA 1728842
  CBAPartirde.checked := (qry.FieldByName('flgpartirde').asinteger     = 1);
  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826

  //CBAdimpl.checked := (qry.FieldByName('flgsomenteadimp').asinteger = 1);
  // SOL 179739 KINTANA 1658718 = JRM6 - 18/06/2012
  //CBInadimp.checked := (qry.FieldByName('flgsomenteinadmes').asinteger = 1);
  // SOL 179739 KINTANA 1658718 = JRM6 - 18/06/2012
  seContConfAR.Text := qry.FieldByName('REPETIRSEMAR').AsString;
  seEdtPeriodo.Text := qry.FieldByName('PERIODO').AsString;

  with qryEventoEmptmo do
    begin
      sql.Clear;
      sql.Add('SELECT IDTIPOEVENTOCOBEMPTMO, ');
      sql.Add('       DESCEVENTOCOB ');
      sql.Add('  FROM TIPOEVENTOCOBEMPTMO ');
      sql.Add('WHERE IDTIPOEVENTOCOBEMPTMO <> ' + qry.FieldByName('IDTIPOEVENTOCOBEMPTMO').AsString);
      sql.Add('union ');
      sql.Add('SELECT null  , ');
      sql.Add('       ''   '' ');
      sql.Add('  FROM TIPOEVENTOCOBEMPTMO where rownum = 1 ');
      sql.Add('order by 2');
      Prepare;
      Open;
    end;
  // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
end;

procedure TfrmCadastroEventoCobrancaEP.wwDBComboBox1Exit(Sender: TObject);
begin
   inherited;
   if trim(wwDBComboBox1.Value) = '' then
      wwDBComboBox1.itemindex := 0;

end;

procedure TfrmCadastroEventoCobrancaEP.seEdtPeriodoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  //William Moreira da Silva SOL 179255/10564 KINTANA 1728842
  if not (key in ['0'..'9',#8,#44]) then
     key := #0;
end;

procedure TfrmCadastroEventoCobrancaEP.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  qry.FieldByName('TIPOEVENTO').asstring := 'I';
  qry.FieldByName('TIPOBASELANCAMENTO').asstring := 'T';
  wwDbeSaldoTotal.Text := '0,00';
  qry.FieldByName('FLGMANUAL').AsInteger := 0;
  qry.FieldByName('FLGACORDOJUDICIAL').AsInteger := 0;
  qry.FieldByName('FLGCANCELPRESCRITO').AsInteger := 0;
  qry.FieldByName('FLGDESATIVADO').AsInteger := 0;
  qry.FieldByName('FLGCONFIRMSITAR').AsInteger := 0;
  qry.FieldByName('REPETIRSEMAR').AsInteger := 0;
  // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
end;

procedure TfrmCadastroEventoCobrancaEP.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // Início - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
  if (qry.FieldByName('FLGDESATIVADO').AsInteger = 1) then
    AFont.Color := clSilver
  else
    AFont.Color := clBlack;
   // Término - Michelle Mota - SOL: 259365/17844 - PPM: 1117826
end;

end.
