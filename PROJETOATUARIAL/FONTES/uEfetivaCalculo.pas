{===============================================================================
Unit    :  uEfetivaCalculo
Form    :  frmEfetivaCalculo

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 17/08/2000

Objetivo: Efetiva Cálculo.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uEfetivaCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, DBCtrls;

type
  TfrmEfetivaCalculo = class(TfrmSairAjuda)
    dbGrd: TwwDBGrid;
    qryPrincipal: TwwQuery;
    qryPrincipalDT_GERACAO: TDateTimeField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryPrincipalDS_HIPOTESE: TStringField;
    ds: TwwDataSource;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnEfetivar: TBitBtn;
    bbtnExcluir: TBitBtn;
    RdGrpSituacao: TRadioGroup;
    qryEfetivaCalculo: TwwQuery;
    qryCalculo: TwwQuery;
    qryPrincipalCD_HIPOTESE: TFloatField;
    qryPrincipalDT_REFER_CALCULO: TDateTimeField;
    qryPrincipalIR_CALCULO_EFETIVADO: TStringField;
    qryPrincipalCD_VERSAO: TFloatField;
    qryOcorCalculo: TwwQuery;
    qryOpcaoCalculo: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure RdGrpSituacaoClick(Sender: TObject);
    procedure bbtnEfetivarClick(Sender: TObject);
    procedure bbtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEfetivaCalculo: TfrmEfetivaCalculo;

implementation

uses uGlobal, FTelaAut, uVersaoBase, dBaseDados;

{$R *.DFM}

procedure TfrmEfetivaCalculo.FormShow(Sender: TObject);
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

procedure TfrmEfetivaCalculo.RdGrpSituacaoClick(Sender: TObject);
var
  aux: String;
begin
  if RdGrpSituacao.ItemIndex = 0 then
   begin
     with qryPrincipal do
      begin
        bbtnEfetivar.Enabled := false;
        bbtnExcluir.Enabled := false;
        Close;
        SQL[7] := '';
        SQL[7] := 'and a.IR_CALCULO_EFETIVADO = '+#39+ 'S' +#39;
        aux := qryPrincipal.SQL.text;
        Open;
      end;
   end
  else
   begin
     with qryPrincipal do
      begin
        bbtnEfetivar.Enabled := true;
        bbtnExcluir.Enabled := true;
        Close;
        SQL[7] := '';
        SQL[7] := 'and a.IR_CALCULO_EFETIVADO = '+#39+ 'N' + #39;
        aux := qryPrincipal.SQL.text;
        Open;
      end;
   end;
end;

procedure TfrmEfetivaCalculo.bbtnEfetivarClick(Sender: TObject);
begin
  qryEfetivaCalculo.ExecSQL;

  qryPrincipal.Close;
  qryPrincipal.Open;
end;

procedure TfrmEfetivaCalculo.bbtnExcluirClick(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente apagar este registro ?','Cálculo Atuarial',4) <> IdYes Then
    exit;

  qryCalculo.ParamByName('DT_GERACAO').asDateTime := qryPrincipalDT_GERACAO.asDateTime;
  qryCalculo.ParamByName('CD_PESSOA_ENTID').asInteger := qryPrincipalCD_PESSOA_ENTID.asInteger;
  qryCalculo.ParamByName('CD_PESSOA_PATROC').asInteger := qryPrincipalCD_PESSOA_PATROC.asInteger;
  qryCalculo.ParamByName('CD_PLANO').asInteger := qryPrincipalCD_PLANO.asInteger;
  qryCalculo.ParamByName('CD_VERSAO').asInteger := qryPrincipalCD_VERSAO.asInteger;
  qryCalculo.ExecSQL;

  qryOcorCalculo.ExecSQL;

  qryOpcaoCalculo.ExecSQL;

  qryPrincipal.Close;
  qryPrincipal.Open;
end;

end.
