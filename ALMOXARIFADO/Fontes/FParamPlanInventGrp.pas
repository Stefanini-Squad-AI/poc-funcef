unit FParamPlanInventGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamPlanInventGrp = class(TfrmOkCancelar)
    qryInvent: TwwQuery;
    qryAlmox: TwwQuery;
    Label3: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label1: TLabel;
    dblcInvent: TwwDBLookupCombo;
    Data: TCMDateTimePicker;
    Label2: TLabel;
    chkEstoque: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcInventCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamPlanInventGrp: TFrmParamPlanInventGrp;

implementation

{$R *.DFM}
Uses uMensErro, uSistema, DRptRelats;
procedure TFrmParamPlanInventGrp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcAlmox.Text) = '' Then
     Begin
          MsgDlg('Almoxarifado não foi preenchido','Erro',MtError,[mbOk],0);
          Exit;
     End;
            With DtmRptRelats.qryPlanInventGrp Do
                   Begin
                       Close;
                       Sql.Text := ' Select  ' +
                                   '       I.IdInventario,   ' +
                                   '       I.DataInventario, ' +
                                   '       D.CodArtigo,      ' +
                                   '       S.Localizacao,    ' +
                                   '       G.DescGrupoProd,  ' +
                                   '       P.CODMEDCUSTO,    '+
                                   '       P.CodGrupoProd,   ' +
                                   '       (P.DescProd || '' '' || A.CodTamanho || '' '' || A.CodCor) as Descricao ' +
                                   '  From             ' +
                                   '      Inventar I,  ' +
                                   '      QtdeCont D,  ' +
                                   '      GrupProd G,  ' +
                                   '      Produto P,   ' +
                                   '      Artigo A,    ' +
                                   '      Saldo S      ' +
                                   '  Where            ' +
                                   '      (ContagemEncerrada = ''F'')  ' +
                                   '      And (S.CodAlmoxarifado = ' +dblcAlmox.LookUpValue +')'+
                                   '      And (I.CodAlmoxarifado = ' +dblcAlmox.LookUpValue +')'+
                                   '      And (I.IdPessoa = '+ IntToStr( Sistema.IdEmpresa ) +')'+
                                   '      And (S.IdPessoa = '+ IntToStr( Sistema.IdEmpresa )+')';
                       If chkEstoque.Checked Then
                          Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');
                       If Trim(dblcInvent.Text) <> '' Then
                          Sql.Add(' And (I.idInventario = '+dblcInvent.LookUpValue+')')
                       Else
                       If Trim(Data.Text) <> '' Then
                          Sql.Add(' And (I.DataInventario = To_Date('''+Data.Text+''',''dd/mm/yyyy''))');

                       Sql.Add(' And (I.idInventario = D.idInventario) ' +
                               ' And (A.CodArtigo = D.CodArtigo)       ' +
                               ' And (A.CodArtigo = S.CodArtigo(+))    ' +
                               ' And (P.CodGrupoProd = G.CodGrupoProd) ' +
                               ' And (P.CodProduto =  A.CodProduto)    ' );
                       Sql.Add(' Order By I.IdInventario, P.CodGrupoProd,Descricao ');
                      Open;
                      DtmRptRelats.lbAlmox5.Caption := dblcAlmox.Text;
                   End;
end;

procedure TFrmParamPlanInventGrp.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
  IF Trim(dblcAlmox.Text) = '' Then
     Begin
            qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                              ' From Inventar ' +
                              ' Where (ContagemEncerrada = ''F'') '+
                              '   And (idPessoa = ' + IntToStr( Sistema.idEmpresa )+ ')';
         qryInvent.Open;
     End
  Else
     Begin
         qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                              ' From Inventar ' +
                              ' Where (ContagemEncerrada = ''F'')  ' +
                              '   And (idPessoa = ' + IntToStr( Sistema.idEmpresa )+ ')'+
                              '   And (CodAlmoxarifado = ' +dblcAlmox.LookUpValue + ')';
         qryInvent.Open;
     End;
end;

procedure TFrmParamPlanInventGrp.FormShow(Sender: TObject);
begin
  inherited;
  dblcAlmox.SetFocus;
end;

procedure TFrmParamPlanInventGrp.dblcInventCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcInvent.Text) <> '' Then
     Data.Date := StrToDate(qryInvent.FieldByName('DataInventario').AsString);
end;

procedure TFrmParamPlanInventGrp.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.SQL.Text:='SELECT DescAlmox,CodAlmoxarifado FROM ALMOX WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa);
  qryAlmox.Open;
  //
  qryInvent.Close;
  qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                       ' From Inventar ' +
                       ' Where (ContagemEncerrada = ''F'')  ' +
                       '   And (idPessoa = ' + IntToStr( Sistema.idEmpresa ) + ')';
  qryInvent.Open;

end;

end.
