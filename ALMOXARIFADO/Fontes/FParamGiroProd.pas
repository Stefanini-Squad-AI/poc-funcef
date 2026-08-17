unit FParamGiroProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook ;

type
  TFrmParamGiroProd = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    qryGrpProd: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    Label2: TLabel;
    edDataIni1: TCMDateTimePicker;
    Label1: TLabel;
    edDataFim1: TCMDateTimePicker;
    Label4: TLabel;
    edDataIni2: TCMDateTimePicker;
    edDataFim2: TCMDateTimePicker;
    Label7: TLabel;
    edDataIni3: TCMDateTimePicker;
    Label8: TLabel;
    edDataFim3: TCMDateTimePicker;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

  Procedure FazRel;
  
  public
    { Public declarations }
  end;

var
  FrmParamGiroProd: TFrmParamGiroProd;

implementation

{$R *.DFM}

uses DRptRelats, uMensErro, uSistema, uModulo;

procedure TFrmParamGiroProd.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni1.Date := Date-90;
  edDataFim1.Date := Date-90;
  edDataIni2.Date := Date-60;
  edDataFim2.Date := Date-60;
  edDataIni3.Date := Date-30;
  edDataFim3.Date := Date-30;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
end;

Procedure TFrmParamGiroProd.FazRel;
Var
   nDias1 : Double;
   nDias2 : Double;
   nDias3 : Double;
