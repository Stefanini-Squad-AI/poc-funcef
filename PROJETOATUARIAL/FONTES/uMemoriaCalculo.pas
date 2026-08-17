{===============================================================================
Unit    :  uMemoriaCalculo
Form    :  frmMemoriaCalculo

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 11/08/2000

Objetivo: Memória de Cálculo.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uMemoriaCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery;

type
  TfrmMemoriaCalculo = class(TfrmOkCancelar)
    ds: TwwDataSource;
    dbGrd: TwwDBGrid;
    qryPrincipal: TwwQuery;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryPrincipalDT_GERACAO: TDateTimeField;
    qryPrincipalDS_HIPOTESE: TStringField;
    qryAux: TwwQuery;
    bbtReCalculo: TBitBtn;
    qryPrincipalCD_HIPOTESE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    { ClaudioR - 09-06-2006 }
    function Localiza_Grupos_Participantes(vDT_GERACAO:TDateTime):TStringList;
    procedure bbtReCalculoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMemoriaCalculo: TfrmMemoriaCalculo;

implementation

uses uGlobal, FTelaAut, uVersaoBase, uProcura, DRelatsAtuarial,
  UCalculoAtuarial;

{$R *.DFM}

procedure TfrmMemoriaCalculo.FormShow(Sender: TObject);
begin
  inherited;
  if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
     exit;
   end
  else
   begin
     qryPrincipal.Close;
     qryPrincipal.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
     qryPrincipal.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
     qryPrincipal.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
     qryPrincipal.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     qryPrincipal.Open;
   end;
end;

procedure TfrmMemoriaCalculo.bbtnConfirmarClick(Sender: TObject);
begin
  if qryPrincipal.isEmpty then
    exit;

  frmProcura := TfrmProcura.create(application);
  frmProcura.DataSet := qryAux;
  frmProcura.Form := 'MemoriaCalculo';
  frmProcura.CD_VERSAO := intToStr(WG_CD_VERSAO);
  frmProcura.DT_GERACAO := DateTimeToStr(qryPrincipal.FieldByName('DT_GERACAO').asDateTime);

  frmProcura.ShowModal;

  frmProcura.free;
  inherited;
end;

procedure TfrmMemoriaCalculo.bbtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMemoriaCalculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPrincipal.Close;
  inherited;
end;

function TfrmMemoriaCalculo.Localiza_Grupos_Participantes(vDT_GERACAO:TDateTime):TStringList;
Var qry:TwwQuery;
    lstGrupo:TStringList;
begin
   qry := TwwQuery.Create(nil);
   lstGrupo := TStringList.Create;

   qry.Close;
   qry.DatabaseName := 'BaseDados';
   qry.SQL.Clear;
   qry.sql.Add('select distinct DT_GERACAO, CD_GRUPO_PARTIC');
   qry.sql.Add('from   FI_OCOR_CALCULO_ATUARIAL');
   qry.sql.Add('where  DT_GERACAO = :DT_GERACAO');
   qry.sql.Add('order by DT_GERACAO desc  ');
   qry.ParamByName('DT_GERACAO').AsDateTime := vDT_GERACAO;
   qry.Open;

   lstGrupo.Clear;
   while not qry.Eof do
   Begin
      lstGrupo.Add(qry.FieldByname('CD_GRUPO_PARTIC').AsString);

      qry.next;
   End;

   Result := lstGrupo;
   FreeAndNil(qry);
end;

procedure TfrmMemoriaCalculo.bbtReCalculoClick(Sender: TObject);
Var N, vCheck:Integer;
    lstGrupo:TStringList;
begin
   inherited;

   AbrirForm(frmCalculoAtuarial,TfrmCalculoAtuarial,False);

   With frmCalculoAtuarial do
   Begin
      Caption := 'Cálculo Atuarial - (Recálculo)';

      DBLkpCmbBxHipotese.KeyValue := qryPrincipal.FieldByName('CD_HIPOTESE').AsInteger;

      DBLkpCmbBxHipotese.Enabled    := False;
      RadioGroupTipoCalculo.Enabled := False;

      bbtnConfirmar.Enabled := True;

      lstGrupo := TStringList.Create;
      lstGrupo := Localiza_Grupos_Participantes(qryPrincipal.FieldByName('DT_GERACAO').AsDateTime);

      For N:=0 to ChckLstBxGrupoPart.Items.Count-1 do
         ChckLstBxGrupoPart.Checked[N] := False;

      For N:=0 to lstGrupo.Count -1 do
      Begin
         vCheck := PegaGrupo(StrToInt(lstGrupo[N]));
         ChckLstBxGrupoPart.Checked[vCheck] := True;
      end;
   End;

   Close;
end;

end.
