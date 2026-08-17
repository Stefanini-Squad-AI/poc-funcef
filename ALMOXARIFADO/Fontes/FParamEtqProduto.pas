unit FParamEtqProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook;

type
  TFrmParamEtqProduto = class(TfrmOkCancelar)
    qryArtigo: TwwQuery;
    qryGrpProd: TwwQuery;
    Label4: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    qryAlmox: TwwQuery;
    Label1: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamEtqProduto: TFrmParamEtqProduto;

implementation

{$R *.DFM}

{ TFrmParamEtqProduto }

uses DRptRelats, uString, uMensErro, uSistema;

procedure TFrmParamEtqProduto.FazRel;
begin
With DtmRptRelats.qryEtqProduto DO
     Begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT             ');
        Sql.Add('   A.CODARTIGO,     ');
        Sql.Add('   P.CODGRUPOPROD,  ');
        Sql.Add('   P.CODMEDCUSTO,   ');
        Sql.Add('   G.DESCGRUPOPROD, ');
        Sql.Add('   S.ESTMAXIMO,     ');
        Sql.Add('   S.ESTMINUSADO,   ');
        Sql.Add('   (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO ');
        Sql.Add(' FROM              ');
        Sql.Add('   SALDO S,        ');
        Sql.Add('   PRODUTO P,      ');
        Sql.Add('   ARTIGO A,       ');
        Sql.Add('   GRUPPROD G      ');
        Sql.Add('WHERE              ');
        Sql.Add('    (S.CODALMOXARIFADO = '+dblcAlmox.LookupValue+') ');
        If Trim(dblcItem.Text) <> '' Then
           Sql.Add('   AND (A.CODARTIGO = '+QuotedStr(Espaco(Trim(dblcItem.LookupValue),14))+') ')
        Else
        If Trim(dblcGrpProd.Text) <> '' Then
           Sql.Add('   AND (P.CODGRUPOPROD = '+QuotedStr(Espaco(Trim(dblcGrpProd.LookupValue),10))+')');

        Sql.Add('   AND (A.CODARTIGO =  S.CODARTIGO)       ');
        Sql.Add('   AND (P.CODPRODUTO =  A.CODPRODUTO)     ');
        Sql.Add('   AND (P.CODGRUPOPROD =  G.CODGRUPOPROD) ');
        Case RgOrdem.ItemIndex of
           0 : Sql.Add('ORDER BY DESCRICAO ');
           1 : Sql.Add('ORDER BY A.CODARTIGO ');
        End;
        Open;
     End;
end;

procedure TFrmParamEtqProduto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  inherited;
  If Trim(dblcAlmox.Text) = '' Then
     Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := mrNone;
     End
  Else
     Begin
        ModalResult := mrOk;
        FazRel;
     End;
end;

procedure TFrmParamEtqProduto.FormCreate(Sender: TObject);
begin
  inherited;
  qryArtigo.Open;
  qryGrpProd.Open;
  qryAlmox.Close;
  qryAlmox.Params[0].asInteger := Sistema.IdEmpresa;
  qryAlmox.Open;
  
end;

end.