Begin
    nDias1 := (EdDataFim1.Date - EdDataIni1.Date) + 1;
    nDias2 := (EdDataFim2.Date - EdDataIni2.Date) + 1;
    nDias3 := (EdDataFim3.Date - EdDataIni3.Date) + 1;
    DtmRptRelats.lbPeriodo1.Caption := 'Período 1º : De '+EdDataINI1.Text+ ' a '+EdDataFIM1.Text +' ';
    DtmRptRelats.lbPeriodo2.Caption := 'Período 2º : De '+EdDataINI2.Text+ ' a '+EdDataFIM2.Text +' ';
    DtmRptRelats.lbPeriodo3.Caption := 'Período 3º : De '+EdDataINI3.Text+ ' a '+EdDataFIM3.Text +' ';
    DtmRptRelats.lbGrupo8.Caption   := 'Todos';
    With DtmRptRelats.qryGiroProd Do
       Begin
           Close;
           Sql.Clear;
           Sql.Add(' SELECT               ');
           Sql.Add('      G.CODGRUPOPROD, ');
           Sql.Add('      G.DESCGRUPOPROD,');
           Sql.Add('      A.CODARTIGO,    ');
           Sql.Add('      P.CODMEDCUSTO,  ');
           Sql.Add('      C.CUSTOMEDIO,  ');           
           Sql.Add('      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
           Sql.Add('      DECODE(CM1.CONSMED1,NULL,0,CM1.CONSMED1) AS CONSMED1,  ');
           Sql.Add('      DECODE(CM2.CONSMED2,NULL,0,CM2.CONSMED2) AS CONSMED2,  ');
           Sql.Add('      DECODE(CM3.CONSMED3,NULL,0,CM3.CONSMED3) AS CONSMED3,  ');
           Sql.Add('     (DECODE(CM1.CONSMED1,NULL,0,CM1.CONSMED1)+              ');
           Sql.Add('      DECODE(CM2.CONSMED2,NULL,0,CM2.CONSMED2)+              ');
           Sql.Add('      DECODE(CM3.CONSMED3,NULL,0,CM3.CONSMED3) )/3 AS MEDIA  ');
           Sql.Add(' FROM                   ');
           Sql.Add('      (SELECT           ');
           Sql.Add('            M.CODARTIGO,');
           Sql.Add('            ((SUM(M.QTDEMOV)* -1)/'+FloatToStr(nDias1)+') AS CONSMED1, ');
           Sql.Add('            (SUM(QTDEMOV)* -1) AS CONSTOT ');
           Sql.Add('       FROM ');
           Sql.Add('            MOVIMENT M ');
           Sql.Add('       WHERE ');
           Sql.Add('            (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''A'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''K'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''Z'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''S'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''B'') ');
           Sql.Add('        AND (M.DATAMOV >= TO_DATE('''+DateToStr(EdDataINI1.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('        AND (M.DATAMOV <= TO_DATE('''+DateToStr(EdDataFIM1.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('       GROUP BY M.CODARTIGO ) CM1, ');
           Sql.Add('      (SELECT           ');
           Sql.Add('            M.CODARTIGO,');
           Sql.Add('            ((SUM(M.QTDEMOV)* -1)/'+FloatToStr(nDias2)+') AS CONSMED2, ');
           Sql.Add('            (SUM(QTDEMOV)* -1) AS CONSTOT ');
           Sql.Add('       FROM ');
           Sql.Add('            MOVIMENT M ');
           Sql.Add('       WHERE ');
           Sql.Add('            (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''A'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''K'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''Z'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''S'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''B'') ');
           Sql.Add('        AND (M.DATAMOV >= TO_DATE('''+DateToStr(EdDataINI2.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('        AND (M.DATAMOV <= TO_DATE('''+DateToStr(EdDataFIM2.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('       GROUP BY M.CODARTIGO ) CM2, ');
           Sql.Add('      (SELECT           ');
           Sql.Add('            M.CODARTIGO,');
           Sql.Add('            ((SUM(M.QTDEMOV)* -1)/'+FloatToStr(nDias3)+') AS CONSMED3, ');
           Sql.Add('            (SUM(QTDEMOV)* -1) AS CONSTOT ');
           Sql.Add('       FROM ');
           Sql.Add('            MOVIMENT M ');
           Sql.Add('       WHERE ');
           Sql.Add('            (M.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''A'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''K'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''Z'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''S'') ');
           Sql.Add('        AND (M.CODTIPOMOV <> ''B'') ');
           Sql.Add('        AND (M.DATAMOV >= TO_DATE('''+DateToStr(EdDataINI3.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('        AND (M.DATAMOV <= TO_DATE('''+DateToStr(EdDataFIM3.Date)+''',''dd/mm/yyyy'')) ');
           Sql.Add('       GROUP BY M.CODARTIGO ) CM3, ');
           Sql.Add('       ARTIGO A,   ');
           Sql.Add('       PRODUTO P,  ');
           Sql.Add('       GRUPPROD G, ');
           Sql.Add('       SALDO S,    ');
           Sql.Add('       CUSTOMED C  ');
           Sql.Add(' WHERE  ');
           Sql.Add('       (A.CODPRODUTO  = P.CODPRODUTO) ');
           If TRim(dblcGrpProd.Text) <> ''   Then
               Begin
                  sql.Add(' AND (RTRIM(G.CODGRUPOPROD) LIKE '''+Trim(dblcGrpProd.LookUpValue)+''' || ''%'' ) ');
                  DtmRptRelats.lbGrupo8.Caption := dblcGrpProd.Text;
               End;
              Sql.Add('   AND (S.CODALMOXARIFADO ='+dblcAlmox.lookUpValue+' ) ');
              Sql.Add('   AND (C.CODCUSTEIO = '+IntToStr(Modulo.LeUnCusteio(StrtoInt(dblcAlmox.LookUpValue)))+')  ');
              Sql.Add('   AND (P.CODGRUPOPROD = G.CODGRUPOPROD)');
              Sql.Add('   AND (A.CODARTIGO = CM1.CODARTIGO(+))  ');
              Sql.Add('   AND (A.CODARTIGO = CM2.CODARTIGO(+))  ');
              Sql.Add('   AND (A.CODARTIGO = CM3.CODARTIGO(+))  ');
              Sql.Add('   AND (A.CODARTIGO = C.CODARTIGO)  ');
              Sql.Add('   AND (A.CODARTIGO = S.CODARTIGO)  ');
           Case RgOrdem.ItemIndex Of
               0 : Sql.Add('ORDER BY G.CODGRUPOPROD,(P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO )');
               1 : Sql.Add('ORDER BY G.CODGRUPOPROD, A.CODARTIGO');
               2 : Sql.Add('ORDER BY G.CODGRUPOPROD, MEDIA');
           End;
           Open;
       End;
End;



procedure TFrmParamGiroProd.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOk],0);
        dblcAlmox.SetFocus;
        ModalResult := MrNone;
    End
  Else
  If EdDataFim1.Date < EdDataIni1.Date Then
     Begin
         MsgDlg('Período 1º : Data de final não pode ser menor do que a data final','Erro',mtError,[mbOK],0);
         EdDataFim1.SetFocus;
         ModalResult := MrNone;
     End
  Else
  If EdDataFim2.Date < EdDataIni2.Date Then
     Begin
         MsgDlg('Período 2º : Data de final não pode ser menor do que a data final','Erro',mtError,[mbOK],0);
         EdDataFim2.SetFocus;
         ModalResult := MrNone;
     End
  Else
  If EdDataFim3.Date < EdDataIni3.Date Then
     Begin
         MsgDlg('Período 3º : Data de final não pode ser menor do que a data final','Erro',mtError,[mbOK],0);
         EdDataFim3.SetFocus;
         ModalResult := MrNone;
     End
  Else
     Begin
         ModalResult := MrOk;
         FazRel;
     End;

end;

end.
