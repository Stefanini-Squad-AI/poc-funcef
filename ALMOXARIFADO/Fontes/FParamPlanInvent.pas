{-------------------------------------------------------------------------------
 Data       : 22.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22579
 Descrição  : Adicionei checkbox para imprimir itens com saldo zero
              Adicionei checkBox para imprimir somente itens ativos
---------------------------------------------------------------------------------}

unit FParamPlanInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, 
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamPlanInvent = class(TfrmOkCancelar)
    qryAlmox: TwwQuery;
    dblcAlmox: TwwDBLookupCombo;
    Label3: TLabel;
    RgOrd: TRadioGroup;
    dblcInvent: TwwDBLookupCombo;
    Label1: TLabel;
    Data: TCMDateTimePicker;
    Label2: TLabel;
    qryInvent: TwwQuery;
    chkEstoque: TCheckBox;
    chkSaldoZero: TCheckBox;
    chkAtivos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dblcInventCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPlanInvent: TfrmParamPlanInvent;

implementation

{$R *.DFM}
Uses uMensErro, uSistema, DRptRelats, uModulo;
procedure TfrmParamPlanInvent.FormCreate(Sender: TObject);
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
                       '       And idPessoa = ' + IntToStr( Sistema.idEmpresa );
  qryInvent.Open;

  RgOrd.ItemIndex := 0;

end;

procedure TfrmParamPlanInvent.dblcInventCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcInvent.Text) <> '' Then
     Data.Date := StrToDate(qryInvent.FieldByName('DataInventario').AsString);
end;

procedure TfrmParamPlanInvent.bbtnConfirmarClick(Sender: TObject);
Begin
  If Trim(dblcAlmox.Text) = '' Then
     Begin
          MsgDlg('Almoxarifado não foi preenchido','Erro',MtError,[mbOk],0);
          Exit;
     End;
              With DtmRptRelats.qryPlanInvent Do
                   Begin
                       Close;
                       Sql.Text := ' Select  ' +

                                   '       I.IdInventario,   ' +
                                   '       I.DataInventario, ' +
                                   '       D.CodArtigo,      ' +
                                   '       S.Localizacao,    ' +
                                   '       P.CodGrupoProd,   ' +
                                   '       P.CODMEDCUSTO,    ' +
                                   '       (P.DescProd || '' '' || A.CodTamanho || '' '' || A.CodCor) as Descricao ' +
                                   '  From            ' +
                                   '      Inventar I, ' +
                                   '      QtdeCont D, ' +
                                   '      Produto P,  ' +
                                   '      Artigo A,   ' +
                                   '      Saldo S     ' +
                                   '  Where           ' +
                                   '      (I.ContagemEncerrada = ''F'')   ' +
                                   '      And (S.CodAlmoxarifado = ' +dblcAlmox.LookUpValue  +')'+
                                   '      And (I.CodAlmoxarifado = ' +dblcAlmox.LookUpValue  +')'+
                                   '      And (I.IdPessoa = '+ IntToStr( Sistema.IdEmpresa ) +')'+
                                   '      And (S.IdPessoa = '+ IntToStr( Sistema.IdEmpresa )+')';
                       If chkEstoque.Checked Then
                          Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');
                       If Trim(dblcInvent.Text) <> '' Then
                          Sql.Add(' And I.idInventario = '+dblcInvent.LookUpValue )
                       Else
                       If Trim(Data.Text) <> '' Then
                          Sql.Add(' And I.DataInventario = To_Date('''+Data.Text+''',''dd/mm/yyyy'')');

                       Sql.Add(' And I.idInventario = D.idInventario ' +
                               ' And A.CodArtigo = D.CodArtigo       ' +
                               ' And A.CodArtigo = S.CodArtigo(+)    ' +
                               ' And P.CodProduto =  A.CodProduto    ' );

                       //imprime saldos zerados
                       if chkSaldoZero.Checked then
                          SQL.Add(' and S.SALDOQTDE = 0              ' )
                       else
                          SQL.Add(' and S.SALDOQTDE <> 0             ' );


                       //Imprime somente os ativos
                       if chkAtivos.Checked then
                          SQL.Add(' and A.FLGATIVO = ''S''            ' );


                       Case RgOrd.ItemIndex Of
                           0 : Sql.Add(' Order By I.IdInventario, D.CodArtigo ');
                           1 : Sql.Add(' Order By I.IdInventario, Descricao   ');
                           2 : Sql.Add(' Order By I.IdInventario, P.CodGrupoProd ');
                           3 : Sql.Add(' Order By I.IdInventario, S.Localizacao ');
                       End;
                       DtmRptRelats.lbAlmoxPI.Text := dblcAlmox.Text;
                       Open;
                   End;
  inherited;
end;

procedure TfrmParamPlanInvent.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
  IF Trim(dblcAlmox.Text) = '' Then
     Begin
         qryInvent.Close;
         qryInvent.Sql.Text :=' Select IdInventario, DataInventario, AbertoFechado ' +
                              ' From Inventar ' +
                              ' Where (ContagemEncerrada = ''F'')' +
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

procedure TfrmParamPlanInvent.FormShow(Sender: TObject);
begin
  inherited;
  dblcAlmox.SetFocus;
end;

end.
