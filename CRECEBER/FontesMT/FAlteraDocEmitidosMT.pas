Unit FAlteraDocEmitidosMT;
{ Atualizações:

Autor    : Alex Pereira
Pend.    : 15465
Data     : 05/11/03
Descrição: Retirado método que apagava a variável CONTROLEREMESSA. Estava dando
           erro ao executar uCtrlAlteraDocEmitido.GravaAlteraDocEmitido


}

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, IvDictio,
  IvMulti, IvEMulti, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlAlteraDocEmitido, uCtrlPadroes;

Type
  TFrmAlteraDocEmitidosMT = Class(TfrmOkCancelar)
    F: TwwDBGrid;
    DsDocEmitidos: TwwDataSource;
    CdsDocEmitidos: TCMClientDataSet;
    SqlDocEmitidos: TCMSqlParams;
    CdsDocEmitidosRAZAOSOCIAL: TStringField;
    CdsDocEmitidosDATAPROGRAMADA: TDateTimeField;
    CdsDocEmitidosNODOCUMENTO: TFloatField;
    CdsDocEmitidosCOMPLDOCUMENTO: TStringField;
    CdsDocEmitidosNOSSONUMERO: TStringField;
    CdsDocEmitidosEMISBLOQ: TStringField;
    CdsDocEmitidosCONTROLEREMESSA: TFloatField;
    CdsDocEmitidosCODDOCUMENTO: TFloatField;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure FormCreate(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure CdsDocEmitidosEMISBLOQChange(Sender: TField);
  private
    { Private declarations }
    CtrlAlteraDocEmitido: TCtrlAlteraDocEmitido;
  public
    reimpressao: boolean;
    listadocs: tstringlist;
    { Public declarations }
  End;

Var
  FrmAlteraDocEmitidosMT: TFrmAlteraDocEmitidosMT;

Implementation

{$R *.DFM}

Procedure TFrmAlteraDocEmitidosMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If reimpressao Then
  Begin
    CdsDocEmitidos.first;
    While Not CdsDocEmitidos.EOF Do
    Begin
      If CdsDocEmitidos.FieldByName('EMISBLOQ').AsString <> 'S' Then
        listadocs.add(CdsDocEmitidos.FieldByName('CODDOCUMENTO').asstring);
      CdsDocEmitidos.next;
    End;
  End
  Else
  Begin
    If (Application.MessageBox('A remessa será alterada. Confirma?', 'Atenção', Mb_YesNo + Mb_IconExclamation) = Id_Yes) Then
      CtrlAlteraDocEmitido.GravaAlteraDocEmitido(CdsDocEmitidos.Data);
  End;
End;

Procedure TFrmAlteraDocEmitidosMT.FCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;
  If (Field.FieldName = 'EMISBLOQ') Then
  Begin
    AFont.Color := clNavy;
    ABrush.Color := $0080FFFF; {Amarelo claro}
  End;
End;

Procedure TFrmAlteraDocEmitidosMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlAlteraDocEmitido := TCtrlAlteraDocEmitido.Create;
  CtrlAlteraDocEmitido.InitializeAs(Padroes);
  reimpressao := false;
  listadocs := tstringlist.create;
End;

Procedure TFrmAlteraDocEmitidosMT.FormDestroy(Sender: TObject);
Begin
  Inherited;
  CtrlAlteraDocEmitido.Free;
  If assigned(listadocs) Then
    listadocs.free;
  listadocs := Nil;
End;

Procedure TFrmAlteraDocEmitidosMT.CdsDocEmitidosEMISBLOQChange(
  Sender: TField);
Begin
  Inherited;
{ by Alex - 05/11/03 - pend 15465
  If CdsDocEmitidosEMISBLOQ.AsString <> 'S' Then
  Begin
    If Not reimpressao Then
      CdsDocEmitidosCONTROLEREMESSA.Clear
  End
  Else
    CdsDocEmitidosCONTROLEREMESSA.AsInteger := CdsDocEmitidos.Params[0].AsInteger;
}
End;

End.

