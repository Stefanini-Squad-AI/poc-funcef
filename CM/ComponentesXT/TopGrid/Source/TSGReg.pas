{*******************************************************}
{                                                       }
{     Top Support Visual Components                     }
{     TopGrid components and editors registration unit  }
{                                                       }
{     Copyright (c) 1999, Top Support                   }
{                                                       }
{*******************************************************}

unit TSGReg;

interface

uses
    TSGrid, TSDBGrid, TSMask, TSImageList, TSDateTime,
    TSEditor, TSImagelistEditor, TSDateTimeEditor;

procedure Register;

implementation

uses
    Classes, DsgnIntf, Controls;

procedure Register;
begin
    RegisterComponents('TopGrid', [TtsGrid]);
    RegisterComponents('TopGrid', [TtsDBGrid]);
    RegisterComponents('TopGrid', [TtsMaskDefs]);
    RegisterComponents('TopGrid', [TtsImageList]);
    RegisterComponents('TopGrid', [TtsDateTimeDef]);

    RegisterPropertyEditor(TypeInfo(string), TtsCol, 'FieldName', TStringProperty);
    RegisterPropertyEditor(TypeInfo(TDate), TtsDateTimeDefProps, 'MinDate', TtsDateTimeDateProperty);
    RegisterPropertyEditor(TypeInfo(TDate), TtsDateTimeDefProps, 'MaxDate', TtsDateTimeDateProperty);

    RegisterComponentEditor(TtsBaseGrid, TtsGridEditor);
    RegisterPropertyEditor(TypeInfo(TtsImageCollection), TtsImageList, '', TtsImageCollectionEditor);
    RegisterComponentEditor(TtsImageList, TtsImageListEditor);
    RegisterComponentEditor(TtsDateTimeDef, TtsDateTimeEditor);
end;

end.
