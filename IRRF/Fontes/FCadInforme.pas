unit FCadInforme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, fcCombo, fctreecombo, DBCtrls, Wwdotdot,
  Wwdbcomb, CmEventosCadastro, ImgList;

type
  TfrmCadInforme = class(TfrmCadastroCS)
    dbedNome: TwwDBEdit;
    lblNome: TLabel;
    Label1: TLabel;
    dbrgDirf: TDBRadioGroup;
    dbckRendimentoBruto: TDBCheckBox;
    dbckIRRF: TDBCheckBox;
    ImageList1: TImageList;
    dbedCodInforme: TwwDBEdit;
    dbrgNatureza: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dbckRendimentoBrutoClick(Sender: TObject);
    procedure dbckIRRFClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInforme: TfrmCadInforme;
  iInforme : LongInt;
implementation

{$R *.DFM}
Uses USistema, UMensErro, UDatabase, DBaseDados;



procedure TfrmCadInforme.FormCreate(Sender: TObject);
begin
  inherited;
  iInforme:=-1;
  //
  qry.Close;
  qry.ParamByName('IDINFORME').AsInteger:=iInforme;
  qry.Open;
  //
end;

procedure TfrmCadInforme.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  //
  qry.FieldByName('FLGBASE').AsString:='N';
  qry.FieldByName('FLGIRRF').AsString:='N';
  qry.FieldByName('CODDIRF').AsInteger:=1;
  //
  dbckIRRF.Enabled           :=True;
  dbckRendimentoBruto.Enabled:=True;
  //
  dbedNome.SetFocus;
end;

procedure TfrmCadInforme.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if (qry.FieldByName('FLGBASE').AsString = 'S') then begin
     dbckIRRF.Enabled           :=False;
     dbckRendimentoBruto.Enabled:=True;
  end else begin
     if (qry.FieldByName('FLGIRRF').AsString = 'S') then begin
        dbckIRRF.Enabled           :=True;
        dbckRendimentoBruto.Enabled:=False;
     end else begin
        dbckIRRF.Enabled           :=True;
        dbckRendimentoBruto.Enabled:=True;
     end;
  end;
  dbedNome.SetFocus;
end;

procedure TfrmCadInforme.dbckRendimentoBrutoClick(Sender: TObject);
begin
  inherited;
  if qry.State in [dsInsert,dsEdit] then begin
     if dbckRendimentoBruto.Checked then begin
        qry.FieldByName('FLGIRRF').AsString :='N';
        if (qry.FieldByName('CODDIRF').AsInteger <> 2) and
           (qry.FieldByName('CODDIRF').AsInteger <> 5) then
           qry.FieldByName('CODDIRF').AsInteger:=2;
        if qry.FieldByName('FLGNATUREZA').isNull then
           qry.FieldByName('FLGNATUREZA').AsString:='P';
        dbckIRRF.Enabled           :=False;
     end else begin
        qry.FieldByName('CODDIRF').AsInteger:=1;
        dbckIRRF.Enabled           :=True;
     end;
  end;
end;

procedure TfrmCadInforme.dbckIRRFClick(Sender: TObject);
begin
  inherited;
  if qry.State in [dsInsert,dsEdit] then begin
     if dbckIRRF.Checked then begin
        qry.FieldByName('FLGBASE').AsString :='N';
        if (qry.FieldByName('CODDIRF').AsInteger <> 3) and
           (qry.FieldByName('CODDIRF').AsInteger <> 7) then
           qry.FieldByName('CODDIRF').AsInteger:=3;
        if qry.FieldByName('FLGNATUREZA').isNull then
           qry.FieldByName('FLGNATUREZA').AsString:='N';
        dbckRendimentoBruto.Enabled:=False;
     end else begin
        qry.FieldByName('CODDIRF').AsInteger:=1;
        dbckRendimentoBruto.Enabled:=True;
     end;
  end;
end;

procedure TfrmCadInforme.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(dbedNome.Text) = '' then begin
     MsgDlg('Obrigatório preencher o nome da linha para o Informe','Aviso',mtWarning,[mbOK],0);
     dbedNome.SetFocus;
     exit;
  end;
  if trim(dbedCodInforme.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma linha para o Informe','Aviso',mtWarning,[mbOK],0);
     dbedCodInforme.SetFocus;
     exit;
  end;
  if dbckRendimentoBruto.Checked then begin
     if (qry.FieldByName('CODDIRF').AsInteger <> 2) and
        (qry.FieldByName('CODDIRF').AsInteger <> 5) then begin
        MsgDlg('Linha para Dirf tem que ser 2 ou 5','Aviso',mtWarning,[mbOK],0);
        dbrgDirf.SetFocus;
        exit;
     end;
  end;
  if dbckIRRF.Checked then begin
     if (qry.FieldByName('CODDIRF').AsInteger <> 3) and
        (qry.FieldByName('CODDIRF').AsInteger <> 7) then begin
        MsgDlg('Linha para Dirf tem que ser 3 ou 7','Aviso',mtWarning,[mbOK],0);
        dbrgDirf.SetFocus;
        exit;
     end;
  end;
  if qry.FieldByName('IDINFORME').isNull then begin
     qry.FieldByName('IDINFORME').AsInteger := LeUltRegistro(nil,'INFORME');
  end;
  inherited;

end;

procedure TfrmCadInforme.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then begin
      qry.Close;
      qry.ParamByName('IDINFORME').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
      qry.Open;
   end;
end;



end.
