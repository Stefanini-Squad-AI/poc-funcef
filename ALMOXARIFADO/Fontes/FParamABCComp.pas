unit FParamABCComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, TREdit, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamABCComp = class(TfrmOkCancelar)
    qryGrpProd: TwwQuery;
    Grp: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedPercA: TRealEdit;
    dbedPercB: TRealEdit;
    dbedPercC: TRealEdit;
    rgImprimir: TRadioGroup;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    GrpDatas: TGroupBox;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    Label4: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamABCComp: TFrmParamABCComp;

implementation

{$R *.DFM}

Uses DRptRelats, uMensErro, uSistema;

procedure TFrmParamABCComp.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrpProd.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

Procedure TFrmParamABCComp.FazQry;
var
     rPercAcu : Double;
Begin
    DtmRptRelats.LbPer17.Caption  := 'De '+ edDataI.Text +'  a  '+ edDataF.Text +' ';
    DtmRptRelats.LbGrupo3.Caption := 'Todos';
    With DtmRptRelats.qryABCComp Do
       Begin
            Close;
            Sql.Clear;
            Sql.add(' SELECT                                                                         ');
            Sql.add('       ''A'' AS GRUPO,                                                          ');
            Sql.add('       (0) AS PERCACU,                                                          ');
            Sql.add('       M.CODARTIGO,                                                             ');
            Sql.add('       (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCICAO,  ');
            Sql.add('       P.CODMEDCUSTO,                                                           ');
            Sql.add('       SUM(M.QTDEMOV) AS SALDO,                                                 ');
            Sql.add('       SUM(M.VALORMOV) AS VALOR,                                                ');
            Sql.add('       ((SUM(M.VALORMOV)/SUB.VALORTOT)*100) AS PERC,                            ');
            Sql.add('       SUB.VALORTOT                                                             ');
            Sql.add(' FROM                                                                           ');
            Sql.add('      MOVIMENT M,                                                               ');
            Sql.add('      ARTIGO A,                                                                 ');
            Sql.add('      PRODUTO P,                                                                ');
            Sql.add('      ( SELECT SUM(VALORMOV) AS VALORTOT                                        ');
            Sql.add('        FROM MOVIMENT                                                           ');
            Sql.add('        WHERE                                                                   ');
            Sql.add('               (CODTIPOMOV = ''A'')                                             ');
            Sql.add('           AND (DATAMOV >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))');
            Sql.add('           AND (DATAMOV <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))');
            Sql.Add('           AND (IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
            Sql.add('      ) SUB                                                                     ');
            Sql.add(' WHERE                                                                          ');
            Sql.add('        (M.CODTIPOMOV = ''A'')                                                  ');
            Sql.add('    AND (M.DATAMOV >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
            Sql.add('    AND (M.DATAMOV <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
            Sql.Add('    AND (M.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
        If Trim(dblcGrpProd.Text) <> '' Then
           Begin
              Sql.Add('       AND (RTRIM(P.CODGRUPOPROD) LIKE '''+trim(dblcGrpProd.LookupValue)+'%'')');
              DtmRptRelats.LbGrupo3.Caption := dblcGrpProd.Text;
           End;
            Sql.add('    AND (M.CODARTIGO  = A.CODARTIGO)                                            ');
            Sql.add('    AND (A.CODPRODUTO = P.CODPRODUTO)                                           ');
            Sql.add(' GROUP BY                                                                       ');
            Sql.add('       M.CODARTIGO,                                                             ');
            Sql.add('       (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO),              ');
            Sql.add('       P.CODMEDCUSTO,                                                           ');
            Sql.add('       SUB.VALORTOT                                                             ');
            Sql.add(' ORDER BY  VALOR DESC  ');
            Open;
            //
            rPercAcu := 0;
            First;
            While Not Eof Do
               Begin
                   rPercAcu := rPercAcu + FieldByName('PERC').AsFloat;
                   Edit;
                   FieldByName('PERCACU').AsFloat := rPercAcu;
                   If rPercAcu <= dbedPercA.Value Then
                      FieldByName('GRUPO').AsString := 'A'
                   Else
                   If (rPercAcu > dbedPercA.Value) And (rPercAcu <= dbedPercB.Value) Then
                      FieldByName('GRUPO').AsString := 'B'
                   Else
                   If (rPercAcu > dbedPercB.Value) And (rPercAcu <= dbedPercC.Value) Then
                      FieldByName('GRUPO').AsString := 'C'
                   Else
                      FieldByName('GRUPO').AsString := 'D';
                   Post;
                   Next;
               End;
            Case RgImprimir.ItemIndex of
                1 : Begin
                        First;
                        While Not Eof Do
                           Begin
                              If FieldByName('GRUPO').AsString <> 'A' Then
                                 Delete
                              Else
                                 Next;
                           End;
                    End;
                2 : Begin
                        First;
                        While Not Eof Do
                           Begin
                              If (FieldByName('GRUPO').AsString <> 'A') And (FieldByName('GRUPO').AsString <> 'B') Then
                                 Delete
                              Else
                                 Next;
                           End;
                    End;
                3 : Begin
                        First;
                        While Not Eof Do
                           Begin
                              If FieldByName('GRUPO').AsString = 'D' Then
                                 Delete
                              Else
                                 Next;
                           End;
                    End;
            End;
       End;
End;

procedure TFrmParamABCComp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DtmRptRelats.qryABCComp.Filtered      := False;
  DtmRptRelats.qryABCComp.FilterOptions := [];
  DtmRptRelats.qryABCComp.Filter        := '';
end;

procedure TFrmParamABCComp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
    If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de Início não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If (edDataI.Date  > edDataF.Date ) Then
     Begin
        MsgDlg('Data de inicio não pode ser maior que a data final','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
    Begin
        ModalResult := mrOK;
        FazQry;
    End;
end;

end.
