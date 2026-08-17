unit FParamNotaDifOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamNotaDifOC = class(TfrmOkCancelar)
    gbDatas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    rgComparar: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamNotaDifOC: TFrmParamNotaDifOC;

implementation

{$R *.DFM}

{ TFrmParamNotaDifOC }

Uses DRptRelats, uMensErro, uSistema;

procedure TFrmParamNotaDifOC.FazRel;
begin
   DtmRptRelats.lbPer20.Caption := ' De '+EdDataINI.Text+ ' a '+EdDataFIM.Text +' ';

   With DtmRptRelats.qryNotaDifOC Do
    Begin
        Close;
        Sql.Clear;
        Sql.Append('SELECT                                                        ');
        Sql.Append('     INF.IDITEMOC,                                            ');
        Sql.Append('     INF.CODARTIGO,                                           ');
        Sql.Append('     O.NUMOC,                                                 ');
        Sql.Append('     IO.CODMEDIDA,                                            ');
        Sql.Append('     (TO_CHAR(NF.NUMNF) || ''/'' || NF.COMPLNF) AS NUMNOTA,   ');
        Sql.Append('     ROUND(IO.VALORUN,2) AS VALOROC,                          ');
        Sql.Append('     ROUND((INF.VLRUNITARIO/CR.FATOR*CM.FATOR),2) AS VALORNF, ');
        Sql.Append('     ROUND(IO.QTDEPEDIDA,2) AS QTDEOC,                        ');
        Sql.Append('     ROUND((INF.QTDERECEBDEVOL*CR.FATOR/CM.FATOR),2) AS QTDENF,');
        Sql.Append('     P.DESCPROD,                                               ');
        Sql.Append('     PE.RAZAOSOCIAL,                                           ');
        Sql.Append('     NF.DATAENTDEVOL                                           ');
        Sql.Append('FROM                                                           ');
        Sql.Append('     ITENSRECEBDEVOL INF,                                      ');
        Sql.Append('     PESSOA PE,                                                ');
        Sql.Append('     NFRECEBDEVOL NF,                                          ');
        Sql.Append('     ITEMOC IO,                                                ');
        Sql.Append('     OC O,                                                     ');
        Sql.Append('     ARTIGO A,                                                 ');
        Sql.Append('     PRODUTO P,                                                ');
        Sql.Append('     CONVER CR,                                                ');
        Sql.Append('     CONVER CM                                                 ');
        Sql.Append('WHERE                                                          ');
        Sql.Append('      (NF.FLGTIPONOTA = ''R'' )                                ');
        Sql.Append('  AND (NF.DATAENTDEVOL >= TO_DATE('''+DateToStr(EdDataINI.Date)+''',''dd/mm/yyyy''))');
        Sql.Append('  AND (NF.DATAENTDEVOL <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy''))');
        Sql.Append('  AND (INF.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL) ');
        Sql.Append('  AND (INF.IDITEMOC = IO.IDITEMOC)             ');
        Sql.Append('  AND (O.NUMOC = IO.NUMOC)                     ');
        Sql.Append('  AND (PE.IDPESSOA = NF.IDFORCLI)              ');
        Sql.Append('  AND (A.CODARTIGO = INF.CODARTIGO)            ');
        Sql.Append('  AND (A.CODPRODUTO = P.CODPRODUTO)            ');
        Sql.Append('  AND (CR.CODMEDIDA = INF.CODMEDIDA)           ');
        Sql.Append('  AND (CR.CODPRODUTO = P.CODPRODUTO)           ');
        Sql.Append('  AND (IO.CODMEDIDA = CM.CODMEDIDA)            ');
        Sql.Append('  AND (CM.CODPRODUTO = P.CODPRODUTO)           ');
        Case rgComparar.ItemIndex Of
           0 : Sql.Append('  AND (ROUND(IO.QTDEPEDIDA,2) <> ROUND((INF.QTDERECEBDEVOL*CR.FATOR/CM.FATOR),2))');
           1 : Sql.Append('  AND (ROUND(IO.VALORUN,2) <> ROUND((INF.VLRUNITARIO/CR.FATOR*CM.FATOR),2))');
           2 : Sql.Append('  AND ((ROUND(IO.VALORUN,2) <> ROUND((INF.VLRUNITARIO/CR.FATOR*CM.FATOR),2)) OR (ROUND(IO.QTDEPEDIDA,2) <> ROUND((INF.QTDERECEBDEVOL*CR.FATOR/CM.FATOR),2)))');
        End;
        Sql.Append('ORDER BY O.NUMOC, P.DESCPROD ');
        Open;
    End;
end;

procedure TFrmParamNotaDifOC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edDataIni.Text) = '' Then
     Begin
      MsgDlg('Data de início não preenchida','Erro',mtError,[mbOK],0);
      edDataIni.SetFocus;
      ModalResult := MrNone;
     End
  Else
  if Trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data de início não preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
         ModalResult := MrNone;
     End
  Else
  if edDataFim.Date < edDataIni.Date Then
     Begin
         MsgDlg('Data de início não poder ser maior que a final','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
         ModalResult := MrNone;
     End
  Else
     Begin
       FazRel;
       ModalResult := MrOk;
     End;
end;

procedure TFrmParamNotaDifOC.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date;
  edDataFim.Date := Date;

end;

end.
