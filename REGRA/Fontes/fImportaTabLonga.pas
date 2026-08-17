unit fImportaTabLonga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, wwdblook, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, Mask, wwdbedit, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc,
  Wwquery, Excels, uSistema;

type
  TfrmImportaTabLonga = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label5: TLabel;
    GrpLinha: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    dbgrdDet: TwwDBGrid;
    pnlControlesDet: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dedCodCampoCampos: TDBEdit;
    dedDescricaoCampos: TDBEdit;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TSpeedButton;
    sbtnAltDet: TSpeedButton;
    sbtnExcluiDet: TSpeedButton;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QryTabela: TwwQuery;
    DsTabela: TwwDataSource;
    updTabela: TUpdateSQL;
    updCampos: TUpdateSQL;
    DsCampos: TwwDataSource;
    QryCampos: TwwQuery;
    QryValor: TwwQuery;
    dsValor: TwwDataSource;
    updValor: TUpdateSQL;
    dlg1: TOpenDialog;
    edtNome: TEdit;
    QryTabelaIDTABELA: TFloatField;
    QryTabelaDESCRICAO: TStringField;
    QryCamposIDTABELA: TFloatField;
    QryCamposIDCAMPO: TFloatField;
    QryCamposDESCRICAO: TStringField;
    QryValorIDTABELA: TFloatField;
    QryValorNUMLINHA: TFloatField;
    QryValorC1: TStringField;
    QryValorC2: TStringField;
    QryValorC3: TStringField;
    QryValorC4: TStringField;
    QryValorC5: TStringField;
    QryValorC6: TStringField;
    QryValorC7: TStringField;
    QryValorC8: TStringField;
    QryValorC9: TStringField;
    QryValorC10: TStringField;
    QryValorC11: TStringField;
    QryValorC12: TStringField;
    QryValorC13: TStringField;
    QryValorC14: TStringField;
    QryValorC15: TStringField;
    QryValorC16: TStringField;
    QryValorC17: TStringField;
    QryValorC18: TStringField;
    QryValorC19: TStringField;
    QryValorC20: TStringField;
    QryValorC21: TStringField;
    QryValorC22: TStringField;
    QryValorC23: TStringField;
    QryValorC24: TStringField;
    QryValorC25: TStringField;
    QryValorC26: TStringField;
    QryValorC27: TStringField;
    QryValorC28: TStringField;
    QryValorC29: TStringField;
    QryValorC30: TStringField;
    QryValorC31: TStringField;
    QryValorC32: TStringField;
    QryValorC33: TStringField;
    QryValorC34: TStringField;
    QryValorC35: TStringField;
    QryValorC36: TStringField;
    QryValorC37: TStringField;
    QryValorC38: TStringField;
    QryValorC39: TStringField;
    QryValorC40: TStringField;
    QryValorC41: TStringField;
    QryValorC42: TStringField;
    QryValorC43: TStringField;
    QryValorC44: TStringField;
    QryValorC45: TStringField;
    QryValorC46: TStringField;
    QryValorC47: TStringField;
    QryValorC48: TStringField;
    QryValorC49: TStringField;
    QryValorC50: TStringField;
    QryValorC51: TStringField;
    QryValorC52: TStringField;
    QryValorC53: TStringField;
    QryValorC54: TStringField;
    QryValorC55: TStringField;
    QryValorC56: TStringField;
    QryValorC57: TStringField;
    QryValorC58: TStringField;
    QryValorC59: TStringField;
    QryValorC60: TStringField;
    QryValorC61: TStringField;
    QryValorC62: TStringField;
    QryValorC63: TStringField;
    QryValorC64: TStringField;
    QryValorC65: TStringField;
    QryValorC66: TStringField;
    QryValorC67: TStringField;
    QryValorC68: TStringField;
    QryValorC69: TStringField;
    QryValorC70: TStringField;
    QryValorC71: TStringField;
    QryValorC72: TStringField;
    QryValorC73: TStringField;
    QryValorC74: TStringField;
    QryValorC75: TStringField;
    QryValorC76: TStringField;
    QryValorC77: TStringField;
    QryValorC78: TStringField;
    QryValorC79: TStringField;
    QryValorC80: TStringField;
    QryValorC81: TStringField;
    QryValorC82: TStringField;
    QryValorC83: TStringField;
    QryValorC84: TStringField;
    QryValorC85: TStringField;
    QryValorC86: TStringField;
    QryValorC87: TStringField;
    QryValorC88: TStringField;
    QryValorC89: TStringField;
    QryValorC90: TStringField;
    QryValorC91: TStringField;
    QryValorC92: TStringField;
    QryValorC93: TStringField;
    QryValorC94: TStringField;
    QryValorC95: TStringField;
    QryValorC96: TStringField;
    QryValorC97: TStringField;
    QryValorC98: TStringField;
    QryValorC99: TStringField;
    QryValorC100: TStringField;
    btnCriar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    Procedure HabGrid;
    Procedure DesabGrid;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    function formata(texto:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaTabLonga: TfrmImportaTabLonga;
  excel   : texcel;
  area    : trect;
  cont    : integer;
  texto   : String;
  linhas  : tstrings;
  conteudo,conteudo2 : TStringList;

implementation

uses Udatabase, dBaseDados, uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmImportaTabLonga.FormCreate(Sender: TObject);
begin
  inherited;
  QryTabela.Close;
  QryCampos.Close;
  QryValor.Close;

  QryTabela.Open;
  QryCampos.Open;
  QryValor.Open;
end;

Procedure TfrmImportaTabLonga.btnCriarClick(Sender: TObject);

Begin

  Inherited;
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled := True;

  btnCriar.Enabled := False;
  edtNome.Enabled := False;

  QryTabela.Close;
  QryTabela.ParambyName('DESCR').AsString := edtNome.Text;
  QryTabela.Open;

  If not DtmBaseDados.dbBasedados.InTransaction  then
     DtmBaseDados.dbBasedados.StartTransaction;

  If QryTabela.IsEmpty then begin
     QryTabela.Append;
     QryTabela.FieldbyName('IDTABELA').AsInteger := LeUltRegistro(nil, 'LONGTABGENER');
     QryTabela.FieldbyName('DESCRICAO').AsString := edtNome.text;
     QryTabela.Post;
  end;

  QryCampos.Close;
  QryCampos.ParambyName('ID').AsInteger := QryTabela.FieldbyName('IDTABELA').AsInteger;
  QryCampos.Open;

  QryValor.Close;
  QryValor.ParambyName('ID').AsInteger := QryTabela.FieldbyName('IDTABELA').AsInteger;
  QryValor.Open;

End;

Procedure TfrmImportaTabLonga.HabGrid;
begin
     dbgrdDet.BringtoFront;
     Dock972.Visible := False;
end;

Procedure TfrmImportaTabLonga.DesabGrid;
begin
     dbgrdDet.SendtoBack;
     Dock972.Visible := True;
end;


procedure TfrmImportaTabLonga.sbtnInsDetClick(Sender: TObject);
var
   Lin : LongInt;
begin
  inherited;
  DesabGrid;
  QryCampos.Last;
  Lin := QryCampos.FieldbyName('IDCAMPO').AsInteger + 1;
  QryCampos.Insert;
  QryCampos.FieldbyName('IDTABELA').AsInteger := QryTabela.Fieldbyname('IDTABELA').AsInteger;
  QryCampos.FieldbyName('IDCAMPO').AsInteger := Lin;
  sbtnInsDet.Down := False;
  dedDescricaoCampos.SetFocus;
end;

procedure TfrmImportaTabLonga.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  DesabGrid;
  QryCampos.Edit;
  sbtnAltDet.Down := False;
end;

procedure TfrmImportaTabLonga.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  QryCampos.Delete;
  sbtnExcluiDet.Down := False;
end;

procedure TfrmImportaTabLonga.BitBtn1Click(Sender: TObject);
begin
  inherited;
  QryCampos.Post;
  HabGrid;
end;

procedure TfrmImportaTabLonga.BitBtn2Click(Sender: TObject);
begin
  inherited;
  QryCampos.Cancel;
  HabGrid;
end;

procedure TfrmImportaTabLonga.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if DtmBasedados.dbbasedados.InTransaction then
     DtmBasedados.dbbasedados.Rollback;
     
  edtNome.text := '';
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';

  QryTabela.Close;
  QryCampos.Close;
  QryValor.Close;
  
  btnCriar.Enabled := True;
  edtNome.Enabled := True;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
end;

procedure TfrmImportaTabLonga.bbtnConfirmarClick(Sender: TObject);
var
   a : String;
   Tam, c, Ini, x, NumLinhas, Grava : LongInt;
   Vazio : Boolean;
begin
  inherited;
  Tam := 0;
     if (edtNome.Text = '') or (Edit1.Text = '') or (Edit2.Text = '') or
        (Edit3.Text = '') or (Edit4.Text = '') then begin
        MsgDlg('Existem Campos em Branco.','Atenção',mterror,[mbOk,mbHelp],0);
        Exit;
     end;
     Dlg1.Execute;
     if Dlg1.FileName <> '' then begin
        frmAguarde.Mostra('Abrindo Planilha ...');
        frmAguarde.Refresh;
        excel:=texcel.create(self);
        excel.Connect;
        Area.Top    := StrtoInt(Edit1.Text);
        Area.Bottom := StrtoInt(Edit2.Text);
        Area.Left   := StrtoInt(Edit3.Text);
        Area.Right  := StrtoInt(Edit4.Text);
        excel.Exec('[OPEN("'+dlg1.FileName+'")]');
        try
           conteudo := TStringList.Create;
           Excel.GetRange(area, conteudo); { Alimenta "Conteudo" }
        except
              MsgDlg('Problemas na Abertura da Planilha.','Atenção',mterror,[mbOk,mbHelp],0);
              frmAguarde.Apaga;
              Screen.Cursor := crDefault;
              Exit;
        end;

        frmAguarde.Mostra('Verificando Dados ...');
        frmAguarde.Refresh;

        QryCampos.DisableControls;

        Conteudo2 := tStringList.Create;
        NumLinhas := Conteudo.Count;
        For  X := 0 to  NumLinhas-1 Do
             Conteudo2.Add('');

        //Formatando Texto
        X    :=0;
        Cont :=1;
        Texto:='';
        While X <= NumLinhas - 1 Do Begin
              A := Copy(Conteudo.Strings[X],Cont,1);
              if A=#9 then begin
                 Conteudo2.Strings[X]:=Conteudo2.Strings[X]+Formata(Texto);
                 Texto:='';
              end else
                  if Cont>Length(Conteudo.Strings[X]) then begin
                     Conteudo2.Strings[x]:=Conteudo2.Strings[X]+Formata(Texto);
                     Texto := '';
                     inc(x);
                     Cont :=0
                  end else begin
                      Texto := Texto + A;
                  end;
              inc(Cont);
        End;

        frmAguarde.Mostra('Importando Planilha ...');
        frmAguarde.Refresh;

        frmAguarde.Max := NumLinhas;
        frmAguarde.Min := 0;
        frmAguarde.Pos := 0;

        QryTabela.ApplyUpdates;
        Qrycampos.ApplyUpdates;

        if QryValor.IsEmpty then begin
           x := 0;
           Vazio := True;
        end else begin
             QryValor.Last;
             x := QryValor.FieldbyName('NUMLINHA').AsInteger;
             Tam := x;
             NumLinhas := NumLinhas + x;
             frmAguarde.Max := NumLinhas;
             Vazio := False;
        end;

        Grava := 0;
        While x <= NumLinhas - 1 Do Begin
              QryCampos.First;
              Ini := 1;
              QryValor.Insert;
              QryValor.FieldByName('IDTABELA').AsString := QryTabela.FieldByName('IDTABELA').AsString;
              QryValor.FieldByName('NUMLINHA').AsInteger:= X + 1;
              C :=1;
              While not Qrycampos.Eof Do Begin
                    if Vazio then
                       QryValor.FieldByName('C'+IntToStr(C)).AsString:=Trim(Copy(Conteudo2.Strings[X],Ini,60))
                    else
                       QryValor.FieldByName('C'+IntToStr(C)).AsString:=Trim(Copy(Conteudo2.Strings[X-Tam],Ini,60));
                    Inc(C);
                    Qrycampos.Next;
                    Ini := Ini + 60;
              End;
              QryValor.Post;
              Inc(x);
              frmAguarde.Pos := x;
              Inc(Grava);
              if Grava=1000 then begin
                 Grava:=0;
                 QryValor.ApplyUpdates;
                 QryValor.CommitUpdates;
              end;
        end;
         Conteudo.Free;
     end;
     cont:=0;
     texto:='';
     QryCampos.EnableControls;
     frmAguarde.Mostra('Finalizando Gravação ...');
     frmAguarde.Refresh;
     QryValor.ApplyUpdates;
     { Grava Log da operação - 19/12/2002 }
     If Not Sistema.GravaLogOperacoes('Importação de Tabelas Longas') Then
        Raise Exception.Create('Não Consegui Gravar o Log');

     if DtmBasedados.DbBaseDados.InTransaction then begin
        DtmBasedados.dbbasedados.Commit;
        bbtnCancelar.Click;
     end else begin
          MsgDlg('A importação falhou, porque não houve abertura de transação.','Atenção',mterror,[mbOk,mbHelp],0);
          DtmBasedados.dbbasedados.RollBack;
     end;
     QryCampos.DisableControls;
     frmAguarde.Apaga;
     MsgDlg('A importação terminou.','Atenção',mtInformation,[mbOk],0);
end;

function TfrmImportaTabLonga.formata(texto:string):string;
const
  br=' ';
var
   i,letras:integer;
begin
  letras:=60-length(texto);
  result:=texto;
  for i:=1 to letras do
    result:=result+br;
end;


end.



