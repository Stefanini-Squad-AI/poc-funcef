unit FParamSalEstMin;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

Type
  TFrmParamSalEstMin = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    qryAlmox: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamSalEstMin: TFrmParamSalEstMin;

implementation

uses DRptRelats, uMensErro,uSistema;

{$R *.DFM}

procedure TFrmParamSalEstMin.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
end;

Procedure TFrmParamSalEstMin.FazQry;
Begin
    DtmRptRelats.lbGrupo2.Caption  := 'Todos';
    DtmRptRelats.lbAlmox12.Caption := dblcAlmox.Text;
    With DtmRptRelats.qrySalEstMin Do
      Begin
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                   ');
          Sql.add('     S.CODARTIGO,                                                         ');
          Sql.add('     (P.DESCPROD || '' '' || A.CODCOR || '' '' ||  A.CODTAMANHO) AS DESCRICAO,');
          Sql.add('     S.SALDOQTDE,                                                         ');
          Sql.add('     P.CODMEDCUSTO,                                                       ');
          Sql.add('     DECODE(S.ESTMAXIMO,NULL,0,S.ESTMAXIMO)AS ESTMAXIMO                   ');
          Sql.add(' FROM                                                                     ');
          Sql.add('    SALDO S,                                                              ');
          Sql.add('    PRODUTO P,                                                            ');
          Sql.add('    ARTIGO A                                                              ');
          Sql.add(' WHERE                                                                    ');
          Sql.add('      (S.CODALMOXARIFADO = '+dblcAlmox.LookupValue+')                     ');
      If Trim(dblcGrpProd.Text) <> '' Then
         Begin
           Sql.add('  AND (RTRIM(P.CODGRUPOPROD) = '''+Trim(dblcGrpProd.LookupValue) +''')   ');
           DtmRptRelats.lbGrupo2.Caption := dblcGrpProd.Text;
         End;
          Sql.add('  AND (S.SALDOQTDE > S.ESTMAXIMO)                                         ');
          Sql.add('  AND (S.CODARTIGO = A.CODARTIGO )                                        ');
          Sql.add('  AND (A.CODPRODUTO = P.CODPRODUTO)                                       ');
       Case RgOrdem.ItemIndex Of
          0: Sql.add(' ORDER BY DESCRICAO   ');
          1: Sql.add(' ORDER BY S.CODARTIGO ');
          2: Sql.add(' ORDER BY S.SALDOQTDE ');
       End;
       Open;
      End;
End;

procedure TFrmParamSalEstMin.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcAlmox.Text) = '' Then
    Begin
      MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOK],0);
      dblcAlmox.SetFocus;
      ModalResult := mrNone;
    End
  Else
    Begin
        ModalResult := mrOk;
        FazQry;
    End;


end;

end.
