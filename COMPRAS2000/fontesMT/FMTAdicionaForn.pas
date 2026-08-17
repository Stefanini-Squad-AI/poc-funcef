{*******************************************************************************
  Alterações:
********************************************************************************
 Rotinas   : JaExiteForn           DAVID -  - Pendência
 Data      : 30/01/2003
 Autor     : David Ayrolla
 Pendência : 15940
 Descrição : Correção do problema que ocorria quando associava-se um fornecedor
             ao mesmo produto duas vezes, na mesma operação.
--------------------------------------------------------------------------------}

unit FMTAdicionaForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CMProcuraSubTipo,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, DBTables, Wwquery, uCMTypes,
  wwclient,FMtMontaProcesso;

type
  TfrmMTAdicionaForn = class(TfrmOkCancelar)
    Panel7: TPanel;
    Panel4: TPanel;
    grdItem: TwwDBGrid;
    Panel5: TPanel;
    cmpfNovoForn: TCMProcuraForCli;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    ds: TwwDataSource;
    cds: TwwClientDataSet;
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure cmpfNovoFornExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Function JaExiteForn(idx : Integer; IdForCli: Double; CodArtigo: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmMTAdicionaForn: TfrmMTAdicionaForn;

implementation

{$R *.DFM}

Uses uMensErro;

procedure TfrmMTAdicionaForn.btnTodasClick(Sender: TObject);
begin
  inherited;
  cds.DisableControls;
  Try

   cds.First;
   While Not cds.EOF Do
     Begin
        cds.Edit;
        cds.FieldByName('ATRIBUIDO').AsString := 'S';
        cds.Post;
        cds.Next;
     End;
  Finally
     cds.EnableControls;
  End;
end;

procedure TfrmMTAdicionaForn.btnInverterClick(Sender: TObject);
begin
  inherited;
  cds.DisableControls;
  Try
   cds.First;
   While Not cds.EOF Do
     Begin
        cds.Edit;
        If cds.FieldByName('ATRIBUIDO').AsString = 'S' Then
           cds.FieldByName('ATRIBUIDO').AsString := 'N'
        Else
           cds.FieldByName('ATRIBUIDO').AsString := 'S';
        cds.Post;
        cds.Next;
     End;
  Finally
     cds.EnableControls;
  End;
end;

procedure TfrmMTAdicionaForn.cmpfNovoFornExit(Sender: TObject);
begin
  inherited;
  If ActiveControl.Tag <> 99 then
     Begin
        if cmpfNovoForn.Valida <> VcOK Then
           cmpfNovoForn.SetFocus;

     End;
end;

procedure TfrmMTAdicionaForn.bbtnConfirmarClick(Sender: TObject);
Var
   x             : Integer;
   idx           : Integer;
   btemRestricao : Boolean;
begin
   cds.First;
   While Not cds.Eof Do
      Begin
         If (cds.FieldByName('ATRIBUIDO').asString = 'S') Then
            Begin
               idx := -1;
               For x := 0 To FrmMtMontaProcesso.LstFornecedor.Count - 1 Do
                 If (TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[x]).Tag = cds.FieldByName('IDPROCXART').AsInteger) Then
                    Begin
                      Idx := x;
                      break;
                    End;
               If Not JaExiteForn (idx,cmpfNovoForn.ForCliReg.Id, cds.FieldByName('CODARTIGO').AsString ) Then
                  Begin
                     btemRestricao := False;
                     If FrmMtMontaProcesso.TestaRestricao(cmpfNovoForn.ForCliReg.Id,
                                                          cmpfNovoForn.ForCliReg.RazaoSocial,
                                                          Cds.FieldByName('CODARTIGO').AsString,True) = 'N'
                     Then
                        Begin
                           btemRestricao := True;
                        End
                     Else
                        Begin
                           FrmMtMontaProcesso.cdsNovoForn.Append;
                           FrmMtMontaProcesso.cdsNovoForn.FieldByName('CODARTIGO').AsString := cds.FieldByName('CODARTIGO').AsString;
                           FrmMtMontaProcesso.cdsNovoForn.FieldByName('IDFORCLI').AsFloat   := cmpfNovoForn.ForCliReg.Id;
                           FrmMtMontaProcesso.cdsNovoForn.Post;
                        End;
                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).Append;
                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).FieldByName('IDFORCLI').AsFloat     := cmpfNovoForn.ForCliReg.Id;
                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).FieldByName('CODPROCESSO').AsFloat  := -1;
                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).FieldByName('IDPROCXART').AsFloat   := cds.FieldByName('IDPROCXART').AsFloat;
                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).FieldByName('RAZAOSOCIAL').asString := cmpfNovoForn.ForCliReg.RazaoSocial;

                     If btemRestricao Then
                        TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).FieldByName('STATUS').AsString := 'N'
                     Else
                        TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).FieldByName('STATUS').AsString := 'S';

                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[idx]).Post;
                     TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).IndexFieldNames := 'RAZAOSOCIAL';
                  End;
            End;
         cds.Next;
      End;
  inherited;
end;

function TfrmMTAdicionaForn.JaExiteForn(idx : Integer; IdForCli: Double; CodArtigo: String): Boolean;
begin
   TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).DisableControls;
   Try
      TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).Filter := ' IDFORCLI = '+FloatToStr(IdForCli)+
                                                                        ' AND CODARTIGO = '+QuotedStr(CodArtigo);

      TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).Filtered := True;

      Result := Not TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).IsEmpty;


      if not Result then
      begin
        FrmMtMontaProcesso.cdsNovoForn.DisableControls;
        FrmMtMontaProcesso.cdsNovoForn.Filter := ' IDFORCLI = ' + FloatToStr( IdForCli ) +
                                                 ' AND CODARTIGO = ' + QuotedStr( CodArtigo );
        FrmMtMontaProcesso.cdsNovoForn.Filtered := True;
        Result := Not FrmMtMontaProcesso.cdsNovoForn.IsEmpty;
      end;

   Finally
      TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).Filter   := '';
      TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).Filtered := False;
      TwwClientDataSet(FrmMtMontaProcesso.LstFornecedor[Idx]).EnableControls;


      FrmMtMontaProcesso.cdsNovoForn.Filter   := '';
      FrmMtMontaProcesso.cdsNovoForn.Filtered := False;
      FrmMtMontaProcesso.cdsNovoForn.EnableControls;
   End;

end;

end.
