unit FParamPlanProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TFrmParamPlanProd = class(TfrmOkCancelar)
    pln: TPanel;
    qryGrpProd: TwwQuery;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOedem: TRadioGroup;
    qryAlmox: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    chkEstoque: TCheckBox;
    chkSaldoZero: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamPlanProd: TFrmParamPlanProd;

implementation

{$R *.DFM}
Uses DRptRelats, uMEnsErro, uModulo, uSistema;
procedure TFrmParamPlanProd.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
end;

procedure  TFrmParamPlanProd.FazQry;
Begin
   With DtmRptRelats.qryPlanProd Do
       Begin
           Close;
           Sql.Text := ' SELECT '+
                       '     G.CODGRUPOPROD,  '+
                       '     G.DESCGRUPOPROD, '+
                       '     A.CODARTIGO,     '+
                       '     P.CODMEDCUSTO,   '+
                       '     (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, '+
                       '     S.LOCALIZACAO '+
                       '  FROM '+
                       '    ARTIGO A,  '+
                       '    PRODUTO P, '+
                       '    GRUPPROD G, '+
                       '    SALDO S '+
                       ' WHERE '+
                       '        (S.CODALMOXARIFADO = '+dblcAlmox.lookUpValue+' ) '+
                       '    AND (A.FLGATIVO = ''S'' ) ';
            If chkEstoque.Checked Then
                      Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');
            If Trim(dblcGrpProd.Text) <> ''   Then
               Begin
                  sql.Add(' AND (RTRIM(G.CODGRUPOPROD) LIKE '''+Trim(dblcGrpProd.LookUpValue)+''' || ''%'' ) ');
                  DtmRptRelats.lbFiltro2.Caption := dblcGrpProd.LookupValue + ' - '+dblcGrpProd.Text;
               End;
            if chkSaldoZero.Checked Then
               Sql.Add('  AND (S.SALDOQTDE <> 0 )');

               Sql.Add(' AND ( A.CODPRODUTO  = P.CODPRODUTO) '+
                       ' AND (P.CODGRUPOPROD = G.CODGRUPOPROD)'+
                       ' AND ( A.CODARTIGO = S.CODARTIGO) ');
               Case RgOedem.ItemIndex Of
                   0 : Sql.Add(' ORDER BY G.CODGRUPOPROD,(P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO )');
                   1 : Sql.Add(' ORDER BY G.CODGRUPOPROD,A.CODARTIGO ');
                   2 : Sql.Add(' ORDER BY G.CODGRUPOPROD,S.LOCALIZACAO ');
               End;
           Open;
       End;
       DtmRptRelats.lbAlmox9.Caption := dblcAlmox.Text;
End;

procedure TFrmParamPlanProd.bbtnConfirmarClick(Sender: TObject);
begin
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := MrNone;
    End
  Else
    Begin
       ModalResult := MrOK;
       FazQry;
    End;
  inherited;
end;

end.
