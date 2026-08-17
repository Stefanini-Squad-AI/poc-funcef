// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Alteracoes  : (.dfm) qry
//Pendência   : SIG 78760
//Responsável : Edilaine
//Data        : 04/02/2019
//Descrição   : adequação da funcionalidade para calculo da glosa e ordenação relatório
//              - aumentar campo email
//------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 10/02/2012
//Descrição   : Novo merge com código da versão de produção da fábrica
//--------------------------------------------------------------------------------
//Pendência   : SOL 146677 Kintana 1233515
//Responsável : MARCIO DENILSON
//Data        : 28/10/2011
//Descrição   : Configuração da UF para Prestação de Contas do INSS (email e texto para email)
//Rotinas     : .dfm, bbtnConfirmar, bbtnCancelar, sbtnAlterar, sbtnInserir
//--------------------------------------------------------------------------------

unit FCadUFINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBCtrls, Mask, UDataBase, wwdbedit;

type
  TfrmCadUFINSS = class(TFrmCadastroGridCS)
    qryEstado: TQuery;
    dbcmbEstado: TDBLookupComboBox;
    dsEstado: TDataSource;          
    Label1: TLabel;
    Label2: TLabel;
    dbcmbEstadoCentral: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edtSinonimo: TwwDBEdit;
    edtCodOrgao: TwwDBEdit;
    edtEmail: TwwDBEdit;
    Label5: TLabel;
    dbmemTextoEmail: TDBMemo;
    Label6: TLabel;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUFINSS: TfrmCadUFINSS;

implementation

{$R *.DFM}

uses UmensErro;

procedure TfrmCadUFINSS.FormCreate(Sender: TObject);
begin
  inherited;
  qryEstado.Open;
end;

procedure TfrmCadUFINSS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadUFINSS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Críticas.
  AplicaAlteracoes([qry]);

  // atualiza a grid.
  qry.Close;
  qry.Open;
end;

procedure TfrmCadUFINSS.CmeCadastroFind(Sender: TObject);
var
  varFields : variant;
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    varFields := VarArrayCreate([0,2],varVariant);
    varFields[0] := MontaSelect.ValoresChave[0];
    varFields[1] := MontaSelect.ValoresChave[1];
    varFields[2] := MontaSelect.ValoresChave[2];

    qry.Locate('SIGLA;CODORGAOLOCAL;SINONIMO',varFields,[loCaseInsensitive])
  End;
end;



procedure TfrmCadUFINSS.bbtnConfirmarClick(Sender: TObject);
begin
  if edtEmail.Text = '' then
   begin
    MsgDlg('É obrigatório informar o e-mail.','Informação', mtInformation, [mbOk], 0);
    Exit;
   end;

  inherited;

  edtCodOrgao.ReadOnly      := True;
  edtSinonimo.ReadOnly      := True;
  edtEmail.ReadOnly         := True;
  dbmemTextoEmail.ReadOnly  := True;

end;

procedure TfrmCadUFINSS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtCodOrgao.ReadOnly      := True;
  edtSinonimo.ReadOnly      := True;
  edtEmail.ReadOnly         := True;
  dbmemTextoEmail.ReadOnly  := True;
end;

procedure TfrmCadUFINSS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  edtCodOrgao.ReadOnly := False;
  edtSinonimo.ReadOnly := False;
  edtEmail.ReadOnly    := False;
  dbmemTextoEmail.ReadOnly  := False;
end;

procedure TfrmCadUFINSS.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  edtCodOrgao.ReadOnly := False;
  edtSinonimo.ReadOnly := False;
  edtEmail.ReadOnly    := False;
  dbmemTextoEmail.ReadOnly  := False;
end;

procedure TfrmCadUFINSS.qryAfterPost(DataSet: TDataSet);
var
    Texto: string;
  Stream: TStringStream;
begin
  inherited;

  //MIGRACAO-ORACLE - LEANDRO - INICIO
  qry.ApplyUpdates();

  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' update UFINSS   ' +
            ' set ' +
            ' TEXTOEMAIL = :TEXTOEMAIL' + //quotedstr(qry.fieldbyname('TEXTOEMAIL').asstring) +
            ' where ' +
            ' SIGLA = ' + quotedstr(qry.fieldbyname('sigla').asstring) +
            ' AND CODORGAOLOCAL = ' + quotedstr(qry.fieldbyname('CODORGAOLOCAL').asstring));

      Texto := dbmemTextoEmail.Lines.Text;
      Stream := TStringStream.Create(Texto);
    try
      ParamByName('TEXTOEMAIL').LoadFromStream(Stream, ftBlob);
    finally
      Stream.Free;
    end;
    try
      ExecSQL;
    except
    on e: Exception do
     begin
        ShowMessage(e.Message);
     end;
    end;
  end;
  //MIGRACAO-ORACLE - LEANDRO - FIM

end;

end.
