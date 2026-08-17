unit FParamExtMovUC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker ;

type
  TFrmParamExtMovUC = class(TfrmOkCancelar)
    qryItem: TwwQuery;
    qryGrpProd: TwwQuery;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    Label4: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    qryUnCusteio: TwwQuery;
    dblcUnCusteio: TwwDBLookupCombo;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edDataIExit(Sender: TObject);
    procedure EdDataFExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazerQry;
  public
    { Public declarations }
  end;

var
  FrmParamExtMovUC: TFrmParamExtMovUC;

implementation

{$R *.DFM}
uses DRptRelats,uSistema, uMensErro,uString;

Procedure TFrmParamExtMovUC.FazerQry;
Begin
  With DtmRptRelats.QryExtMovUC DO
     Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                  ');
         Sql.Add('         M.CodArtigo,    ');
         Sql.Add('         M.DataMov,      ');
         Sql.Add('         M.QtdeMov,      ');
         Sql.Add('         M.ValorMov,     ');
         Sql.Add('         M.DataLancMov,  ');
         Sql.Add('         M.CustoMedioMov,');
         Sql.Add('         M.SaldoQtdeMov, ');
         Sql.Add('         M.NumDocumento, ');
         Sql.Add('         M.CodTipoMov,   ');
         Sql.Add('         M.idMov,        ');
         Sql.Add('         U.DESCMEDIDA,   ');
         Sql.Add('         P.DescProd,     ');
         Sql.Add('         (Decode (Sign(M.QtdeMov), 1,M.QtdeMov) ) as Entrada,                ');
         Sql.Add('         (Decode (Sign(M.QtdeMov), -1,Abs(M.QtdeMov)) ) as Saida,            ');
         Sql.Add('         (Decode (Sign(M.ValorMov), 1,M.ValorMov) ) as V_Entrada,            ');
         Sql.Add('         (Decode (Sign(M.ValorMov), -1,Abs(M.ValorMov)) ) as V_Saida,        ');
         Sql.Add('         (M.SaldoQtdeMov * M.CustoMedioMov) as Valor,                        ');
         Sql.Add('         (M.SaldoQtdeMov + (M.QtdeMov*-1)) as SaldoAnt,                      ');
         Sql.Add('         ((M.SaldoQtdeMov * M.CustoMedioMov)+(M.ValorMov*-1)) as ValorAnt,   ');
         Sql.Add('         T.DescResumida as Historico,                                        ');
         Sql.Add('         M.CODALMOXARIFADO as ALMOXORIG,                                     ');
         Sql.Add('         M.CODALMOXTRANSF  as ALMOXDEST                                      ');
         Sql.Add(' FROM                    ');
         Sql.Add('      Moviment M,        ');
         Sql.Add('      Produto  p,        ');
         Sql.Add('      UNMEDIDA U,        ');
         Sql.Add('      TipoMov T,         ');
         Sql.Add('      Almox A,           ');
         Sql.Add('      CentCust  C        ');
         Sql.Add(' WHERE                   ');
         Sql.Add('       (M.CODALMOXARIFADO IN (SELECT CODALMOXARIFADO FROM ALMOX WHERE (CODCUSTEIO =  '+dblcUnCusteio.LookupValue+' ))) ');
         Sql.Add('   And (M.IdPessoa        = ' + IntToStr(Sistema.IdEmpresa) + ')             ');
         Sql.Add('   And (M.DataMov        >= To_Date('''+EdDataI.Text+''',''dd/mm/yyyy''))    ');
         Sql.Add('   And (M.DataMov        <= To_Date('''+EdDataF.Text+''',''dd/mm/yyyy''))    ');
        If Trim(dblcITem.Text) <> '' Then
            Sql.Add(' And (M.CodArtigo = '''+ Espaco(Trim(dblcItem.LookUpValue),14)+ ''') ')
        Else
        If Trim(dblcGrpProd.Text) <> '' Then
            Sql.Add(' And (P.CodGrupoProd = '''+Espaco(Trim(dblcGrpProd.LookUpValue),10)+''') ');

         Sql.Add('   And (SUBSTR(M.CodArtigo,1,6) = P.CodProduto) ');
         Sql.Add('   And (M.CodTipoMov = T.CodTipoMov)                          ');
         Sql.Add('   And (U.CODMEDIDA = P.CODMEDCUSTO)                          ');
         Sql.Add('   And (M.CODALMOXTRANSF = A.CodAlmoxarifado(+))              ');
         Sql.Add('   And (M.CodCentroCusto = C.CodCentroCusto(+) )              ');
         Sql.Add('   And (M.IdPessoa = C.IdEmpresa(+) )                         ');
         Sql.Add(' ORDER BY M.CodArtigo, M.DataMov,M.IdMov                      ');
       Open;
     End;
     DtmRptRelats.lbUnCusteio.Caption := dblcUnCusteio.Text;
     DtmRptRelats.lbPer12.Caption     := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
End;


procedure TFrmParamExtMovUC.FormCreate(Sender: TObject);
begin
  inherited;
  qryItem.Open;
  qryGrpProd.Open;
  qryUnCusteio.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

procedure TFrmParamExtMovUC.edDataIExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataF.Text) <> '' Then
    Begin
        IF StrToDate(EdDataI.Text) > StrToDate(EdDataF.Text) Then
          Begin
              MsgDlg('A data inicial não pode ser maior que a data final','Erro',mtError,[mbOk],0);
              EdDataI.SetFocus;
          End;
    End;
end;

procedure TFrmParamExtMovUC.EdDataFExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) <> '' Then
    Begin
        IF StrToDate(EdDataF.Text) < StrToDate(EdDataI.Text) Then
          Begin
              MsgDlg('A data final não pode ser menor que a data inicial','Erro',mtError,[mbOk],0);
              EdDataF.SetFocus;
          End;
    End;
end;

procedure TFrmParamExtMovUC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcUnCusteio.Text) = '' Then
    Begin
        MsgDlg('Unidade de Custeio não preenchido','Erro',mtError,[mbOk],0);
        dblcUnCusteio.SetFocus;
        ModalResult := MrNone;
    End
  Else
    Begin
        ModalResult := MrOk;
        FazerQry;
    End;
end;

end.

